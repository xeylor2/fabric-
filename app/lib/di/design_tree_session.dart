import 'package:core_asset/core_asset.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_garment/core_garment.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_layer_runtime/core_layer_runtime.dart';
import 'package:core_textile/core_textile.dart';
import 'package:febric/di/garment_content.dart';
import 'package:febric/di/motif_artwork.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// M19 composition-root wiring — the caller seam M9/M10/M11 reserved.
///
/// It constructs the frozen [DocumentEngine], binds its `apply` as the
/// `DocumentCommandSink` of the authorized emission owner ([LayerRuntime]) and
/// exposes to presentation exactly three things: a read-only flattened
/// projection of the design tree, the movement intent entry point, and the
/// engine's own undo/redo.
///
/// It builds no `DocumentCommand` — the owner builds it. It performs no lock,
/// validation, history, inverse, revision or dirty-state work — the frozen
/// engine pipeline does all of it. This class holds references and orders
/// calls (M19-D1 / NDH-1 Form A).
class DesignTreeSession {
  DesignTreeSession({required this.engine})
    : _owner = LayerRuntime(sink: engine.apply);

  /// In-memory M19 session document: one artboard with a small design tree.
  /// No persistence and no document repository is wired in this milestone.
  factory DesignTreeSession.inMemory() =>
      DesignTreeSession(engine: DocumentEngine(document: seedDocument()));

  final DocumentEngine engine;

  /// The single authorized design-node movement emission owner, and (M9) the
  /// owner of layer-command emission.
  final LayerRuntime _owner;

  /// Frozen id seam for new layers (M20). Deterministic within a session; the
  /// frozen reducer rejects a duplicate id.
  final IdGenerator _layerIds = SequentialIdGenerator(prefix: 'layer');

  /// Frozen id seam for new and duplicated design nodes (M21). The same
  /// generator feeds `DesignTreeOps.cloneWithIds`, which is the frozen clone
  /// seam the duplicate command requires.
  final IdGenerator _nodeIds = SequentialIdGenerator(prefix: 'node');

  /// Frozen id seam for instantiated garment roots. The frozen instantiator
  /// derives every part and zone id mechanically from this root id, so one
  /// fresh root id per instantiation keeps a repeated instantiation
  /// collision-free (the frozen "ids are the caller's namespace" doctrine).
  final IdGenerator _garmentIds = SequentialIdGenerator(prefix: 'garment');

  /// Frozen id seam for imported artwork assets. The frozen reducer rejects a
  /// duplicate id, so identity stays the caller's namespace here too.
  final IdGenerator _assetIds = SequentialIdGenerator(prefix: 'asset');

  /// The frozen content-addressed byte store (ADR-0016 rule 2): uploaded
  /// artwork bytes live here exactly once and nowhere else. The document
  /// carries identity + hash only, so no second representation of the artwork
  /// exists and nothing is ever flattened into a node.
  final AssetContentStore artworkStore = InMemoryAssetContentStore();

  /// The frozen Library registry, loaded with the launch garment schemas at
  /// the composition root. Content is injected, never shipped by the engine.
  final GarmentTemplateRegistry _garments = launchGarmentRegistry();

  /// Bumped after every engine interaction so presentation re-reads state.
  final ValueNotifier<int> revision = ValueNotifier<int>(0);

  /// The last frozen [CommandResult], rendered for display only.
  String? lastResult;

  bool get canUndo => engine.canUndo;
  bool get canRedo => engine.canRedo;
  bool get isDirty => engine.isDirty;

  String get artboardId => engine.document.artboards.first.id;

  /// The frozen design-tree root of the session artboard. Read-only.
  DesignNode get _designRoot =>
      engine.document.artboards.first.designTreeRoot;

  /// Flattened rows for the panel: id, label, depth, parent id, sibling index
  /// and — since M21 — the node's visibility, node-lock flag and a rendered
  /// metadata line (null when the node has none). The motif-artwork stage adds
  /// two derived flags read off the frozen metadata carriers: whether the node
  /// is a printed motif (`object_type`) and whether it already references
  /// artwork (`asset_id`). A read-only projection of the frozen document;
  /// primitives only.
  List<
    ({
      String id,
      String label,
      int depth,
      String? parentId,
      int index,
      bool visible,
      bool locked,
      String? metadata,
      bool motif,
      bool hasArtwork,
    })
  >
  get rows {
    final out =
        <
          ({
            String id,
            String label,
            int depth,
            String? parentId,
            int index,
            bool visible,
            bool locked,
            String? metadata,
            bool motif,
            bool hasArtwork,
          })
        >[];
    void walk(DesignNode node, int depth, String? parentId, int index) {
      out.add((
        id: node.id,
        label: node.name,
        depth: depth,
        parentId: parentId,
        index: index,
        visible: node.visible,
        locked: node.locked,
        metadata: node.metadata.isEmpty
            ? null
            : node.metadata.entries.map((e) => '${e.key}=${e.value}').join('; '),
        motif: _isMotif(node),
        // The frozen ADR-0016 reader, not a re-implementation of the key.
        hasArtwork: NodeAssetBinding.assetIdOf(node) != null,
      ));
      for (var i = 0; i < node.children.length; i++) {
        walk(node.children[i], depth + 1, node.id, i);
      }
    }

    walk(_designRoot, 0, null, 0);
    return out;
  }

