import 'package:core_asset/src/catalogue/asset_catalogue.dart';
import 'package:core_asset/src/graph/asset_usage_graph.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_repository.freezed.dart';
part 'asset_repository.g.dart';

/// The persistable state of an Asset Engine: catalogue + dependency
/// graph, keyed by project. Content bytes are NOT here — they live in
/// the content-addressed store (no duplicate storage).
@freezed
abstract class AssetEngineState with _$AssetEngineState {
  const factory AssetEngineState({
    required String projectId,
    @Default(AssetCatalogue.empty) AssetCatalogue catalogue,
    @Default(AssetUsageGraph.empty) AssetUsageGraph graph,
  }) = _AssetEngineState;

  factory AssetEngineState.fromJson(Map<String, Object?> json) =>
      _$AssetEngineStateFromJson(json);
}

/// Persistence seam of the Asset Engine (repository pattern, dependency
/// inversion; ADR-0016). Storage backends — the `.febric` project
/// package's `assets/` area, cloud sync — implement this; the engine
/// never touches IO directly.
abstract interface class AssetRepository {
  Future<AssetEngineState?> load(String projectId);

  Future<void> save(AssetEngineState state);

  Future<bool> exists(String projectId);

  Future<void> delete(String projectId);

  Future<List<String>> list();
}

/// Real in-memory implementation (sessions, tests, previews — full
/// contract semantics, not a mock).
final class InMemoryAssetRepository implements AssetRepository {
  final Map<String, AssetEngineState> _store = {};

  @override
  Future<AssetEngineState?> load(String projectId) async => _store[projectId];

  @override
  Future<void> save(AssetEngineState state) async {
    _store[state.projectId] = state;
  }

  @override
  Future<bool> exists(String projectId) async =>
      _store.containsKey(projectId);

  @override
  Future<void> delete(String projectId) async {
    _store.remove(projectId);
  }

  @override
  Future<List<String>> list() async => _store.keys.toList();
}
