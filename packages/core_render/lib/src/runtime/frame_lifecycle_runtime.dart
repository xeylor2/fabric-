import 'package:core_render/src/constitution/render_constitution.dart';
import 'package:core_render/src/contracts/render_contracts.dart';
import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The headless Frame Lifecycle state machine (M5B-2), implementing the frozen
/// `FrameLifecycle`. Transitions follow the constitution's frozen order
/// (`RenderConstitution.frameStateOrder`); the only wrap is `end → idle`
/// (next frame). `advanceTo` throws on any other transition — the order is
/// unskippable by construction (mirrors `AiPipelineRun.advanceTo`, ADR-0013).
final class FrameLifecycleImpl implements FrameLifecycle {
  FrameLifecycleImpl();

  FrameLifecycleState _state = FrameLifecycleState.idle;

  @override
  FrameLifecycleState get state => _state;

  @override
  void advanceTo(FrameLifecycleState next) {
    if (!_isLegal(_state, next)) {
      throw StateError(
        'Illegal frame transition ${_state.wireName} → ${next.wireName}',
      );
    }
    _state = next;
  }

  static bool _isLegal(FrameLifecycleState from, FrameLifecycleState to) {
    const order = RenderConstitution.frameStateOrder;
    final i = order.indexOf(from);
    // The wrap: end → idle begins the next frame.
    if (from == FrameLifecycleState.end && to == FrameLifecycleState.idle) {
      return true;
    }
    return i >= 0 && i < order.length - 1 && order[i + 1] == to;
  }
}
