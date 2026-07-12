/// Package marker for `core_document`.
///
/// Design Tree document engine: typed nodes, semantic addressing, command bus, undo, versioning, .febric serialization.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class CoreDocumentPackage {
  static const String id = 'core_document';
  static const String description =
      'Design Tree document engine: typed nodes, semantic addressing, command bus, undo, versioning, .febric serialization.';
}
