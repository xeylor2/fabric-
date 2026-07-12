/// Package marker for `core_ai`.
///
/// AI engine: job model, provider abstraction, API Manager, proposal staging, conversation and inspection pipelines.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class CoreAiPackage {
  static const String id = 'core_ai';
  static const String description =
      'AI engine: job model, provider abstraction, API Manager, proposal staging, conversation and inspection pipelines.';
}
