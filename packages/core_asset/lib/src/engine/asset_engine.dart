import 'package:core_asset/src/catalogue/asset_catalogue.dart';
import 'package:core_asset/src/engine/asset_result.dart';
import 'package:core_asset/src/graph/asset_usage_graph.dart';
import 'package:core_asset/src/model/asset_colour_space.dart';
import 'package:core_asset/src/model/asset_origin.dart';
import 'package:core_asset/src/model/asset_type.dart';
import 'package:core_asset/src/model/asset_version.dart';
import 'package:core_asset/src/model/febric_asset.dart';
import 'package:core_common/core_common.dart';
import 'package:core_lock/core_lock.dart';

/// Default lock policy of the Asset Engine: a mutation is allowed iff the
/// Lock Engine's implication closure does not lock its scope/target
/// (invariant I4). The semantics live in ONE place — the frozen
/// `LockSet.blockingLock` (ADR-0005); this class, like the Document
/// Engine's standard policy, is a thin delegation kept engine-side
/// because foundation tiers cannot import core_document.
final class ImplicationLockPolicy implements LockPolicy {
  const ImplicationLockPolicy();

  @override
  LockDecision check(LockSet locks, LockScope scope, {String? targetId}) {
    final blocking = locks.blockingLock(scope, targetId: targetId);
    return blocking == null
        ? LockDecision.permit
        : LockDecision(allowed: false, blockedBy: blocking);
  }
}

/// THE Asset Engine (ADR-0016) — the single source of truth for every
/// external resource of a project.
///
/// - Canvas renders assets, the tree references them, tools operate on
///   them, AI consumes them; nothing owns bitmap data directly (bytes
///   live in the content-addressed store, addressed by hash).
/// - Assets are immutable: edits append versions ([addVersion]); nothing
///   is ever overwritten.
/// - Every mutation checks the Lock Engine FIRST (invariant I4): assets
///   are `LockScope.object` targets, so object/document/project locks
///   gate them through the frozen implication hierarchy — the Lock
///   Engine itself is untouched.
/// - Identity is single: [FebricAsset.id] is the uuid every document
///   manifest (`AssetRecord.id`), tree node and tool carries.
final class AssetEngine {
  AssetEngine({
    AssetCatalogue this._catalogue = AssetCatalogue.empty,
    AssetUsageGraph this._graph = AssetUsageGraph.empty,
    this.lockPolicy = const ImplicationLockPolicy(),
    this.clock = const SystemClock(),
    IdGenerator? assetIds,
  }) : _assetIds = assetIds ?? SequentialIdGenerator(prefix: 'asset');

  /// The lock policy every mutation is checked against (invariant I4).
  final LockPolicy lockPolicy;

  /// Time seam for created/modified stamps.
  final Clock clock;

  final IdGenerator _assetIds;

  AssetCatalogue _catalogue;
  AssetUsageGraph _graph;
  LockSet _locks = const LockSet();

  /// The current immutable catalogue.
  AssetCatalogue get catalogue => _catalogue;

  /// The current immutable dependency graph.
  AssetUsageGraph get graph => _graph;

  /// The active lock set assets are checked against.
  LockSet get locks => _locks;

  /// Adopts the project's active locks (the composition layer syncs this
  /// from the lock authority — e.g. the open document's lock set).
  void syncLocks(LockSet locks) => _locks = locks;

  // ---- registration -----------------------------------------------------------

  /// Registers a new asset (version 1 of its lineage).
  ///
  /// Rejections: `locked` (Lock Engine veto), `duplicate_identity`
  /// (uuid already registered), `invalid` (empty name/hash/mime, raster
  /// type without full dimensions).
  AssetResult register({
    required String name,
    required AssetType type,
    required AssetOrigin origin,
    required String mimeType,
    required String hash,
    String? id,
    int? width,
    int? height,
    double? dpi,
    AssetColourSpace? colourSpace,
    List<String> tags = const [],
    Map<String, Object?> metadata = const {},
    String author = 'local',
    String? operation,
    String? provenanceId,
  }) {
    final assetId = id ?? _assetIds.next();
    final veto = _checkLock(assetId);
    if (veto != null) {
      return veto;
    }
    if (_catalogue.byId(assetId) != null) {
      return AssetResult.rejected(
        reason: AssetRejectionReason.duplicateIdentity,
        detail: 'Asset $assetId is already registered',
      );
    }
    final invalid = _validateIdentity(
      name: name,
      mimeType: mimeType,
      hash: hash,
      type: type,
      width: width,
      height: height,
    );
    if (invalid != null) {
      return invalid;
    }
    final now = clock.now();
    final asset = FebricAsset(
      id: assetId,
      name: name,
      type: type,
      origin: origin,
      mimeType: mimeType,
      hash: hash,
      width: width,
      height: height,
      dpi: dpi,
      colourSpace: colourSpace,
      createdAt: now,
      modifiedAt: now,
      versions: [
        AssetVersionRecord(
          version: 1,
          hash: hash,
          createdAt: now,
          author: author,
          operation: operation ?? origin.wireName,
          provenanceId: provenanceId,
        ),
      ],
      tags: tags,
      metadata: metadata,
    );
    _catalogue = _catalogue.withAsset(asset);
    return AssetResult.applied(asset: asset);
  }