  /// Whether [node] is a printed motif, by the frozen `object_type`
  /// classification carrier — the same key the previous stage bound and the
  /// render tier already reads (ADR-0019).
  static bool _isMotif(DesignNode node) =>
      node.metadata['object_type'] == TextileObjectType.motif.wireName;

  /// Presentation intent → the authorized owner. Nothing is constructed here.
  CommandResult moveNode(String nodeId, String newParentId, int index) {
    final result = _owner.moveDesignNode(
      artboardId: artboardId,
      nodeId: nodeId,
      newParentId: newParentId,
      index: index,
    );
    _record(result);
    return result;
  }

  // --------------------------------- design-node structural editing (M21)
  // Same discipline as every path above: the composition root forwards
  // primitive operands (plus, where the frozen command demands it, a frozen
  // node value built from frozen seams), the authorized owner builds the
  // command, and the engine does everything else. No DocumentCommand is
  // constructed here, and no reducer decision is pre-empted: node grammar, the
  // capability matrix, empty-name rejection and node-lock rejection all stay
  // engine-owned.

  /// Adds a child design node under [parentNodeId] (appended). The type is the
  /// frozen [DesignNodeType.element]; no type vocabulary is exposed or extended.
  CommandResult createNode(String parentNodeId, String name) => _record(
    _owner.createDesignNode(
      artboardId: artboardId,
      node: DesignNode(
        id: _nodeIds.next(),
        name: name,
        type: DesignNodeType.element,
      ),
      parentNodeId: parentNodeId,
    ),
  );

  CommandResult deleteNode(String nodeId) =>
      _record(_owner.deleteDesignNode(artboardId: artboardId, nodeId: nodeId));

  CommandResult renameNode(String nodeId, String name) => _record(
    _owner.renameDesignNode(
      artboardId: artboardId,
      nodeId: nodeId,
      name: name,
    ),
  );

  CommandResult setNodeVisibility(String nodeId, bool visible) => _record(
    _owner.setNodeVisibility(
      artboardId: artboardId,
      nodeId: nodeId,
      visible: visible,
    ),
  );

  CommandResult setNodeLocked(String nodeId, bool locked) => _record(
    _owner.setNodeLocked(
      artboardId: artboardId,
      nodeId: nodeId,
      locked: locked,
    ),
  );

  /// Sets or clears one open metadata entry on a design node — a null [value]
  /// clears it (frozen reducer semantics). No metadata key vocabulary exists.
  CommandResult setNodeMetadata(String nodeId, String key, Object? value) =>
      _record(
        _owner.setNodeMetadata(
          artboardId: artboardId,
          nodeId: nodeId,
          key: key,
          value: value,
        ),
      );

  /// Duplicates a design node as its next sibling.
  ///
  /// The frozen command carries a pre-cloned subtree with fresh ids, so the
  /// clone is built here through the frozen `DesignTreeOps.cloneWithIds` seam
  /// fed by the frozen [IdGenerator]. When the source id is absent from the
  /// frozen tree there is nothing to clone; a fresh well-formed node is passed
  /// and the frozen reducer rejects on the missing source *before* the operand
  /// is examined, so the rejection stays engine-owned and nothing is inserted.
  CommandResult duplicateNode(String sourceNodeId) {
    final source = _designRoot.findById(sourceNodeId);
    return _record(
      _owner.duplicateDesignNode(
        artboardId: artboardId,
        sourceNodeId: sourceNodeId,
        duplicate: source == null
            ? DesignNode(
                id: _nodeIds.next(),
                name: '',
                type: DesignNodeType.element,
              )
            : DesignTreeOps.cloneWithIds(source, _nodeIds),
      ),
    );
  }

