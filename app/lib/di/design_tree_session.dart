import 'package:core_asset/core_asset.dart';
import 'package:core_canvas/core_canvas.dart';
import 'package:core_canvas_runtime/core_canvas_runtime.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_garment/core_garment.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_layer_runtime/core_layer_runtime.dart';
import 'package:core_render/core_render.dart';
import 'package:core_runtime/core_runtime.dart';
import 'package:core_selection_runtime/core_selection_runtime.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tool_runtime/core_tool_runtime.dart';
import 'package:core_transform_runtime/core_transform_runtime.dart';
import 'package:febric/di/garment_content.dart';
import 'package:febric/di/textile_artwork.dart';
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
  DesignNode get _designRoot => engine.document.artboards.first.designTreeRoot;

  /// Flattened rows for the panel: id, label, depth, parent id, sibling index
  /// and — since M21 — the node's visibility, node-lock flag and a rendered
  /// metadata line (null when the node has none). The artwork stages add two
  /// derived flags read off the frozen metadata carriers: whether the node is
  /// artwork-bearing textile content (`object_type`) and whether it already
  /// references artwork (`asset_id`). A read-only projection of the frozen
  /// document; primitives only.
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
      bool artwork,
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
            bool artwork,
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
            : node.metadata.entries
                  .map((e) => '${e.key}=${e.value}')
                  .join('; '),
        artwork: _artworkTypeOf(node) != null,
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

  /// The frozen [AssetType] artwork takes on [node], or null when the node is
  /// not artwork-bearing textile content.
  ///
  /// The classification carrier is the frozen `object_type` key the previous
  /// stage bound and the render tier already reads (ADR-0019); the mapping to
  /// the Asset Engine's vocabulary is the frozen one.
  static AssetType? _artworkTypeOf(DesignNode node) {
    final wire = node.metadata['object_type'];
    if (wire is! String) {
      return null;
    }
    try {
      return artworkAssetTypeFor(TextileObjectType.fromWireName(wire));
    } on ArgumentError {
      // A classification outside the frozen vocabulary is not artwork-bearing.
      return null;
    }
  }

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
    _owner.renameDesignNode(artboardId: artboardId, nodeId: nodeId, name: name),
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
    for (final type in launchGarmentTypes)
      (id: type.wireName, label: type.label),
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

  // -------------------------------- textile artwork upload / replacement
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
  // It applies to BOTH textile content classes the product creates: the
  // substrate cloth (the fabric / print source of a garment section) and the
  // printed motif. Which asset the upload becomes follows the target's own
  // frozen `object_type` classification through the frozen
  // `DocumentAssetBinding` mapping, so a fabric and a motif with byte-identical
  // content stay distinct assets and neither is ever mistaken for the other.
  //
  // Replacement re-points the SAME node: the node is never deleted, re-created
  // or replaced, so its id, its `object_type` classification, its z-position,
  // its children, its lock and its visibility all survive, it stays
  // independently addressable and editable, and its siblings and the garment
  // structure are untouched. The frozen `setNodeMetadata` inverse carries the
  // previous reference verbatim, so undo/redo of an artwork change is the
  // engine's own mechanism.
  //
  // NOT ATOMIC, and deliberately not made so. Two frozen commands are two
  // history entries with two exact inverses; the codebase has no grouping or
  // transaction mechanism and records its absence as an open question
  // (`core_document/test/element_replace_test.dart`: "Single-step undo would
  // require a grouping mechanism that does not exist (Q7 discovered #1,
  // open)"). So when the engine refuses the reference — a locked node is its
  // own rejection — the registration that had to precede it stands, and one
  // undo withdraws it through its own frozen inverse. Compensating for it here
  // would be a caller-side transaction this architecture does not have: it
  // would make an operation that reports *rejected* append history, advance
  // the revision, dirty the document and truncate the user's redo branch.
  // Resolving it needs a separate architectural decision, not an invention.

  /// Uploads the artwork file at [path] and applies it to textile content node
  /// [nodeId], replacing whatever artwork that node currently references.
  ///
  /// An unreadable, empty or non-artwork path is refused before any command is
  /// built, so the document is never entered.
  Future<CommandResult> applyTextileArtwork(String nodeId, String path) {
    final artwork = readArtworkFile(path);
    if (artwork == null) {
      return Future.value(
        _record(
          CommandResult.rejected(
            reason: CommandRejectionReason.invalid,
            detail: 'Not readable textile artwork: $path',
          ),
        ),
      );
    }
    return applyTextileArtworkBytes(nodeId, artwork);
  }

  /// Applies already-read [artwork] to textile content node [nodeId] — the
  /// operation [applyTextileArtwork] performs once it has bytes, and the entry
  /// point any other artwork source uses.
  Future<CommandResult> applyTextileArtworkBytes(
    String nodeId,
    TextileArtwork artwork,
  ) async {
    // Two caller-side preconditions, both refused before a command exists so
    // the document is never entered: the payload must be real artwork, and the
    // target must be artwork-bearing textile content. Neither is a reducer rule
    // (node metadata is an open map, ADR-0002), so neither pre-empts an engine
    // decision — the same standing as the registration-before-reference
    // dependency this composition also honours.
    if (!isArtworkPayload(artwork)) {
      return _record(
        const CommandResult.rejected(
          reason: CommandRejectionReason.invalid,
          detail: 'Not textile artwork: empty or unsupported content',
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
    final assetType = _artworkTypeOf(target);
    if (assetType == null) {
      return _record(
        const CommandResult.rejected(
          reason: CommandRejectionReason.invalid,
          detail: 'Artwork applies to a fabric / base or a printed motif only',
        ),
      );
    }

    // Hashing is pure, so identity and the dedup key are settled before
    // anything is mutated or stored. Content addressing IS the dedup key
    // ("integrity + dedup key into the asset store"), so identical artwork
    // already registered for the same class is referenced again — the frozen
    // "one asset, many nodes" rule — instead of entering the registry twice.
    final hash = artworkContentHash(artwork);
    final reuse = _registeredArtwork(hash, assetType);
    final assetId = reuse?.id ?? _assetIds.next();
    if (reuse == null) {
      final imported = _owner.importAsset(
        asset: textileArtworkRecord(
          id: assetId,
          artwork: artwork,
          hash: hash,
          assetType: assetType,
        ),
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

  /// The registered artwork asset whose content is [hash] and whose precise
  /// frozen type is [assetType], or null when this artwork is new to the
  /// document.
  ///
  /// The precise type is matched on the frozen lossless metadata key rather
  /// than the coarse `kind`, so a fabric and a motif carrying the same bytes
  /// never alias one another.
  AssetRecord? _registeredArtwork(String hash, AssetType assetType) {
    for (final record in engine.document.assets.assets.values) {
      if (record.hash == hash &&
          record.metadata[DocumentAssetBinding.assetTypeMetadataKey] ==
              assetType.wireName) {
        return record;
      }
    }
    return null;
  }

  // ------------------------------------------- visual surface projection (M5)
  // The canvas is a read-only projection of the document, and the projection
  // machinery is entirely frozen: the frozen `GraphCompiler` walks the SAME
  // design tree the Design Tree panel reads and emits an immutable
  // `RenderGraph` of render objects that reference nodes by id (R2). This
  // composition root only chooses the collaborators — the textile-aware
  // producer registry (the frozen M16 seam, so `object_type` reaches
  // `RenderObject.kind`) and the frozen editor `RenderTarget` — exactly as it
  // already chooses sinks and registries elsewhere.
  //
  // Nothing here renders, and nothing here mutates: compiling emits no
  // `DocumentCommand`, and `DocumentEngine.apply` remains the sole mutation
  // authority.

  /// The frozen target policy the on-screen canvas renders for.
  static const RenderTarget canvasRenderTarget = RenderTarget(
    kind: RenderTargetKind.editor,
  );

  /// The frozen compiler, with the frozen textile producer registered over the
  /// frozen default element producer (M16-D1 replace semantics).
  final GraphCompiler _renderCompiler = RenderGraphCompiler(
    producers: textileProducerRegistry(),
  );

  /// The compiled graph of the current document revision — one graph per
  /// revision (R3). Read-only.
  RenderGraph get canvasRenderGraph =>
      _renderCompiler.compile(engine.document, canvasRenderTarget);

  /// Every artwork reference the design tree declares, as primitives: the node
  /// that references artwork and the frozen content address of that artwork.
  ///
  /// Both sides are read through their frozen owners — the reference through
  /// `NodeAssetBinding.assetIdOf` (ADR-0016 rule 4) and the content address off
  /// the document's own `AssetRegistry` record (rule 1: identity is single). A
  /// reference to an unregistered asset simply yields nothing; resolving the
  /// bytes at the address is the frozen [artworkStore]'s job, not this getter's.
  List<({String nodeId, String contentHash})> get canvasArtworkBindings {
    final out = <({String nodeId, String contentHash})>[];
    for (final node in _designRoot.descendantsAndSelf) {
      final assetId = NodeAssetBinding.assetIdOf(node);
      if (assetId == null) {
        continue;
      }
      final record = engine.document.assets.byId(assetId);
      if (record == null) {
        continue;
      }
      out.add((nodeId: node.id, contentHash: record.hash));
    }
    return out;
  }

  // ------------------------------------- canvas runtime composition (M6–M11)
  // The frozen canvas flow — User → Canvas Runtime → Viewport → Hit Testing →
  // Selection → Tool (ADR-0018) — already has exactly one owner:
  // `CompositeCanvasRuntime` (M10/M11). It implements the frozen
  // `CanvasRuntimeContract`, routes a hit into the frozen `SelectionRuntime`
  // using the modifiers the frozen `InteractionEvent` carries, and surfaces the
  // live selection through the contract member M6 deliberately stubbed to
  // empty. This composition root therefore builds NO selection model, runtime,
  // event bus, authority or parallel state: it holds one instance of each
  // frozen runtime and orders the wiring.
  //
  // The one `LayerRuntime` is [_owner] — the already-authorized emission owner
  // bound to `DocumentEngine.apply`. No second one exists, so
  // `DocumentEngine.apply` remains the sole document mutation authority.
  //
  // Selection is EPHEMERAL runtime state. It lives in the `SelectionRuntime`
  // and never in the document: `DesignNode.selected` stays dormant, no command
  // writes it, and selecting emits nothing.

  /// The one selection runtime (M7) — the canvas selection authority.
  final SelectionRuntime _selectionRuntime = SelectionRuntime();

  /// The one transform runtime (M8), and — under the B-2 authorization — the
  /// host of the EPHEMERAL in-flight transform of one canvas motif move. It is
  /// driven only by the gesture entry points below; nothing else writes it.
  final TransformRuntime _transformRuntime = TransformRuntime();

  /// The one tool runtime (M11): where frozen `UniversalToolContract` tools are
  /// registered, and where the frozen `ToolContext` is assembled from the live
  /// viewport and the live selection.
  final ToolRuntime canvasTools = ToolRuntime();

  /// The live canvas selection — the frozen `SelectionState` (ids only),
  /// read-only. Empty until the user selects on the canvas.
  SelectionState get canvasSelection => _selectionRuntime.selection;

  CompositeCanvasRuntime? _canvasRuntime;
  ViewportState? _canvasViewport;
  HitTestContract? _canvasHitTester;

  /// The composed runtime currently bound to the canvas surface, or null before
  /// the canvas has been laid out. Read-only accessor — the composition happens
  /// in [canvasRuntime] and nowhere else.
  CompositeCanvasRuntime? get activeCanvasRuntime => _canvasRuntime;

  /// The one [CompositeCanvasRuntime] of this session, bound to the surface's
  /// current [viewport] and its current [hitTester] (the frozen
  /// `RenderSession`, which is also the frozen `HitTestContract`).
  ///
  /// Recomposed — never duplicated — when the viewport or the compiled graph
  /// changes, because the frozen `InteractionSession` takes both at
  /// construction and the composition "holds references and orders calls —
  /// nothing more". The selection, transform, layer and tool runtimes are the
  /// SAME instances across every recomposition, so the live selection, the
  /// registered tools and the emission owner all survive a resize and a
  /// document revision.
  CompositeCanvasRuntime canvasRuntime({
    required ViewportState viewport,
    required HitTestContract hitTester,
  }) {
    final existing = _canvasRuntime;
    if (existing != null &&
        _canvasViewport == viewport &&
        identical(_canvasHitTester, hitTester)) {
      return existing;
    }
    final composed = CompositeCanvasRuntime(
      interaction: InteractionSession(
        state: CanvasRuntimeState(
          camera: NavigationState(viewport: viewport),
          coordinateSystem: canvasRenderTarget.coordinateSystem,
        ),
        hitTester: hitTester,
      ),
      selection: _selectionRuntime,
      transform: _transformRuntime,
      layer: _owner,
      tool: canvasTools,
    );
    _canvasViewport = viewport;
    _canvasHitTester = hitTester;
    _canvasRuntime = composed;
    return composed;
  }

  // ------------------------- individual printed motif free move (B-2/NDH-2)
  // The frozen chain, reused end to end and nothing more:
  //
  //   drag on an already-selected motif  (the surface, NDH-2 content route)
  //   → frozen CanvasRuntimeContract.handleInput
  //   → document-space delta from the frozen CoordinateConversion
  //   → frozen TransformRuntime.beginMove / moveBy   (the EPHEMERAL transform)
  //   → the existing render path                     (the live preview)
  //   → gesture end → frozen TransformRuntime.endMove (the settled Transform2D)
  //   → LayerRuntime.setNodeMetadata                  (the authorized emission)
  //   → DocumentCommand.setNodeMetadata → DocumentCommandSink
  //   → DocumentEngine.apply
  //   → Lock → Validation → History → Document → CommandResult
  //
  // The in-flight transform is NEVER document state: begin, update and cancel
  // build no command, reach no sink, touch no revision and notify nothing. Only
  // the settled transform enters the document, through the one already-
  // authorized emission owner, so `DocumentEngine.apply` remains the sole
  // mutation authority and no parallel write path exists.
  //
  // Nothing is pre-empted: node-lock rejection stays engine-owned, so a locked
  // motif previews its move and the engine refuses to persist it — the document
  // is left inert and the ephemeral transform is dropped, which puts the motif
  // straight back where the document says it is.
  //
  // Which nodes may move is read off the frozen compiled graph rather than
  // decided here: an individual printed motif is exactly an object the frozen
  // textile producer classified `RenderObjectKind.motif` from the node's own
  // frozen `object_type` (ADR-0019 / M16-D3). The fabric / base, zones, garment
  // parts and the garment itself classify as something else and therefore never
  // move — and it holds for Kurta, Pant and Dupatta alike, because the
  // classification is the node's, not the garment's.
  //
  // Resize, rotate, scale, flip, arrange, align, distribute and repeat are out
  // of scope: the frozen runtime composes a translation only.

  /// The frozen metadata key carrying a node's own persisted transform — the
  /// key the frozen textile producer already reads into
  /// `RenderObject.transform`. No new carrier is introduced.
  static const String transformMetadataKey = 'transform';

  /// The motif whose move is in flight, and the persisted transform that move
  /// is anchored on. Both null between gestures.
  String? _movingNodeId;
  Transform2D? _moveAnchor;

  /// The live in-flight move as presentation reads it: the motif being moved and
  /// the EPHEMERAL transform the frozen runtime currently holds. Null when no
  /// move is in flight. Reading it mutates nothing.
  ({String nodeId, Transform2D transform})? get canvasMovePreview {
    final nodeId = _movingNodeId;
    if (nodeId == null || !_transformRuntime.isMoving) {
      return null;
    }
    return (nodeId: nodeId, transform: _transformRuntime.activeTransform);
  }

  /// The compiled object the current graph holds for [nodeId], or null when the
  /// node renders nowhere (absent, or hidden — a hidden node's subtree renders
  /// nowhere by the frozen compiler's own rule, so there is nothing to move).
  RenderObject? _canvasObjectOf(String nodeId) {
    for (final object in canvasRenderGraph.objects) {
      if (object.source.refId == nodeId) {
        return object;
      }
    }
    return null;
  }

  /// Begins an in-flight free move of the individual printed motif [nodeId],
  /// anchored on that motif's own persisted transform (so a move composes with
  /// wherever the document already places it, and repeated moves accumulate
  /// exactly once each).
  ///
  /// Returns false — and begins nothing — when [nodeId] is not an individual
  /// printed motif on the current graph. Refusing is not a document rejection:
  /// no command exists yet and the document is never entered.
  bool beginCanvasMove(String nodeId) {
    // A new gesture supersedes any stale one, so the runtime never carries an
    // anchor from a gesture that is over.
    cancelCanvasMove();
    final object = _canvasObjectOf(nodeId);
    if (object == null || object.kind != RenderObjectKind.motif) {
      return false;
    }
    _movingNodeId = nodeId;
    _moveAnchor = object.transform;
    _transformRuntime.beginMove(object.transform);
    return true;
  }

  /// Advances the in-flight move to [documentDelta] — the gesture's **total**
  /// displacement in document space. A no-op with no move in flight.
  void updateCanvasMove(Point2D documentDelta) {
    if (_movingNodeId == null) {
      return;
    }
    _transformRuntime.moveBy(documentDelta);
  }

  /// Settles the in-flight move and persists the final [Transform2D] through the
  /// authorized owner. Returns the frozen [CommandResult], or null when there
  /// was nothing to persist: no move was in flight, or the gesture ended exactly
  /// where it began.
  ///
  /// A gesture that displaced nothing is not a movement, so no command is built
  /// for it — that keeps a press-and-release from appending a history entry whose
  /// inverse equals itself, dirtying the document and truncating the redo branch.
  /// Declining to issue a command pre-empts no engine decision.
  CommandResult? endCanvasMove() {
    final nodeId = _movingNodeId;
    final anchor = _moveAnchor;
    if (nodeId == null || anchor == null) {
      return null;
    }
    final settled = _transformRuntime.endMove();
    _movingNodeId = null;
    _moveAnchor = null;
    if (settled == anchor) {
      return null;
    }
    return _record(
      _owner.setNodeMetadata(
        artboardId: artboardId,
        nodeId: nodeId,
        key: transformMetadataKey,
        value: settled.toJson(),
      ),
    );
  }

  /// Abandons the in-flight move. Nothing was ever written, so nothing is rolled
  /// back: dropping the ephemeral transform leaves the motif exactly where the
  /// document says it is. Always safe.
  void cancelCanvasMove() {
    _movingNodeId = null;
    _moveAnchor = null;
    _transformRuntime.cancelMove();
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
