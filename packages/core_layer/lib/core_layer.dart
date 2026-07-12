/// FEBRIC Layer Engine (ADR-0006).
///
/// Frozen compositing layer architecture: kinds, blend modes, hierarchy,
/// flags, metadata. Immutable models only — layer *behaviour* (commands,
/// reordering, compositing) arrives with the document engine (M2) and the
/// renderer.
///
/// Pure Dart, foundation tier: depends on nothing internal.
library;

export 'src/layer_kind.dart';
export 'src/layer_model.dart';