  // ------------------------------------------- layer structural editing (M20)
  // Same discipline as the design-node path: the composition root forwards
  // operands, the owner builds the frozen command, the engine does everything
  // else. Nothing is constructed here.

  /// Flattened layer rows for the panel: id, label, depth, parent id, sibling
  /// index and a rendered metadata line (null when the layer has none).
  List<
    ({
      String id,
      String label,
      int depth,
      String? parentId,
      int index,
      String? metadata,
    })
  >
  get layerRows {
    final out =
        <
          ({
            String id,
            String label,
            int depth,
            String? parentId,
            int index,
            String? metadata,
          })
        >[];
    void walk(LayerModel layer, int depth, String? parentId, int index) {
      out.add((
        id: layer.id,
        label: layer.name,
        depth: depth,
        parentId: parentId,
        index: index,
        metadata: layer.metadata.isEmpty
            ? null
            : layer.metadata.entries
                  .map((e) => '${e.key}=${e.value}')
                  .join('; '),
      ));
      for (var i = 0; i < layer.children.length; i++) {
        walk(layer.children[i], depth + 1, layer.id, i);
      }
    }

    walk(engine.document.artboards.first.layerRoot, 0, null, 0);
    return out;
  }

  /// Adds a child layer under [parentLayerId] (appended). The kind is the
  /// frozen [LayerKind.layer]; no kind vocabulary is exposed or extended.
  CommandResult createLayer(String parentLayerId, String name) => _record(
    _owner.createLayer(
      artboardId: artboardId,
      layer: LayerModel(
        id: _layerIds.next(),
        name: name,
        kind: LayerKind.layer,
      ),
      parentLayerId: parentLayerId,
    ),
  );

  CommandResult deleteLayer(String layerId) =>
      _record(_owner.deleteLayer(artboardId: artboardId, layerId: layerId));

  /// Structural layer movement: same parent + new index reorders, new parent
  /// + index reparents. Ids and an integer index only.
  CommandResult moveLayer(String layerId, String newParentId, int index) =>
      _record(
        _owner.moveLayer(
          artboardId: artboardId,
          layerId: layerId,
          newParentId: newParentId,
          index: index,
        ),
      );

  CommandResult renameLayer(String layerId, String name) => _record(
    _owner.renameLayer(artboardId: artboardId, layerId: layerId, name: name),
  );

  /// Sets or clears one open metadata entry — a null [value] clears it
  /// (frozen reducer semantics). No metadata key vocabulary is defined.
  CommandResult setLayerMetadata(String layerId, String key, Object? value) =>
      _record(
        _owner.setLayerMetadata(
          artboardId: artboardId,
          layerId: layerId,
          key: key,
          value: value,
        ),
      );

  /// The engine's own undo/redo — no separate mechanism exists.
  CommandResult undo() => _record(engine.undo());
  CommandResult redo() => _record(engine.redo());

  // ------------------------------------------- garment composition (stage)
  // The frozen chain, reused end to end and nothing more:
  //   injected GarmentSchema content → SchemaGarmentInstantiator (returns a
  //   frozen DesignNode subtree, emits nothing) → LayerRuntime.createDesignNode
  //   (the M21-authorized emission) → DocumentCommandSink → DocumentEngine.apply.
  // No parallel garment representation, no second write path, no new tier.

  /// The garment types the injected content can instantiate, as primitives for
  /// presentation: the frozen wire name as id, the frozen label for display.
  List<({String id, String label})> get garmentChoices => [
    for (final type in launchGarmentTypes) (id: type.wireName, label: type.label),
  ];

  /// Instantiates the launch schema for [garmentWireName] and lands the whole
  /// frozen subtree under the design-tree root as one authorized
  /// `createDesignNode`. The parts and their canonical order come from the
  /// frozen [GarmentAnatomy]; every id is derived by the frozen instantiator.
  CommandResult instantiateGarment(String garmentWireName) {
    final type = GarmentType.fromWireName(garmentWireName);
    final schema = _garments.schemaFor(launchSchemaId(type));
    if (schema == null) {
      // Unreachable: every launch schema is registered at construction, and
      // `garmentChoices` offers only those. Not a document rejection path.
      throw StateError('No registered garment schema for ${type.wireName}');
    }
    return _record(
      _owner.createDesignNode(
        artboardId: artboardId,
        node: withTextileContent(
          const SchemaGarmentInstantiator().instantiate(
            schema,
            rootId: _garmentIds.next(),
          ),
        ),
      ),
    );
  }

