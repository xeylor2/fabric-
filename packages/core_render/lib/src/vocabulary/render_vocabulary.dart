/// Frozen vocabularies of the FEBRIC Rendering Constitution (M5B-1).
///
/// Every enum carries an explicit snake_case [wireName] (the append-only
/// serialization identity, pinned by freeze tests) plus a default English
/// [label]. `fromWireName` throws on unknown input — corrupt data fails
/// loudly. Adding a value is an append-only, reviewed event; renames are
/// forbidden (ADR-0002 regime). No implementation, no rendering.
library;

/// Where a frame goes and for what purpose (Rendering Constitution §A).
/// A target is a policy configuration, never a second renderer.
enum RenderTargetKind {
  editor('editor', 'Editor'),
  navigator('navigator', 'Navigator'),
  thumbnail('thumbnail', 'Thumbnail'),
  printPreview('print_preview', 'Print Preview'),
  productionExport('production_export', 'Production Export'),
  aiPreview('ai_preview', 'AI Preview');

  const RenderTargetKind(this.wireName, this.label);

  final String wireName;
  final String label;

  static RenderTargetKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderTargetKind wire name',
    ),
  );
}

/// The category of a compiled drawable leaf (Rendering Constitution §3.9).
/// Mirrors the blueprint's content-node taxonomy (Architecture V2 §4).
enum RenderObjectKind {
  fabricBase('fabric_base', 'Fabric Base'),
  colourFill('colour_fill', 'Colour Fill'),
  motif('motif', 'Motif'),
  border('border', 'Border'),
  outline('outline', 'Outline'),
  texture('texture', 'Texture'),
  shadow('shadow', 'Shadow'),
  group('group', 'Group'),
  image('image', 'Image'),
  preview('preview', 'Preview');

  const RenderObjectKind(this.wireName, this.label);

  final String wireName;
  final String label;

  static RenderObjectKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderObjectKind wire name',
    ),
  );
}

/// A named render pass, run in the frozen order below (Constitution §3.6).
enum RenderPassKind {
  base('base', 'Base'),
  fill('fill', 'Fill'),
  motif('motif', 'Motif'),
  border('border', 'Border'),
  texture('texture', 'Texture'),
  shadow('shadow', 'Shadow'),
  aiPreview('ai_preview', 'AI Preview'),
  guides('guides', 'Guides');

  const RenderPassKind(this.wireName, this.label);

  final String wireName;
  final String label;

  static RenderPassKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderPassKind wire name',
    ),
  );
}

/// A unit of deferrable render work in the queue (Constitution §3.4).
enum RenderWorkItemKind {
  tileRender('tile_render', 'Tile Render'),
  passExecution('pass_execution', 'Pass Execution'),
  present('present', 'Present');

  const RenderWorkItemKind(this.wireName, this.label);

  final String wireName;
  final String label;

  static RenderWorkItemKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderWorkItemKind wire name',
    ),
  );
}

/// The four separated frame budget phases (Constitution §D). Also the phase
/// axis for timing metrics (§G) — one vocabulary, not duplicated.
enum BudgetPhase {
  update('update', 'Update'),
  render('render', 'Render'),
  present('present', 'Present'),
  frame('frame', 'Frame');

  const BudgetPhase(this.wireName, this.label);

  final String wireName;
  final String label;

  static BudgetPhase fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown BudgetPhase wire name',
    ),
  );
}

/// What happens when a phase exceeds its budget (Constitution §D).
enum OverrunPolicy {
  defer('defer', 'Defer to Background'),
  degradeLod('degrade_lod', 'Degrade Level of Detail'),
  progressive('progressive', 'Progressive Completion'),
  drop('drop', 'Drop Frame'),
  presentLast('present_last', 'Present Last Good Frame');

  const OverrunPolicy(this.wireName, this.label);

  final String wireName;
  final String label;

  static OverrunPolicy fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown OverrunPolicy wire name',
    ),
  );
}

/// The frame-lifecycle state machine states, in order (Constitution §3.11).
enum FrameLifecycleState {
  idle('idle', 'Idle'),
  scheduled('scheduled', 'Scheduled'),
  begin('begin', 'Begin'),
  update('update', 'Update'),
  cull('cull', 'Cull'),
  record('record', 'Record'),
  submit('submit', 'Submit'),
  present('present', 'Present'),
  end('end', 'End');

  const FrameLifecycleState(this.wireName, this.label);

  final String wireName;
  final String label;

  static FrameLifecycleState fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown FrameLifecycleState wire name',
    ),
  );
}

/// The five resource classes with distinct ownership (Constitution §C).
enum ResourceKind {
  texture('texture', 'Texture'),
  tileCache('tile_cache', 'Tile Cache'),
  buffer('buffer', 'Buffer'),
  gpuResource('gpu_resource', 'GPU Resource'),
  backendResource('backend_resource', 'Backend Resource');

  const ResourceKind(this.wireName, this.label);

  final String wireName;
  final String label;

  static ResourceKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown ResourceKind wire name',
    ),
  );
}

/// Lifecycle of a content-addressed texture (Constitution §C).
enum TextureState {
  unloaded('unloaded', 'Unloaded'),
  uploading('uploading', 'Uploading'),
  resident('resident', 'Resident'),
  evicted('evicted', 'Evicted'),
  released('released', 'Released');

  const TextureState(this.wireName, this.label);

  final String wireName;
  final String label;

  static TextureState fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown TextureState wire name',
    ),
  );
}

