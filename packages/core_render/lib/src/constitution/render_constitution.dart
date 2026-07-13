import 'package:core_render/src/vocabulary/render_vocabulary.dart';

/// The Rendering Constitution (M5B, Blueprint Rev. 3) as frozen, testable
/// data. Every future renderer obeys these principles; the freeze test pins
/// them. Pure, const, no rendering.
///
/// Principle R1 is the spine: **rendering is a read-only projection of the
/// document** — the renderer never mutates state, emits no commands, and
/// holds no pen. It reads read-models and renders references.
final class RenderConstitution {
  const RenderConstitution._();

  /// Rendering never mutates the document, emits no DocumentCommand, and
  /// holds no pen (R1).
  static const bool readOnlyProjection = true;

  /// Render objects carry ids/hashes, never owned data (R2; inherits the
  /// Canvas Constitution).
  static const bool rendersReferencesOnly = true;

  /// One Render Graph per document revision, rebuilt incrementally from
  /// damage — never a full redraw for a local change (R3).
  static const bool oneGraphPerRevision = true;

  /// The renderer uses the one shared viewport/camera; it never creates its
  /// own (R4).
  static const bool singleSharedViewport = true;

  /// The pipeline is identical across backends; only the driver differs (R5).
  static const bool backendNeutral = true;

  /// Pipeline stage order is fixed and unskippable; passes plug in within the
  /// order (R6).
  static const bool fixedPipelineOrder = true;

  /// The frame lifecycle is damage-driven and budgeted, targeting 60fps (R7).
  static const bool damageDrivenBudgetedFrame = true;

  /// All constitution contracts are pure Dart; only the driver is Flutter
  /// tier (R8).
  static const bool pureContractsFlutterFreeDriverSeparate = true;

  /// The eight constitutional principles, in order. Pinned by test.
  static const List<String> principles = <String>[
    'Rendering is a read-only projection of the document.',
    'The renderer renders references only, never owned data.',
    'There is one Render Graph per document revision, rebuilt from damage.',
    'The renderer uses the one shared viewport; it never creates its own.',
    'The pipeline is backend-neutral; only the driver differs.',
    'The pipeline stage order is fixed and unskippable.',
    'The frame lifecycle is damage-driven and budgeted for 60fps.',
    'Constitution contracts are pure Dart; only the driver is Flutter tier.',
  ];

  /// The frozen forward order of render stages (data-flow spine, §2). Passes
  /// insert within this order; nothing reorders it (R6).
  static const List<String> pipelineStageOrder = <String>[
    'compile',
    'cull',
    'organize_passes',
    'enqueue',
    'schedule',
    'record',
    'composite',
    'present',
  ];

  /// The frozen forward order of render passes (§3.6). Base and fill
  /// composite first; guides last (below overlays, which the presentation
  /// pipeline composites afterwards).
  static const List<RenderPassKind> passOrder = <RenderPassKind>[
    RenderPassKind.base,
    RenderPassKind.fill,
    RenderPassKind.motif,
    RenderPassKind.border,
    RenderPassKind.texture,
    RenderPassKind.shadow,
    RenderPassKind.aiPreview,
    RenderPassKind.guides,
  ];

  /// The frozen forward order of frame-lifecycle states (§3.11).
  static const List<FrameLifecycleState> frameStateOrder =
      <FrameLifecycleState>[
        FrameLifecycleState.idle,
        FrameLifecycleState.scheduled,
        FrameLifecycleState.begin,
        FrameLifecycleState.update,
        FrameLifecycleState.cull,
        FrameLifecycleState.record,
        FrameLifecycleState.submit,
        FrameLifecycleState.present,
        FrameLifecycleState.end,
      ];
}