  // ------------------------------- fabric / base + printed motif layers
  // Both are frozen content nodes classified by the frozen `object_type`
  // metadata carrier (ADR-0019 read side). No node↔layer binding is created:
  // the frozen "unrendered lawfulness" guarantee makes binding-free content
  // first-class, so the layer tree stays untouched and ADR-0006 holds.

  /// Adds the substrate cloth under [parentNodeId].
  CommandResult createFabric(String parentNodeId) =>
      _createTextileContent(parentNodeId, TextileObjectType.fabric);

  /// Adds one independently editable printed motif layer under [parentNodeId].
  /// Repeated calls add further motif layers; each is its own node.
  CommandResult createMotif(String parentNodeId) =>
      _createTextileContent(parentNodeId, TextileObjectType.motif);

  CommandResult _createTextileContent(
    String parentNodeId,
    TextileObjectType type,
  ) => _record(
    _owner.createDesignNode(
      artboardId: artboardId,
      node: textileContentNode(id: _nodeIds.next(), type: type),
      parentNodeId: parentNodeId,
    ),
  );

  // ------------------------------- motif artwork upload / replacement (stage)
  // The frozen ADR-0016 composition, reused end to end and nothing more:
  //
  //   artwork bytes → frozen Sha256ContentHasher (pure, mutates nothing)
  //   → LayerRuntime.importAsset  (frozen `importAsset`, the registration)
  //   → LayerRuntime.setNodeMetadata (frozen `asset_id`, the reference)
  //   → DocumentCommandSink → DocumentEngine.apply
  //   → Lock → Validation → History → Document → CommandResult
  //   → frozen AssetContentStore (the bytes, once the reference landed)
  //
  // The ordering is the already-approved import determination
  // (`importAsset` → … → `setNodeMetadata`), with registration-before-
  // reference honoured by this caller — the frozen reducer performs no
  // referential validation and this session never leans on one.
  //
  // Replacement re-points the SAME motif node: the node is never deleted,
  // re-created or replaced, so its id, its `object_type` classification, its
  // z-position, its children, its lock and its visibility all survive, the
  // motif stays independently addressable and editable, and the fabric,
  // sibling motifs and garment structure are untouched. The frozen
  // `setNodeMetadata` inverse carries the previous reference verbatim, so
  // undo/redo of an artwork change is the engine's own mechanism.
  //
  // NOT ATOMIC, and deliberately not made so. Two frozen commands are two
  // history entries with two exact inverses; the codebase has no grouping or
  // transaction mechanism and records its absence as an open question
  // (`core_document/test/element_replace_test.dart`: "Single-step undo would
  // require a grouping mechanism that does not exist (Q7 discovered #1,
  // open)"). So when the engine refuses the reference — a locked motif is its
  // own rejection — the registration that had to precede it stands, and one
  // undo withdraws it through its own frozen inverse. Compensating for it here
  // would be a caller-side transaction this architecture does not have: it
  // would make an operation that reports *rejected* append history, advance
  // the revision, dirty the document and truncate the user's redo branch.
  // Resolving it needs a separate architectural decision, not an invention.

  /// Uploads the artwork file at [path] and applies it to printed motif
  /// [nodeId], replacing whatever artwork that motif currently references.
  ///
  /// An unreadable, empty or non-artwork path is refused before any command is
  /// built, so the document is never entered.
  Future<CommandResult> applyMotifArtwork(String nodeId, String path) {
    final artwork = readArtworkFile(path);
    if (artwork == null) {
      return Future.value(
        _record(
          CommandResult.rejected(
            reason: CommandRejectionReason.invalid,
            detail: 'Not readable motif artwork: $path',
          ),
        ),
      );
    }
    return applyMotifArtworkBytes(nodeId, artwork);
  }

