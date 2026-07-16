import 'package:core_render/src/backend/backend_capabilities.dart';
import 'package:core_render/src/context/render_context.dart';
import 'package:core_render/src/platform/render_platform.dart';
import 'package:core_render/src/recording/command_buffer.dart';
import 'package:core_render/src/recording/render_command.dart';

/// A **Platform Rendering Backend** adapter (M5B-4).
///
/// This is the execution counterpart of the frozen recording `RenderBackend`
/// (M5B-1/§3.7): where that seam *records* a [CommandBuffer], this seam
/// *executes* one against a concrete platform. It is the single place any
/// platform-specific behaviour (Android/iOS/Windows) may live (§ platform
/// targets) — the executor and every runtime above it are platform-blind.
///
/// **Purity (frozen):** `core_render` stays pure Dart. This interface exposes
/// only platform-neutral types — it names *what* a backend must do, never a
/// GPU/Skia/Impeller/`dart:ui` API. The real Flutter driver implements this in
/// the later presentation-layer milestone; M5B-4 ships the
/// `ReferenceBackendAdapter` (deterministic, pixel-free) against it.
///
/// A backend declares its identity + capabilities as data (§B, no leakage) and
/// receives the executed commands as lifecycle callbacks. It never reads the
/// document (R1) — it only replays references the command stream already
/// resolved.
abstract interface class PlatformRenderBackend {
  /// The platform this backend targets (adapter boundary).
  RenderPlatform get platform;

  /// Capabilities declared as data — read, never probed (§B).
  BackendCapabilities get capabilities;

  /// Handles one command in execution order. Implementations switch on
  /// [RenderCommand.kind]; the executor guarantees a well-formed,
  /// frozen-ordered stream (begin_frame … end_frame).
  void execute(RenderCommand command, RenderContext context);
}

/// The **Render Command Executor** (M5B-4): replays an immutable
/// [CommandBuffer] onto a [PlatformRenderBackend], in strict record order.
///
/// It is pure orchestration — platform-independent and deterministic. It adds
/// no rendering semantics beyond "feed each command, in order, to the backend"
/// and validates the frozen envelope (begin_frame first, end_frame last). Given
/// the same buffer and backend, execution is identical on every platform, which
/// is what guarantees cross-platform consistency: the *stream* is the single
/// source of truth, and every backend consumes the identical stream.
final class RenderCommandExecutor {
  const RenderCommandExecutor();

  /// Executes every command in [buffer] against [backend] under [context],
  /// returning the count executed. Read-only: no document, no mutation.
  int execute(
    CommandBuffer buffer,
    PlatformRenderBackend backend,
    RenderContext context,
  ) {
    _validateEnvelope(buffer);
    for (final command in buffer.commands) {
      backend.execute(command, context);
    }
    return buffer.commands.length;
  }

  /// Verifies the frozen command envelope so execution is well-defined: a
  /// non-empty buffer must open with `begin_frame` and close with `end_frame`.
  void _validateEnvelope(CommandBuffer buffer) {
    if (buffer.commands.isEmpty) return;
    final first = buffer.commands.first.kind;
    final last = buffer.commands.last.kind;
    if (first != RenderCommandKind.beginFrame ||
        last != RenderCommandKind.endFrame) {
      throw StateError(
        'Malformed command buffer: must open with begin_frame and close with '
        'end_frame (was ${first.wireName} … ${last.wireName}).',
      );
    }
  }
}