  // ---- immutable versioning ----------------------------------------------------

  /// Appends a new version to [assetId]'s lineage — the ONLY way an
  /// asset's content advances. The previous hash stays resolvable
  /// forever; nothing is overwritten.
  AssetResult addVersion(
    String assetId, {
    required String hash,
    String author = 'local',
    String? operation,
    String? provenanceId,
    String? comment,
    Map<String, Object?> parameters = const {},
    int? width,
    int? height,
    double? dpi,
    AssetColourSpace? colourSpace,
  }) {
    final veto = _checkLock(assetId);
    if (veto != null) {
      return veto;
    }
    final asset = _catalogue.byId(assetId);
    if (asset == null) {
      return AssetResult.rejected(
        reason: AssetRejectionReason.notFound,
        detail: 'Asset $assetId is not registered',
      );
    }
    if (hash.trim().isEmpty) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Version hash cannot be empty',
      );
    }
    if (hash == asset.hash) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Identical content — a new version needs new content',
      );
    }
    // A version advances content under the SAME identity discipline as
    // registration — it can never introduce dimensions register() would
    // have refused.
    final effectiveWidth = width ?? asset.width;
    final effectiveHeight = height ?? asset.height;
    final invalidDimensions = _validateDimensions(
      type: asset.type,
      width: effectiveWidth,
      height: effectiveHeight,
    );
    if (invalidDimensions != null) {
      return invalidDimensions;
    }
    // One clock read for both stamps: a version's createdAt equals the
    // asset's modifiedAt (matches register's single-sample pattern).
    final now = clock.now();
    final next = asset.copyWith(
      hash: hash,
      version: asset.version + 1,
      modifiedAt: now,
      width: effectiveWidth,
      height: effectiveHeight,
      dpi: dpi ?? asset.dpi,
      colourSpace: colourSpace ?? asset.colourSpace,
      versions: [
        ...asset.versions,
        AssetVersionRecord(
          version: asset.version + 1,
          hash: hash,
          createdAt: now,
          author: author,
          operation: operation,
          provenanceId: provenanceId,
          comment: comment,
          parameters: parameters,
        ),
      ],
    );
    _catalogue = _catalogue.withAsset(next);
    return AssetResult.applied(asset: next);
  }

  // ---- identity metadata ---------------------------------------------------------

  /// Amends catalogue details (name/tags/metadata) WITHOUT creating a
  /// version — these describe the asset, they are not its content.
  AssetResult amend(
    String assetId, {
    String? name,
    List<String>? tags,
    Map<String, Object?>? metadata,
  }) {
    final veto = _checkLock(assetId);
    if (veto != null) {
      return veto;
    }
    final asset = _catalogue.byId(assetId);
    if (asset == null) {
      return AssetResult.rejected(
        reason: AssetRejectionReason.notFound,
        detail: 'Asset $assetId is not registered',
      );
    }
    if (name == null && tags == null && metadata == null) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Nothing to amend',
      );
    }
    if (name != null && name.trim().isEmpty) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Asset name cannot be empty',
      );
    }
    final next = asset.copyWith(
      name: name ?? asset.name,
      tags: tags ?? asset.tags,
      metadata: metadata ?? asset.metadata,
      modifiedAt: clock.now(),
    );
    _catalogue = _catalogue.withAsset(next);
    return AssetResult.applied(asset: next);
  }

  // ---- removal (reference counted) ----------------------------------------------

  /// Removes [assetId] from the catalogue. Refused while references
  /// exist (`in_use`) unless [force] — which leaves detectable broken
  /// references and NEVER bypasses locks (I4 is absolute).
  AssetResult remove(String assetId, {bool force = false}) {
    final veto = _checkLock(assetId);
    if (veto != null) {
      return veto;
    }
    final asset = _catalogue.byId(assetId);
    if (asset == null) {
      return AssetResult.rejected(
        reason: AssetRejectionReason.notFound,
        detail: 'Asset $assetId is not registered',
      );
    }
    final references = _graph.referenceCount(assetId);
    if (references > 0 && !force) {
      return AssetResult.rejected(
        reason: AssetRejectionReason.inUse,
        detail: 'Asset $assetId has $references reference(s)',
      );
    }
    _catalogue = _catalogue.withoutAsset(assetId);
    return AssetResult.applied(asset: asset);
  }

  // ---- dependency graph -----------------------------------------------------------
  //
  // Usage edges are a PROJECTION of the design tree, not asset state.
  // Structural authority over references is the Document Engine: the tree
  // edits that add/remove them (`setNodeMetadata`) already pass its frozen
  // Lock stage (I4). Re-gating the projection here would double-check the
  // same authority against a lock set the Asset Engine only mirrors, so
  // graph sync is intentionally outside the asset-mutation I4 path.

  /// Records one usage edge. The asset must exist — unknown references
  /// enter the graph only through [syncDocumentUsages] (documents are
  /// the authority over their own trees; that is where broken
  /// references legitimately surface).
  AssetResult recordUsage(AssetUsage usage) {
    if (_catalogue.byId(usage.assetId) == null) {
      return AssetResult.rejected(
        reason: AssetRejectionReason.notFound,
        detail: 'Asset ${usage.assetId} is not registered',
      );
    }
    _graph = _graph.withUsage(usage);
    return const AssetResult.applied();
  }

  /// Removes one usage edge.
  AssetResult releaseUsage(AssetUsage usage) {
    _graph = _graph.withoutUsage(usage);
    return const AssetResult.applied();
  }

  /// Replaces [documentId]'s edges wholesale (resync after tree edits —
  /// typically from `NodeAssetBinding.collectUsages`). Unknown asset ids
  /// are accepted and surface via [brokenReferences].
  AssetResult syncDocumentUsages(String documentId, List<AssetUsage> usages) {
    _graph = _graph.replacingDocument(documentId, usages);
    return const AssetResult.applied();
  }

  // ---- detection + statistics ------------------------------------------------------

  /// Assets with zero references (safe-to-remove candidates).
  List<String> get unusedAssetIds => _graph.unusedAssetIds(_catalogue);

  /// Assets referenced by two or more distinct nodes.
  List<String> get sharedAssetIds => _graph.sharedAssetIds(_catalogue);

  /// Graph edges pointing at assets this catalogue does not hold.
  List<AssetUsage> get brokenReferences => _graph.brokenReferences(_catalogue);

  /// Groups of distinct assets with identical current content.
  Map<String, List<FebricAsset>> get duplicateGroups =>
      _catalogue.duplicateGroups;

  /// Live statistics over catalogue + graph.
  AssetStatistics get statistics => AssetStatistics(
    assets: _catalogue.count,
    byType: {
      for (final type in AssetType.values)
        if (_catalogue.ofType(type).isNotEmpty)
          type.wireName: _catalogue.ofType(type).length,
    },
    totalVersions: _catalogue.assets.values.fold(
      0,
      (sum, asset) => sum + asset.versions.length,
    ),
    usages: _graph.count,
    unused: unusedAssetIds.length,
    shared: sharedAssetIds.length,
    duplicateGroups: duplicateGroups.length,
    broken: brokenReferences.length,
  );

  // ---- internals --------------------------------------------------------------------

  /// Invariant I4: the Lock Engine is consulted before any compute.
  /// Assets are object-scope targets; project/document locks imply
  /// object through the frozen hierarchy.
  AssetResult? _checkLock(String assetId) {
    final decision = lockPolicy.check(
      _locks,
      LockScope.object,
      targetId: assetId,
    );
    if (decision.allowed) {
      return null;
    }
    return AssetResult.rejected(
      reason: AssetRejectionReason.locked,
      blockedBy: decision.blockedBy,
      detail: decision.blockedBy?.reason,
    );
  }

  AssetResult? _validateIdentity({
    required String name,
    required String mimeType,
    required String hash,
    required AssetType type,
    required int? width,
    required int? height,
  }) {
    if (name.trim().isEmpty) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Asset name cannot be empty',
      );
    }
    if (mimeType.trim().isEmpty) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Asset mimeType cannot be empty',
      );
    }
    if (hash.trim().isEmpty) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Asset hash cannot be empty',
      );
    }
    return _validateDimensions(type: type, width: width, height: height);
  }

  /// Raster/dimension discipline shared by [register] and [addVersion]:
  /// raster types need both dimensions; any supplied dimension must be
  /// positive. A version can never move a raster asset into a
  /// dimensionally invalid state that registration would have refused.
  AssetResult? _validateDimensions({
    required AssetType type,
    required int? width,
    required int? height,
  }) {
    if (type.isRaster && (width == null || height == null)) {
      return AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Raster type ${type.wireName} requires width and height',
      );
    }
    if ((width != null && width <= 0) || (height != null && height <= 0)) {
      return const AssetResult.rejected(
        reason: AssetRejectionReason.invalid,
        detail: 'Dimensions must be positive',
      );
    }
    return null;
  }
}

/// Computed statistics of an [AssetEngine] (derived, never stored).
final class AssetStatistics {
  const AssetStatistics({
    required this.assets,
    required this.byType,
    required this.totalVersions,
    required this.usages,
    required this.unused,
    required this.shared,
    required this.duplicateGroups,
    required this.broken,
  });

  final int assets;

  /// Asset count per type wire name (types with zero assets omitted).
  final Map<String, int> byType;

  final int totalVersions;
  final int usages;
  final int unused;
  final int shared;
  final int duplicateGroups;
  final int broken;
}
