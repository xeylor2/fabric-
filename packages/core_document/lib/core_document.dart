/// FEBRIC Document Engine — the command-driven runtime source of truth of
/// the FEBRIC Operating System (ADR-0014).
///
/// Frozen rules: (1) single source of truth; (2) nothing edits the
/// document directly — everything is a command; (3) tools own only
/// ToolState extensions; (4) AI produces commands, never direct edits;
/// (5) every command passes Lock Engine → Validation → History → Document;
/// (6) new tools never change the document schema.
///
/// Pure Dart. No Flutter, no rendering, no editing logic, no AI
/// implementation.
library;

export 'src/addressing/semantic_path.dart';
export 'src/commands/command_result.dart';
export 'src/commands/document_command.dart';
export 'src/core_document_package.dart';
export 'src/engine/document_engine.dart';
export 'src/history/document_history.dart';
export 'src/model/ai_provenance.dart';
export 'src/model/artboard.dart';
export 'src/model/asset_registry.dart';
export 'src/model/document_metadata.dart';
export 'src/model/document_status.dart';
export 'src/model/febric_document.dart';
export 'src/model/identifiers.dart';
export 'src/model/profiles.dart';
export 'src/model/tool_state.dart';
export 'src/model/workspace_viewport.dart';
export 'src/repository/document_repository.dart';
export 'src/serialization/febric_codec.dart';
export 'src/tree/design_tree_ops.dart';
export 'src/tree/node_capabilities.dart';