/// Lifecycle of a cached tile keyed by (target, coord, revision, LOD) (§C).
enum TileCacheState {
  computed('computed', 'Computed'),
  cached('cached', 'Cached'),
  invalidated('invalidated', 'Invalidated'),
  evicted('evicted', 'Evicted'),
  recomputed('recomputed', 'Recomputed');

  const TileCacheState(this.wireName, this.label);

  final String wireName;
  final String label;

  static TileCacheState fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown TileCacheState wire name',
    ),
  );
}

/// Lifecycle of a pooled buffer (Constitution §C).
enum BufferState {
  pooled('pooled', 'Pooled'),
  acquired('acquired', 'Acquired'),
  released('released', 'Released');

  const BufferState(this.wireName, this.label);

  final String wireName;
  final String label;

  static BufferState fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown BufferState wire name',
    ),
  );
}

/// Lifecycle of a backend-owned device object — GPU and backend resources
/// share these transitions (Constitution §C).
enum DeviceResourceState {
  created('created', 'Created'),
  active('active', 'Active'),
  lost('lost', 'Lost'),
  reset('reset', 'Reset'),
  destroyed('destroyed', 'Destroyed');

  const DeviceResourceState(this.wireName, this.label);

  final String wireName;
  final String label;

  static DeviceResourceState fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown DeviceResourceState wire name',
    ),
  );
}

/// Backend feature flags declared as data (Constitution §B). No leakage of
/// implementation types — consumers read flags, never the device.
enum BackendCapabilityKind {
  colourManagedOutput('colour_managed_output', 'Colour-Managed Output'),
  offscreenTargets('offscreen_targets', 'Offscreen Targets'),
  floatTextures('float_textures', 'Float/HDR Textures'),
  multisampleAntialiasing('multisample_antialiasing', 'MSAA'),
  multithreadedRecording('multithreaded_recording', 'Multithreaded Recording'),
  incrementalPresent('incremental_present', 'Incremental Present'),
  tileCaching('tile_caching', 'Tile Caching'),
  maskRasterization('mask_rasterization', 'Mask Rasterization');

  const BackendCapabilityKind(this.wireName, this.label);

  final String wireName;
  final String label;

  static BackendCapabilityKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown BackendCapabilityKind wire name',
    ),
  );
}

/// The tiered determinism guarantee a backend declares (Constitution §F).
enum RenderDeterminismLevel {
  /// Graph/objects/order/tiles are an exact pure function of the inputs.
  structural('structural', 'Structural (exact)'),

  /// Same backend + inputs ⇒ identical pixels.
  backendExact('backend_exact', 'Backend-Conditional (exact)'),

  /// Cross-backend equivalence within a documented tolerance only.
  crossBackendBounded('cross_backend_bounded', 'Cross-Backend (bounded)');

  const RenderDeterminismLevel(this.wireName, this.label);

  final String wireName;
  final String label;

  static RenderDeterminismLevel fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderDeterminismLevel wire name',
    ),
  );
}

/// Runtime metrics the rendering system exposes (Constitution §G). Each is
/// tagged [isDeterministic]: structural/scene counts are exact (L1) and may
/// be asserted in tests; timing/memory/scheduler/backend metrics are
/// runtime-variable telemetry.
enum RenderMetricKind {
  // Timing (variable) — phase axis is BudgetPhase.
  frameTime('frame_time', 'Frame Time', false),
  updateTime('update_time', 'Update Time', false),
  renderTime('render_time', 'Render Time', false),
  presentTime('present_time', 'Present Time', false),
  // Scene / graph (deterministic).
  visibleObjects('visible_objects', 'Visible Objects', true),
  totalObjects('total_objects', 'Total Objects', true),
  culledObjects('culled_objects', 'Culled Objects', true),
  dirtyRegionCount('dirty_region_count', 'Dirty Region Count', true),
  dirtyRegionArea('dirty_region_area', 'Dirty Region Area', true),
  tilesRequested('tiles_requested', 'Tiles Requested', true),
  tilesMaterialized('tiles_materialized', 'Tiles Materialized', true),
  tilesEvicted('tiles_evicted', 'Tiles Evicted', false),
  drawCalls('draw_calls', 'Draw Calls', true),
  // Cache / memory (variable).
  cacheHitRatio('cache_hit_ratio', 'Cache Hit Ratio', false),
  memoryUsageBytes('memory_usage_bytes', 'Memory Usage (bytes)', false),
  residentTextures('resident_textures', 'Resident Textures', false),
  // Scheduler (variable).
  workItemsQueued('work_items_queued', 'Work Items Queued', false),
  workItemsDispatched('work_items_dispatched', 'Work Items Dispatched', false),
  workItemsDeferred('work_items_deferred', 'Work Items Deferred', false),
  framesDropped('frames_dropped', 'Frames Dropped', false),
  // Backend (variable).
  deviceResetCount('device_reset_count', 'Device Reset Count', false);

  const RenderMetricKind(this.wireName, this.label, this.isDeterministic);

  final String wireName;
  final String label;

  /// True when this metric is a pure function of the render inputs (L1) and
  /// may be asserted exactly; false for runtime-variable telemetry.
  final bool isDeterministic;

  static RenderMetricKind fromWireName(String name) => values.firstWhere(
    (v) => v.wireName == name,
    orElse: () => throw ArgumentError.value(
      name,
      'name',
      'Unknown RenderMetricKind wire name',
    ),
  );
}
