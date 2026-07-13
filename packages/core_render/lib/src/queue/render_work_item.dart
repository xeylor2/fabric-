import 'package:core_performance/core_performance.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'render_work_item.freezed.dart';
part 'render_work_item.g.dart';

/// A deferrable unit of render work in the queue (Rendering Constitution
/// §3.4). Ordered by [priority] (frozen `core_performance.WorkerPriority`);
/// items are coalesced by [key]. Data only — the queue/scheduler that drain
/// these arrive in M5B-2.
@freezed
abstract class RenderWorkItem with _$RenderWorkItem {
  const factory RenderWorkItem({
    /// Coalescing key (later items with the same key supersede earlier ones).
    required String key,

    @JsonKey(fromJson: _kindFromJson, toJson: _kindToJson)
    required RenderWorkItemKind kind,

    @JsonKey(fromJson: _priorityFromJson, toJson: _priorityToJson)
    @Default(WorkerPriority.normal)
    WorkerPriority priority,

    /// Optional tile this item renders (frozen `TileCoordinate`).
    TileCoordinate? tile,

    /// Optional pass this item executes (pass wire name).
    String? passKind,
  }) = _RenderWorkItem;

  factory RenderWorkItem.fromJson(Map<String, Object?> json) =>
      _$RenderWorkItemFromJson(json);
}

RenderWorkItemKind _kindFromJson(String wireName) =>
    RenderWorkItemKind.fromWireName(wireName);

String _kindToJson(RenderWorkItemKind kind) => kind.wireName;

WorkerPriority _priorityFromJson(String wireName) =>
    WorkerPriority.fromWireName(wireName);

String _priorityToJson(WorkerPriority priority) => priority.wireName;
