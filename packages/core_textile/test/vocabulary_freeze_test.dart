import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// Wire-format freeze tests (ADR-0002).
///
/// These lists are the *serialized contract* of the FEBRIC domain: they may
/// grow (append only), but an existing name may never change or disappear —
/// documents, AI payloads and content packs depend on them. Changing an
/// expectation here requires an ADR.
void main() {
  test('GarmentType wire names are frozen', () {
    expect(GarmentType.values.map((v) => v.wireName), [
      'kurta',
      'pant',
      'dupatta',
      'shawl',
      'saree',
      'abaya',
    ]);
  });

  test('GarmentPart wire names are frozen', () {
    expect(GarmentPart.values.map((v) => v.wireName), [
      'base',
      'neck',
      'sleeve',
      'cuff',
      'hem',
      'border',
      'hero_motif',
      'secondary_motif',
      'filler_motif',
      'ground',
      'texture',
      'buttons',
      'top_pallu',
      'middle_field',
      'bottom_pallu',
      'left_border',
      'right_border',
      'corner_motif',
      'fringe',
      'waist',
      'leg',
    ]);
  });

  test('TextileObjectType wire names are frozen', () {
    expect(TextileObjectType.values.map((v) => v.wireName), [
      'motif',
      'pattern',
      'border',
      'texture',
      'colour_palette',
      'fabric',
      'embroidery',
      'lace',
      'patch',
      'print_layer',
    ]);
  });

  test('RepeatType wire names are frozen', () {
    expect(RepeatType.values.map((v) => v.wireName), [
      'straight',
      'half_drop',
      'half_brick',
      'mirror',
      'diamond',
      'toss',
      'custom_offset',
      'seamless',
    ]);
  });

  test('ColourOperation wire names are frozen', () {
    expect(ColourOperation.values.map((v) => v.wireName), [
      'shift_motif_colour',
      'shift_base_colour',
      'global_colour_shift',
      'palette_swap',
    ]);
  });

  test('AiOperation wire names are frozen', () {
    expect(AiOperation.values.map((v) => v.wireName), [
      'print_ready_enhancement',
      'enhance_model_cloth',
      'motif_refinement',
      'redesign_textile_print',
      'background_cleanup',
      'fabric_restoration',
    ]);
  });

  test('DesignNodeType wire names are frozen', () {
    expect(DesignNodeType.values.map((v) => v.wireName), [
      'project',
      'artwork',
      'garment',
      'garment_part',
      'zone',
      'element',
      'group',
    ]);
  });

  test('WorkspaceCategory wire names are frozen (Tools is permanent)', () {
    expect(WorkspaceCategory.values.map((v) => v.wireName), [
      'dashboard',
      'projects',
      'library',
      'canvas',
      'conversation',
      'design_tree',
      'inspector',
      'tools',
      'production',
      'settings',
    ]);
  });

  group('fromWireName', () {
    test('round-trips every value of every enum', () {
      for (final v in GarmentType.values) {
        expect(GarmentType.fromWireName(v.wireName), v);
      }
      for (final v in GarmentPart.values) {
        expect(GarmentPart.fromWireName(v.wireName), v);
      }
      for (final v in TextileObjectType.values) {
        expect(TextileObjectType.fromWireName(v.wireName), v);
      }
      for (final v in RepeatType.values) {
        expect(RepeatType.fromWireName(v.wireName), v);
      }
      for (final v in ColourOperation.values) {
        expect(ColourOperation.fromWireName(v.wireName), v);
      }
      for (final v in AiOperation.values) {
        expect(AiOperation.fromWireName(v.wireName), v);
      }
      for (final v in DesignNodeType.values) {
        expect(DesignNodeType.fromWireName(v.wireName), v);
      }
      for (final v in WorkspaceCategory.values) {
        expect(WorkspaceCategory.fromWireName(v.wireName), v);
      }
      for (final v in FebricTool.values) {
        expect(FebricTool.fromWireName(v.wireName), v);
      }
    });

    test('rejects unknown names loudly', () {
      expect(() => GarmentType.fromWireName('sock'), throwsArgumentError);
      expect(() => RepeatType.fromWireName(''), throwsArgumentError);
      expect(() => DesignNodeType.fromWireName('layer'), throwsArgumentError);
    });
  });

  test('every value has a non-empty display label', () {
    final allLabels = [
      ...GarmentType.values.map((v) => v.label),
      ...GarmentPart.values.map((v) => v.label),
      ...TextileObjectType.values.map((v) => v.label),
      ...RepeatType.values.map((v) => v.label),
      ...ColourOperation.values.map((v) => v.label),
      ...AiOperation.values.map((v) => v.label),
      ...DesignNodeType.values.map((v) => v.label),
      ...WorkspaceCategory.values.map((v) => v.label),
      ...FebricTool.values.map((v) => v.label),
    ];
    expect(allLabels.every((l) => l.trim().isNotEmpty), isTrue);
  });
}
