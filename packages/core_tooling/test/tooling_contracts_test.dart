import 'package:core_interaction/core_interaction.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_textile/core_textile.dart';
import 'package:core_tooling/core_tooling.dart';
import 'package:test/test.dart';

/// Compile-time proof that the fourteen-member contract is implementable
/// and complete: a minimal conforming tool. (Interface freeze: adding a
/// member breaks this test's compilation — by design.)
final class _ContractProbeTool implements UniversalToolContract {
  ToolContext? _context;
  var _active = false;
  var _cancelled = false;

  @override
  Future<void> initialize(ToolContext context) async => _context = context;

  @override
  Future<void> dispose() async => _context = null;

  @override
  Future<void> activate() async => _active = true;

  @override
  Future<void> deactivate() async => _active = false;

  @override
  Future<ToolPreview> preview(ToolRequest request) async => ToolPreview(
    previewId: 'preview-1',
    description: 'Would affect ${request.targetIds.length} target(s)',
  );

  @override
  Future<ToolResult> execute(ToolRequest request) async {
    if (!_active) {
      return const ToolResult(
        status: ToolResultStatus.rejected,
        message: 'Tool inactive',
      );
    }
    return ToolResult.success;
  }

  @override
  Future<void> cancel() async => _cancelled = true;

  @override
  Future<ToolResult> undo() async => ToolResult.success;

  @override
  Future<ToolResult> redo() async => ToolResult.success;

  @override
  SelectionState selection() => _context?.selection ?? SelectionState.empty;

  @override
  ViewportState viewport() =>
      _context?.viewport ??
      const ViewportState(canvasSize: Size2D.zero, screenSize: Size2D.zero);

  @override
  ToolHistory history() => ToolHistory.empty;

  @override
  LockSet lock() => _context?.locks ?? LockSet.none;

  @override
  ToolMetadata metadata() =>
      const ToolMetadata(tool: FebricTool.repeatPattern, version: '0.1.0');

  bool get wasCancelled => _cancelled;
}

void main() {
  test(
    'the fourteen-member tool contract is implementable end to end',
    () async {
      final tool = _ContractProbeTool();
      const context = ToolContext(
        viewport: ViewportState(
          canvasSize: Size2D(width: 1000, height: 1000),
          screenSize: Size2D(width: 800, height: 600),
        ),
        locks: LockSet(locks: [LockState(scope: LockScope.export)]),
      );

      await tool.initialize(context);
      expect(
        (await tool.execute(const ToolRequest())).status,
        ToolResultStatus.rejected,
        reason: 'execution before activation is rejected, not thrown',
      );

      await tool.activate();
      final preview = await tool.preview(
        const ToolRequest(targetIds: ['node-1']),
      );
      expect(preview.description, contains('1 target'));
      expect(
        (await tool.execute(const ToolRequest())).status,
        ToolResultStatus.success,
      );

      expect(tool.lock().isLocked(LockScope.export), isTrue);
      expect(tool.metadata().tool, FebricTool.repeatPattern);
      expect(tool.viewport().screenSize.width, 800);

      await tool.cancel();
      expect(tool.wasCancelled, isTrue);
      await tool.deactivate();
      await tool.dispose();
      expect(tool.selection(), SelectionState.empty);
    },
  );

  test('ToolResultStatus wire names are frozen', () {
    expect(ToolResultStatus.values.map((v) => v.wireName), [
      'success',
      'cancelled',
      'rejected',
      'failed',
    ]);
  });

  test('tool models round-trip json (FebricTool via wire name)', () {
    const metadata = ToolMetadata(
      tool: FebricTool.colourShift,
      version: '1.0.0',
      aiBacked: false,
    );
    expect(ToolMetadata.fromJson(metadata.toJson()), metadata);
    expect(metadata.toJson()['tool'], 'colour_shift');

    const request = ToolRequest(
      targetIds: ['n1', 'n2'],
      region: Rect2D(left: 0, top: 0, width: 10, height: 10),
      parameters: {'hueShift': 20},
      seed: 7,
    );
    expect(ToolRequest.fromJson(request.toJson()), request);
  });

  group('canvas contract models', () {
    test('coordinate system converts physical units at its DPI', () {
      const system = CanvasCoordinateSystem();
      expect(system.unit, MeasurementUnit.millimetre);
      expect(system.convertTo(25.4, MeasurementUnit.inch), closeTo(1, 1e-12));
      expect(
        system.convertTo(25.4, MeasurementUnit.pixel),
        closeTo(300, 1e-9),
        reason: '1 inch at 300 DPI',
      );
    });

    test('snapping, grid and guide defaults are production-sane', () {
      expect(SnappingConfig.standard.enabled, isTrue);
      expect(SnappingConfig.standard.threshold, 6.0);
      expect(GridSpec.standard.visible, isFalse);
      expect(GuideOrientation.values.map((v) => v.wireName), [
        'horizontal',
        'vertical',
      ]);
    });

    test('measurement resolves canvas distance', () {
      const measurement = Measurement(
        from: Point2D(x: 0, y: 0),
        to: Point2D(x: 30, y: 40),
      );
      expect(measurement.canvasDistance, 50);
      expect(Measurement.fromJson(measurement.toJson()), measurement);
    });

    test('json round trips for canvas models', () {
      const guide = GuideModel(
        id: 'g1',
        orientation: GuideOrientation.vertical,
        position: 105.5,
        locked: true,
      );
      expect(GuideModel.fromJson(guide.toJson()), guide);
      expect(
        CanvasCoordinateSystem.fromJson(
          const CanvasCoordinateSystem(dotsPerInch: 150).toJson(),
        ),
        const CanvasCoordinateSystem(dotsPerInch: 150),
      );
    });
  });
}
