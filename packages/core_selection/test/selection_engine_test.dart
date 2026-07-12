import 'package:core_geometry/core_geometry.dart';
import 'package:core_selection/core_selection.dart';
import 'package:test/test.dart';

SelectionSnapshot _snapshot(int revision, {String id = ''}) {
  return SelectionSnapshot(
    id: id.isEmpty ? 'snap-$revision' : id,
    revision: revision,
    regions: [
      SelectionRegion(
        id: 'region-$revision',
        kind: SelectionShapeKind.rectangle,
        bounds: Rect2D(left: 0, top: 0, width: 10.0 * revision, height: 10),
      ),
    ],
  );
}

void main() {
  test('SelectionShapeKind wire names are frozen — the ten techniques', () {
    expect(SelectionShapeKind.values.map((v) => v.wireName), [
      'rectangle',
      'ellipse',
      'polygon',
      'lasso',
      'brush',
      'magic_wand',
      'quick_select',
      'ai_select',
      'select_similar',
      'select_colour',
    ]);
    expect(SelectionShapeKind.aiSelect.isAiAssisted, isTrue);
    expect(SelectionShapeKind.lasso.isAiAssisted, isFalse);
  });

  test('SelectionRefinementKind wire names are frozen', () {
    expect(SelectionRefinementKind.values.map((v) => v.wireName), [
      'grow',
      'shrink',
      'feather',
      'inverse',
    ]);
  });

  test('regions carry technique parameters strongly typed', () {
    const wand = SelectionRegion(
      id: 'r1',
      kind: SelectionShapeKind.magicWand,
      bounds: Rect2D(left: 0, top: 0, width: 50, height: 50),
      tolerance: 0.25,
      colourHex: '#8C2B4A',
    );
    expect(SelectionRegion.fromJson(wand.toJson()), wand);

    const lasso = SelectionRegion(
      id: 'r2',
      kind: SelectionShapeKind.lasso,
      bounds: Rect2D(left: 0, top: 0, width: 5, height: 5),
      points: [Point2D(x: 0, y: 0), Point2D(x: 5, y: 2), Point2D(x: 3, y: 5)],
    );
    expect(SelectionRegion.fromJson(lasso.toJson()), lasso);
  });

  group('SelectionHistory', () {
    test('push / undo / redo with cursor semantics', () {
      var history = SelectionHistory.empty;
      expect(history.current, isNull);
      expect(history.canUndo, isFalse);
      expect(history.canRedo, isFalse);

      history = history
          .push(_snapshot(1))
          .push(_snapshot(2))
          .push(_snapshot(3));
      expect(history.current!.revision, 3);
      expect(history.canUndo, isTrue);

      history = history.undo();
      expect(history.current!.revision, 2);
      expect(history.canRedo, isTrue);

      history = history.redo();
      expect(history.current!.revision, 3);
      expect(history.redo(), history, reason: 'redo at tip is a no-op');
    });

    test('pushing after undo truncates the redo branch', () {
      var history = SelectionHistory.empty
          .push(_snapshot(1))
          .push(_snapshot(2))
          .undo();
      history = history.push(_snapshot(9));
      expect(history.current!.revision, 9);
      expect(history.canRedo, isFalse);
      expect(history.snapshots.map((s) => s.revision), [1, 9]);
    });

    test('history is bounded by maxSnapshots', () {
      var history = const SelectionHistory(maxSnapshots: 4);
      for (var i = 1; i <= 10; i++) {
        history = history.push(_snapshot(i));
      }
      expect(history.snapshots.length, 4);
      expect(history.snapshots.first.revision, 7);
      expect(history.current!.revision, 10);
    });

    test('json round trip', () {
      final history = SelectionHistory.empty.push(_snapshot(1));
      expect(SelectionHistory.fromJson(history.toJson()), history);
    });
  });
}
