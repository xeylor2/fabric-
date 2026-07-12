import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

void main() {
  test('every garment type has a non-empty anatomy', () {
    for (final type in GarmentType.values) {
      expect(
        GarmentAnatomy.of(type),
        isNotEmpty,
        reason: '${type.label} must define parts',
      );
    }
  });

  test('kurta anatomy matches the M1 domain mandate exactly', () {
    expect(GarmentAnatomy.of(GarmentType.kurta), const [
      GarmentPart.base,
      GarmentPart.neck,
      GarmentPart.sleeve,
      GarmentPart.cuff,
      GarmentPart.hem,
      GarmentPart.border,
      GarmentPart.heroMotif,
      GarmentPart.secondaryMotif,
      GarmentPart.fillerMotif,
      GarmentPart.ground,
      GarmentPart.texture,
      GarmentPart.buttons,
    ]);
  });

  test('dupatta anatomy matches the M1 domain mandate exactly', () {
    expect(GarmentAnatomy.of(GarmentType.dupatta), const [
      GarmentPart.topPallu,
      GarmentPart.middleField,
      GarmentPart.bottomPallu,
      GarmentPart.leftBorder,
      GarmentPart.rightBorder,
      GarmentPart.cornerMotif,
      GarmentPart.fringe,
    ]);
  });

  test('pant anatomy matches the M1 domain mandate exactly', () {
    expect(GarmentAnatomy.of(GarmentType.pant), const [
      GarmentPart.waist,
      GarmentPart.leg,
      GarmentPart.hem,
      GarmentPart.border,
    ]);
  });

  test('anatomies contain no duplicate parts', () {
    for (final type in GarmentType.values) {
      final parts = GarmentAnatomy.of(type);
      expect(
        parts.toSet().length,
        parts.length,
        reason: '${type.label} anatomy has duplicates',
      );
    }
  });
}
