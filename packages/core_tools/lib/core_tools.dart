/// FEBRIC Element Engine tool implementations (M15, D1).
///
/// Deterministic `UniversalToolContract` tools — Repeat Pattern and Colour
/// Shift — hosted by the frozen M11 Tool Runtime and emitting only frozen
/// `DocumentCommand`s. Implementations only: contracts stay in
/// `core_tooling`, hosting in `core_tool_runtime`, vocabulary in
/// `core_textile`, the bus in `core_document`.
///
/// Blueprint: docs/architecture/architecture-v2.md (Architecture V2).
library;

export 'src/core_tools_package.dart';
export 'src/repeat/repeat_pattern_tool.dart';
