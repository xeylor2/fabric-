import 'package:core_canvas/core_canvas.dart';
import 'package:core_interaction/core_interaction.dart';
import 'package:core_selection_runtime/core_selection_runtime.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------- fixtures
HitTestResult _nodeHit(String id) => HitTestResult(
  kind: HitTargetKind.node,
  documentPoint: const Point2D(x: 10, y: 10),
  semanticNodeId: id,
);

HitTestResult _miss() => HitTestResult.miss(const Point2D(x: 90, y: 90));

const _primary = KeyModifiers(control: true); // toggle
const _shift = KeyModifiers(shift: true); // add

void main() {
  group('SelectionRuntime — starts empty and exposes frozen state', () {
    test('is empty by default and exposes the frozen SelectionState', () {
      final r = SelectionRuntime();
      expect(r.isEmpty, isTrue);
      expect(r.selection, SelectionState.empty);
    });

    test('honours a seeded starting selection', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'a', 'b'}),
      );
      expect(r.selection.count, 2);
      expect(r.isEmpty, isFalse);
    });
  });

  group('applyHit — reuses frozen SelectionState + SelectionMode exactly', () {
    test('node hit with no modifier replaces (frozen replace policy)', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'old'}),
      );
      final result = r.applyHit(_nodeHit('node-1'));
      expect(result.selectedIds, {'node-1'});
      expect(r.selection.selectedIds, {'node-1'});
    });

    test('node hit with shift adds (frozen add policy)', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'a'}),
      );
      r.applyHit(_nodeHit('b'), modifiers: _shift);
      expect(r.selection.selectedIds, {'a', 'b'});
    });

    test('node hit with primary toggles membership (frozen toggle policy)', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'a', 'b'}),
      );
      r.applyHit(_nodeHit('b'), modifiers: _primary); // b already in → removed
      expect(r.selection.selectedIds, {'a'});
      r.applyHit(_nodeHit('c'), modifiers: _primary); // c absent → added
      expect(r.selection.selectedIds, {'a', 'c'});
    });

    test('the runtime derives mode via the frozen forModifiers policy', () {
      // Prove the runtime adds no policy of its own: applyHit must equal the
      // frozen SelectionState.select with the frozen forModifiers mode.
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'a'}),
      );
      final viaRuntime = r.applyHit(_nodeHit('b'), modifiers: _shift);
      final viaFrozen = const SelectionState(
        selectedIds: {'a'},
      ).select('b', mode: SelectionMode.forModifiers(_shift));
      expect(viaRuntime, viaFrozen);
    });

    test('miss with no modifier clears (plain click on empty canvas)', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'a', 'b'}),
      );
      final result = r.applyHit(_miss());
      expect(result, SelectionState.empty);
      expect(r.isEmpty, isTrue);
    });

    test('miss with a held modifier leaves the selection unchanged', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'a'}),
      );
      r.applyHit(_miss(), modifiers: _shift);
      expect(r.selection.selectedIds, {'a'});
    });
  });

  group('selectAll / clear — thin passthrough to frozen operations', () {
    test('selectAll replaces via the frozen SelectionState.selectAll', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'x'}),
      );
      final result = r.selectAll(['a', 'b', 'c']);
      expect(result.selectedIds, {'a', 'b', 'c'});
    });

    test('clear empties via the frozen SelectionState.cleared', () {
      final r = SelectionRuntime(
        selection: const SelectionState(selectedIds: {'a', 'b'}),
      );
      expect(r.clear(), SelectionState.empty);
      expect(r.isEmpty, isTrue);
    });
  });
}
