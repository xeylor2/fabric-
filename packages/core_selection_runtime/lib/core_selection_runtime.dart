/// FEBRIC Selection Runtime.
///
/// The stateful wiring that connects the frozen M6 Interaction Runtime
/// (`core_canvas_runtime`) hit results to the frozen selection engine
/// (`core_interaction.SelectionState` / `SelectionMode`; `core_selection`
/// region models, ADR-0008). It holds the live selection, consumes hit
/// results, applies the existing frozen selection operations, and exposes
/// the current selection to downstream runtimes.
///
/// Introduces zero new selection models, vocabularies or semantics — pure
/// composition of frozen contracts.
library;

export 'src/selection_runtime.dart';
