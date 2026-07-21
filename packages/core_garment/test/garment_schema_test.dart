import 'package:core_garment/core_garment.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M13F verification suite — GarmentSchema model family.
///
/// The Kurta fixture below is TEST-SUPPLIED schema content: the package
/// ships no launch schemas (the approved injected-content doctrine).
void main() {
  group('freeze — model JSON round-trips on frozen vocabularies', () {
    test('schema round-trips; garment/part/unit serialize by wire name', () {
      final schema = kurtaSchema();
      expect(GarmentSchema.fromJson(schema.toJson()), schema);
      final json = schema.toJson();
      expect(json['garment'], 'kurta');
      expect(json['unit'], 'cm');
      final parts = json['parts']! as List;
      expect((parts[0] as Map)['part'], 'sleeve');
    });

    test('PartInsets follows the frozen four-sided shape; zero constant; '
        'negative values assert', () {
      const insets = PartInsets(left: 1.5, top: 1, right: 1.5, bottom: 2);
      expect(PartInsets.fromJson(insets.toJson()), insets);
      expect(PartInsets.zero.left, 0);
      expect(() => PartInsets(left: -0.1), throwsA(isA<AssertionError>()));
    });

    test('structural asserts: cardinality >= 1, schemaVersion >= 1', () {
      expect(
        () => PartDefinition(
          part: GarmentPart.sleeve,
          cardinality: 0,
          panelSize: const Size2D(width: 30, height: 60),
        ),
        throwsA(isA<AssertionError>()),
      );
      expect(
        () => GarmentSchema(
          id: 's',
          garment: GarmentType.kurta,
          schemaVersion: 0,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('anchors remain documented schema data (no typed model)', () {
      final sleeve = kurtaSchema().parts[0];
      expect(sleeve.metadata['anchors'], isA<List<Object?>>());
      // Round-trips through the open seam untouched.
      final restored = PartDefinition.fromJson(sleeve.toJson());
      expect(restored.metadata['anchors'], sleeve.metadata['anchors']);
    });

    test('symmetry links are data relations only', () {
      const link = SymmetryLink(group: 'sleeves', instances: ['left', 'right']);
      expect(SymmetryLink.fromJson(link.toJson()), link);
      expect(link.linked, isTrue); // §3: shared by default
      expect(link.copyWith(linked: false).linked, isFalse); // breakable
    });
  });
}

/// Minimal Kurta schema — test-supplied content.
GarmentSchema kurtaSchema() => const GarmentSchema(
  id: 'kurta-test-v1',
  garment: GarmentType.kurta,
  parts: [
    PartDefinition(
      part: GarmentPart.sleeve,
      cardinality: 2,
      panelSize: Size2D(width: 30, height: 60),
      seamAllowance: PartInsets(left: 1.5, top: 1, right: 1.5, bottom: 1),
      bleed: PartInsets(left: 0.3, top: 0.3, right: 0.3, bottom: 0.3),
      zoneSlots: [
        ZoneSlot(id: 'cuff-zone', name: 'Cuff Zone', accepts: ['border']),
      ],
      symmetryGroup: 'sleeves',
      metadata: {
        'anchors': [
          {'name': 'shoulder', 'x': 15.0, 'y': 0.0},
        ],
      },
    ),
    PartDefinition(
      part: GarmentPart.base,
      panelSize: Size2D(width: 60, height: 110),
      zoneSlots: [
        ZoneSlot(id: 'field', name: 'Field'),
        ZoneSlot(id: 'hem-zone', name: 'Hem Zone'),
      ],
    ),
  ],
  symmetryLinks: [
    SymmetryLink(group: 'sleeves', instances: ['left', 'right']),
  ],
);
