import 'package:core_geometry/core_geometry.dart';
import 'package:core_production/core_production.dart';
import 'package:test/test.dart';

/// M13A verification suite — ProductionJob model.
void main() {
  group('freeze — vocabularies', () {
    test('ProductionStage wire names are frozen — the §12 pipeline in '
        'order', () {
      expect(ProductionStage.values.map((v) => v.wireName), [
        'preflight',
        'render',
        'color',
        'encode',
        'package',
      ]);
      for (final v in ProductionStage.values) {
        expect(ProductionStage.fromWireName(v.wireName), v);
      }
      expect(() => ProductionStage.fromWireName('proof'), throwsArgumentError);
    });

    test('previous encodes the frozen order as data', () {
      expect(ProductionStage.preflight.previous, isNull);
      expect(ProductionStage.render.previous, ProductionStage.preflight);
      expect(ProductionStage.package.previous, ProductionStage.encode);
    });

    test('ProductionDeliverable wire names are frozen — the §12 '
        'deliverables', () {
      expect(ProductionDeliverable.values.map((v) => v.wireName), [
        'repeat_tile',
        'panel_set',
        'yardage_strike_off',
      ]);
      for (final v in ProductionDeliverable.values) {
        expect(ProductionDeliverable.fromWireName(v.wireName), v);
      }
      expect(
        () => ProductionDeliverable.fromWireName('sample_book'),
        throwsArgumentError,
      );
    });
  });

  group('freeze — model JSON round-trip', () {
    test('job round-trips with frozen unit/deliverable wire names and '
        'embedded physical size + DPI (§12)', () {
      final job = _job();
      expect(ProductionJob.fromJson(job.toJson()), job);
      final json = job.toJson();
      expect(json['deliverable'], 'repeat_tile');
      expect(json['unit'], 'cm');
      expect(json['dpi'], 300.0);
      expect((json['physicalSize'] as Map)['width'], 64.0);
    });

    test('dpi must be positive (assert)', () {
      expect(() => _job(dpi: 0), throwsA(isA<AssertionError>()));
    });
  });

  group('stage machine — unskippable by construction', () {
    test('advanceTo walks the §12 pipeline strictly in order', () {
      var job = _job();
      expect(job.currentStage, isNull);
      expect(job.nextStage, ProductionStage.preflight);
      expect(job.isComplete, isFalse);
      for (final stage in ProductionStage.values) {
        job = job.advanceTo(stage);
        expect(job.currentStage, stage);
      }
      expect(job.isComplete, isTrue);
      expect(job.nextStage, isNull);
    });

    test('skipping or reordering throws StateError; completed job '
        'advances nowhere', () {
      final job = _job();
      expect(() => job.advanceTo(ProductionStage.render), throwsStateError);
      expect(() => job.advanceTo(ProductionStage.package), throwsStateError);
      final preflighted = job.advanceTo(ProductionStage.preflight);
      expect(
        () => preflighted.advanceTo(ProductionStage.preflight),
        throwsStateError,
      );
      var done = job;
      for (final stage in ProductionStage.values) {
        done = done.advanceTo(stage);
      }
      for (final stage in ProductionStage.values) {
        expect(() => done.advanceTo(stage), throwsStateError);
      }
    });

    test('advanceTo returns copies — the original is immutable', () {
      final job = _job();
      job.advanceTo(ProductionStage.preflight);
      expect(job.completed, isEmpty);
    });
  });
}

ProductionJob _job({double dpi = 300}) => ProductionJob(
  id: 'pj-1',
  documentId: 'doc-1',
  artboardIds: const ['ab-1'],
  deliverable: ProductionDeliverable.repeatTile,
  physicalSize: const Size2D(width: 64, height: 64),
  unit: MeasurementUnit.centimetre,
  dpi: dpi,
);
