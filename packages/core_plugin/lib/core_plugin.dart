/// FEBRIC Plugin SDK (ADR-0010).
///
/// Frozen extension architecture: manifest, permissions, lifecycle,
/// sandbox, events, commands, versioning, compatibility and security
/// contracts. Marketplace-ready by design. Plugin execution (isolate
/// hosting, command dispatch) arrives in a later milestone.
///
/// Pure Dart, foundation tier: depends on nothing internal — plugins talk
/// JSON over frozen command/event vocabularies, never engine objects.
library;

export 'src/plugin_contracts.dart';
export 'src/plugin_manifest.dart';
