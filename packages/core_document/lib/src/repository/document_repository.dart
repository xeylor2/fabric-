import 'package:core_document/src/model/febric_document.dart';
import 'package:core_document/src/model/identifiers.dart';

/// Persistence seam of the Document Engine (repository pattern, dependency
/// inversion; ADR-0014). Storage backends — local `.febric` files, cloud
/// sync — implement this; the engine never touches IO directly.
abstract interface class DocumentRepository {
  Future<FebricDocument?> load(DocumentId id);

  Future<void> save(FebricDocument document);

  Future<bool> exists(DocumentId id);

  Future<void> delete(DocumentId id);

  Future<List<DocumentId>> list();
}

/// Real in-memory implementation (sessions, tests, previews — not a mock:
/// full contract semantics).
final class InMemoryDocumentRepository implements DocumentRepository {
  final Map<String, FebricDocument> _store = {};

  @override
  Future<FebricDocument?> load(DocumentId id) async => _store[id.value];

  @override
  Future<void> save(FebricDocument document) async {
    _store[document.id.value] = document;
  }

  @override
  Future<bool> exists(DocumentId id) async => _store.containsKey(id.value);

  @override
  Future<void> delete(DocumentId id) async {
    _store.remove(id.value);
  }

  @override
  Future<List<DocumentId>> list() async => [
    for (final key in _store.keys) DocumentId(key),
  ];
}