  /// Applies already-read [artwork] to printed motif [nodeId] — the operation
  /// [applyMotifArtwork] performs once it has bytes, and the entry point any
  /// other artwork source uses.
  Future<CommandResult> applyMotifArtworkBytes(
    String nodeId,
    MotifArtwork artwork,
  ) async {
    // Two caller-side preconditions, both refused before a command exists so
    // the document is never entered: the payload must be real artwork, and
    // artwork belongs to a printed motif. Neither is a reducer rule (node
    // metadata is an open map, ADR-0002), so neither pre-empts an engine
    // decision — the same standing as the registration-before-reference
    // dependency this composition also honours.
    if (!isArtworkPayload(artwork)) {
      return _record(
        const CommandResult.rejected(
          reason: CommandRejectionReason.invalid,
          detail: 'Not motif artwork: empty or unsupported content',
        ),
      );
    }
    final target = _designRoot.findById(nodeId);
    if (target == null) {
      return _record(
        const CommandResult.rejected(
          reason: CommandRejectionReason.notFound,
          detail: 'No such design node',
        ),
      );
    }
    if (!_isMotif(target)) {
      return _record(
        const CommandResult.rejected(
          reason: CommandRejectionReason.invalid,
          detail: 'Artwork applies to a printed motif only',
        ),
      );
    }

    // Hashing is pure, so identity and the dedup key are settled before
    // anything is mutated or stored. Content addressing IS the dedup key
    // ("integrity + dedup key into the asset store"), so identical artwork
    // already registered is referenced again — the frozen "one asset, many
    // nodes" rule — instead of entering the registry twice.
    final hash = artworkContentHash(artwork);
    final reuse = _registeredArtwork(hash);
    final assetId = reuse?.id ?? _assetIds.next();
    if (reuse == null) {
      final imported = _owner.importAsset(
        asset: motifArtworkRecord(id: assetId, artwork: artwork, hash: hash),
      );
      if (imported is CommandRejected) {
        return _record(imported);
      }
    }

    final bound = _owner.setNodeMetadata(
      artboardId: artboardId,
      nodeId: nodeId,
      key: NodeAssetBinding.assetIdKey,
      value: assetId,
    );
    if (bound is CommandApplied) {
      // The bytes follow the reference, never precede it: a refused upload
      // leaves the content store exactly as it was. The frozen store is
      // content-addressed, so this is idempotent for shared artwork.
      await artworkStore.put(artwork.bytes);
    }
    return _record(bound);
  }

  /// The registered motif asset whose content is [hash], or null when this
  /// artwork is new to the document.
  AssetRecord? _registeredArtwork(String hash) {
    for (final record in engine.document.assets.assets.values) {
      if (record.hash == hash && record.kind == AssetKind.motif) {
        return record;
      }
    }
    return null;
  }

  CommandResult _record(CommandResult result) {
    lastResult = switch (result) {
      CommandApplied(revision: final r) => 'Applied — revision $r',
      CommandRejected(reason: final reason, detail: final detail) =>
        'Rejected — ${reason.label}${detail == null ? '' : ': $detail'}',
    };
    revision.value++;
    return result;
  }

  void dispose() => revision.dispose();
}

/// The M19 in-memory session document. Frozen models only.
FebricDocument seedDocument() {
  const motifA = DesignNode(
    id: 'node-motif-a',
    name: 'Motif A',
    type: DesignNodeType.element,
  );
  const motifB = DesignNode(
    id: 'node-motif-b',
    name: 'Motif B',
    type: DesignNodeType.element,
  );
  const motifC = DesignNode(
    id: 'node-motif-c',
    name: 'Motif C',
    type: DesignNodeType.element,
  );
  const chest = DesignNode(
    id: 'node-chest',
    name: 'Chest',
    type: DesignNodeType.zone,
    children: [motifA, motifB, motifC],
  );
  const front = DesignNode(
    id: 'node-front',
    name: 'Front Panel',
    type: DesignNodeType.garmentPart,
    children: [chest],
  );
  const back = DesignNode(
    id: 'node-back',
    name: 'Back Panel',
    type: DesignNodeType.garmentPart,
  );
  const garment = DesignNode(
    id: 'node-garment',
    name: 'Tee',
    type: DesignNodeType.garment,
    children: [front, back],
  );
  const root = DesignNode(
    id: 'node-root',
    name: 'Session',
    type: DesignNodeType.project,
    children: [garment],
  );

  return FebricDocument(
    id: const DocumentId('doc-m19-session'),
    projectId: const ProjectId('project-m19-session'),
    manifest: const DocumentManifest(
      version: DocumentVersion(
        schema: DocumentVersion.currentSchema,
        generator: 'febric-app',
      ),
    ),
    metadata: DocumentMetadata(
      title: 'M19 Session',
      author: 'local',
      createdAt: DateTime.utc(2026, 1, 1),
      modifiedAt: DateTime.utc(2026, 1, 1),
    ),
    artboards: const [
      Artboard(
        id: 'artboard-m19',
        name: 'Artboard',
        size: Size2D(width: 210, height: 297),
        layerRoot: LayerModel(
          id: 'layer-root',
          name: 'Layers',
          kind: LayerKind.artboard,
        ),
        designTreeRoot: root,
      ),
    ],
  );
}

/// The session the workspace panel reads. One per app lifetime.
final designTreeSessionProvider = Provider<DesignTreeSession>((ref) {
  final session = DesignTreeSession.inMemory();
  ref.onDispose(session.dispose);
  return session;
});
