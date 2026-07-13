import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/frame/frame_budget.dart';
import 'package:core_render/src/queue/render_work_item.dart';

/// The headless Render Queue (M5B-2), implementing the frozen `RenderQueue`.
/// Coalesces by `RenderWorkItem.key` (later items supersede earlier ones) and
/// drains in a **deterministic** order: ascending `WorkerPriority`
/// (interactive first), ties broken by key. Consumes the frozen priority
/// ladder — no new vocabulary.
final class RenderQueueImpl implements RenderQueue {
  final Map<String, RenderWorkItem> _items = {};

  @override
  void enqueue(RenderWorkItem item) => _items[item.key] = item;

  @override
  bool get isEmpty => _items.isEmpty;

  @override
  List<RenderWorkItem> drain() {
    final drained = _items.values.toList()..sort(_byPriorityThenKey);
    _items.clear();
    return drained;
  }

  static int _byPriorityThenKey(RenderWorkItem a, RenderWorkItem b) {
    // WorkerPriority declaration order is interactive > high > normal > idle,
    // so ascending index == descending urgency-first.
    final byPriority = a.priority.index.compareTo(b.priority.index);
    return byPriority != 0 ? byPriority : a.key.compareTo(b.key);
  }
}

/// The headless Render Scheduler (M5B-2), implementing the frozen
/// `RenderScheduler`. Submits work into a priority queue under a fixed
/// [FrameBudget]; dispatch order is deterministic and independent of
/// submission order (§F, order-independent parallelism). No isolates in the
/// headless runtime — scheduling is pure ordering.
final class RenderSchedulerImpl implements RenderScheduler {
  RenderSchedulerImpl({this.budget = FrameBudget.interactive});

  @override
  final FrameBudget budget;

  final RenderQueueImpl _queue = RenderQueueImpl();

  @override
  void submit(RenderWorkItem item) => _queue.enqueue(item);

  /// Drains all submitted work in deterministic priority order.
  List<RenderWorkItem> dispatchOrder() => _queue.drain();

  /// Whether work is pending.
  bool get hasPending => !_queue.isEmpty;
}
