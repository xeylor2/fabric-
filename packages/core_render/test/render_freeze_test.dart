import 'package:core_render/core_render.dart';
import 'package:test/test.dart';

void main() {
  group('Frozen vocabularies — wire names (append-only)', () {
    test('RenderTargetKind (6)', () {
      expect(RenderTargetKind.values.map((v) => v.wireName), [
        'editor',
        'navigator',
        'thumbnail',
        'print_preview',
        'production_export',
        'ai_preview',
      ]);
    });

    test('RenderObjectKind', () {
      expect(RenderObjectKind.values.map((v) => v.wireName), [
        'fabric_base',
        'colour_fill',
        'motif',
        'border',
        'outline',
        'texture',
        'shadow',
        'group',
        'image',
        'preview',
      ]);
    });

    test('RenderPassKind', () {
      expect(RenderPassKind.values.map((v) => v.wireName), [
        'base',
        'fill',
        'motif',
        'border',
        'texture',
        'shadow',
        'ai_preview',
        'guides',
      ]);
    });

    test('RenderWorkItemKind', () {
      expect(RenderWorkItemKind.values.map((v) => v.wireName), [
        'tile_render',
        'pass_execution',
        'present',
      ]);
    });

    test('BudgetPhase (shared by budgets and metric phases)', () {
      expect(BudgetPhase.values.map((v) => v.wireName), [
        'update',
        'render',
        'present',
        'frame',
      ]);
    });

    test('OverrunPolicy', () {
      expect(OverrunPolicy.values.map((v) => v.wireName), [
        'defer',
        'degrade_lod',
        'progressive',
        'drop',
        'present_last',
      ]);
    });

    test('FrameLifecycleState', () {
      expect(FrameLifecycleState.values.map((v) => v.wireName), [
        'idle',
        'scheduled',
        'begin',
        'update',
        'cull',
        'record',
        'submit',
        'present',
        'end',
      ]);
    });

    test('ResourceKind (5)', () {
      expect(ResourceKind.values.map((v) => v.wireName), [
        'texture',
        'tile_cache',
        'buffer',
        'gpu_resource',
        'backend_resource',
      ]);
    });

    test(
      'TextureState / TileCacheState / BufferState / DeviceResourceState',
      () {
        expect(TextureState.values.map((v) => v.wireName), [
          'unloaded',
          'uploading',
          'resident',
          'evicted',
          'released',
        ]);
        expect(TileCacheState.values.map((v) => v.wireName), [
          'computed',
          'cached',
          'invalidated',
          'evicted',
          'recomputed',
        ]);
        expect(BufferState.values.map((v) => v.wireName), [
          'pooled',
          'acquired',
          'released',
        ]);
        expect(DeviceResourceState.values.map((v) => v.wireName), [
          'created',
          'active',
          'lost',
          'reset',
          'destroyed',
        ]);
      },
    );

    test('BackendCapabilityKind', () {
      expect(BackendCapabilityKind.values.map((v) => v.wireName), [
        'colour_managed_output',
        'offscreen_targets',
        'float_textures',
        'multisample_antialiasing',
        'multithreaded_recording',
        'incremental_present',
        'tile_caching',
        'mask_rasterization',
      ]);
    });

    test('RenderDeterminismLevel (3)', () {
      expect(RenderDeterminismLevel.values.map((v) => v.wireName), [
        'structural',
        'backend_exact',
        'cross_backend_bounded',
      ]);
    });

    test('RenderPlatform (3 — M5B-4 platform targets)', () {
      expect(RenderPlatform.values.map((v) => v.wireName), [
        'android',
        'ios',
        'windows',
      ]);
    });

    test('RenderCommandKind (10 — M5B-3 recorded commands)', () {
      expect(RenderCommandKind.values.map((v) => v.wireName), [
        'begin_frame',
        'begin_render_target',
        'begin_pass',
        'set_render_state',
        'bind_resource',
        'draw',
        'end_pass',
        'end_render_target',
        'composite',
        'end_frame',
      ]);
    });

    test('RenderMetricKind wire names', () {
      expect(RenderMetricKind.values.map((v) => v.wireName), [
        'frame_time',
        'update_time',
        'render_time',
        'present_time',
        'visible_objects',
        'total_objects',
        'culled_objects',
        'dirty_region_count',
        'dirty_region_area',
        'tiles_requested',
        'tiles_materialized',
        'tiles_evicted',
        'draw_calls',
        'cache_hit_ratio',
        'memory_usage_bytes',
        'resident_textures',
        'work_items_queued',
        'work_items_dispatched',
        'work_items_deferred',
        'frames_dropped',
        'device_reset_count',
      ]);
    });

    test('RenderMetricKind determinism tags (structural = exact)', () {
      expect(RenderMetricKind.visibleObjects.isDeterministic, isTrue);
      expect(RenderMetricKind.dirtyRegionCount.isDeterministic, isTrue);
      expect(RenderMetricKind.drawCalls.isDeterministic, isTrue);
      expect(RenderMetricKind.frameTime.isDeterministic, isFalse);
      expect(RenderMetricKind.memoryUsageBytes.isDeterministic, isFalse);
    });

    test('every vocabulary fromWireName rejects unknown input', () {
      expect(() => RenderTargetKind.fromWireName('x'), throwsArgumentError);
      expect(() => RenderPassKind.fromWireName('x'), throwsArgumentError);
      expect(() => BudgetPhase.fromWireName('x'), throwsArgumentError);
      expect(() => ResourceKind.fromWireName('x'), throwsArgumentError);
      expect(() => RenderMetricKind.fromWireName('x'), throwsArgumentError);
    });
  });

  group('Render Constitution (frozen principles & orderings)', () {
    test('eight principles, in order', () {
      expect(RenderConstitution.principles, [
        'Rendering is a read-only projection of the document.',
        'The renderer renders references only, never owned data.',
        'There is one Render Graph per document revision, rebuilt from damage.',
        'The renderer uses the one shared viewport; it never creates its own.',
        'The pipeline is backend-neutral; only the driver differs.',
        'The pipeline stage order is fixed and unskippable.',
        'The frame lifecycle is damage-driven and budgeted for 60fps.',
        'Constitution contracts are pure Dart; only the driver is Flutter tier.',
      ]);
    });

    test('principle flags all hold', () {
      expect(RenderConstitution.readOnlyProjection, isTrue);
      expect(RenderConstitution.rendersReferencesOnly, isTrue);
      expect(RenderConstitution.oneGraphPerRevision, isTrue);
      expect(RenderConstitution.singleSharedViewport, isTrue);
      expect(RenderConstitution.backendNeutral, isTrue);
      expect(RenderConstitution.fixedPipelineOrder, isTrue);
      expect(RenderConstitution.damageDrivenBudgetedFrame, isTrue);
      expect(RenderConstitution.pureContractsFlutterFreeDriverSeparate, isTrue);
    });

    test('pipeline stage order is frozen', () {
      expect(RenderConstitution.pipelineStageOrder, [
        'compile',
        'cull',
        'organize_passes',
        'enqueue',
        'schedule',
        'record',
        'composite',
        'present',
      ]);
    });

    test('pass order is frozen', () {
      expect(RenderConstitution.passOrder, [
        RenderPassKind.base,
        RenderPassKind.fill,
        RenderPassKind.motif,
        RenderPassKind.border,
        RenderPassKind.texture,
        RenderPassKind.shadow,
        RenderPassKind.aiPreview,
        RenderPassKind.guides,
      ]);
    });

    test('frame state order matches the FrameLifecycleState enum order', () {
      expect(RenderConstitution.frameStateOrder, FrameLifecycleState.values);
    });
  });
}
