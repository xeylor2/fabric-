/// FEBRIC Layer Runtime (Scope B).
///
/// The runtime orchestration layer between panel/tool intent and the frozen
/// document runtime for layer operations. It holds the active layer
/// reference, exposes the frozen `LayerModel` traversal (`core_layer`,
/// ADR-0006), emits existing frozen `DocumentCommand`s
/// (create/delete/move/rename/setLayerMetadata) and forwards them to the
/// document runtime (`DocumentEngine.apply`, `core_document`, ADR-0014).
///
/// It never mutates `LayerModel`, never reduces commands itself, and never
/// replaces the document reducer. Introduces zero new layer behaviour — pure
/// composition of frozen contracts.
library;

export 'src/layer_runtime.dart';
