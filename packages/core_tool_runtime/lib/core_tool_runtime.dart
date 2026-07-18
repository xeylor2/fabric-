/// FEBRIC Tool Runtime (M11).
///
/// The runtime orchestration shell that **hosts and drives** frozen
/// `UniversalToolContract` instances (`core_tooling`, ADR-0012) — the
/// analogue, for tools, of what the Layer Runtime (M9) is for layer
/// commands. It owns tool registration, the single active-tool reference and
/// the lifecycle/request routing; it assembles the frozen `ToolContext` from
/// state the caller supplies and exposes the active tool's state verbatim.
///
/// It closes the `… → Tool` edge of the frozen canvas flow (ADR-0018) that
/// the M10 composition left dangling.
///
/// Ownership boundaries (resolved at Architecture Review):
/// - it **never owns a command sink** — a tool's bus binding is established
///   at that tool's own construction (the frozen contracts intentionally do
///   not define the tool→`DocumentEngine.apply` path; ADR-0012/0014);
/// - it **never** builds, inspects or reduces a `DocumentCommand`, and never
///   reinterprets a `ToolResult`/`ToolPreview`;
/// - it introduces **no new tool behaviour, model, vocabulary or contract**.
///
/// Pure Dart, headless. All tool semantics stay in each concrete tool; all
/// document mutation stays in the frozen `core_document` pipeline.
library;

export 'src/tool_runtime.dart';
