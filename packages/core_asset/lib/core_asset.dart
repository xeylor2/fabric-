/// FEBRIC Asset Engine — the single source of truth for every external
/// resource used inside a project (ADR-0016).
///
/// Frozen rules:
/// (1) one identity — `FebricAsset.id` is THE uuid every document
///     manifest, tree node, tool and AI job carries;
/// (2) nothing owns bitmap data directly — bytes live once in the
///     content-addressed store; everything else holds hashes;
/// (3) assets are immutable — edits append versions, never overwrite;
/// (4) tree nodes ONLY reference assets (frozen metadata keys, written
///     via the existing command bus — no new commands, no schema change);
/// (5) every mutation checks the Lock Engine first (invariant I4;
///     assets are `LockScope.object` targets);
/// (6) the dependency graph (Asset → Node → Artboard → Document) makes
///     unused/shared/duplicate/broken detection a pure query.
///
/// Pure Dart. No Flutter, no UI, no rendering, no IO in the engine.
library;

export 'src/binding/document_asset_binding.dart';
export 'src/binding/node_asset_binding.dart';
export 'src/catalogue/asset_catalogue.dart';
export 'src/content/asset_content_store.dart';
export 'src/content/content_hasher.dart';
export 'src/core_asset_package.dart';
export 'src/engine/asset_engine.dart';
export 'src/engine/asset_result.dart';
export 'src/graph/asset_usage_graph.dart';
export 'src/model/asset_colour_space.dart';
export 'src/model/asset_origin.dart';
export 'src/model/asset_type.dart';
export 'src/model/asset_version.dart';
export 'src/model/febric_asset.dart';
export 'src/repository/asset_repository.dart';
