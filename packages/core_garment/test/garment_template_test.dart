import 'package:core_garment/core_garment.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'garment_schema_test.dart' show kurtaSchema;

/// M13G verification suite — GarmentTemplate + TemplatePack models.
///
/// Every template, pack, taxonomy axis and starter fragment below is
/// TEST-SUPPLIED content: the package ships none (the approved
/// injected-content doctrine).
void main() {
  group('freeze — GarmentTemplate model', () {
    test('JSON round-trip preserves the full §2 shape', () {
      final template = kurtaTemplate();
      expect(GarmentTemplate.fromJson(template.toJson()), template);
      final json = template.toJson();
      expect(json['schemaRef'], 'kurta-test-v1'); // Q1: a plain string id
      expect(json['contentVersion'], 2);
    });

    test('starterDesign embeds an optional DesignNode subtree (Q4): '
        'present round-trips whole; absent stays null', () {
      final withStarter = kurtaTemplate();
      final restored = GarmentTemplate.fromJson(withStarter.toJson());
      expect(restored.starterDesign, withStarter.starterDesign);
      expect(restored.starterDesign!.children, hasLength(1));

      final bare = kurtaTemplate().copyWith(starterDesign: null);
      expect(GarmentTemplate.fromJson(bare.toJson()).starterDesign, isNull);
    });

    test('taxonomy is open multi-axis string data (Q3): axes and tags '
        'round-trip untyped', () {
      final template = kurtaTemplate();
      final restored = GarmentTemplate.fromJson(template.toJson());
      expect(restored.taxonomy, template.taxonomy);
      expect(restored.taxonomy['tier'], ['test-tier-a']);
    });

    test('authorship is data only (Q6 seam): round-trips untyped', () {
      final restored = GarmentTemplate.fromJson(kurtaTemplate().toJson());
      expect(restored.authorship['origin'], 'test-suite');
    });

    test('structural assert: contentVersion >= 1', () {
      expect(
        () => GarmentTemplate(id: 't', schemaRef: 's', contentVersion: 0),
        throwsA(isA<AssertionError>()),
      );
    });

    test('defaults: empty options/taxonomy/authorship, no starter, v1', () {
      const template = GarmentTemplate(id: 't-min', schemaRef: 's-1');
      expect(template.structureOptions, isEmpty);
      expect(template.starterDesign, isNull);
      expect(template.taxonomy, isEmpty);
      expect(template.authorship, isEmpty);
      expect(template.contentVersion, 1);
    });
  });

  group('freeze — TemplatePack model', () {
    test('JSON round-trip: a pack carries templates and schemas as '
        'own-stage values', () {
      final pack = testPack();
      expect(TemplatePack.fromJson(pack.toJson()), pack);
      expect(pack.templates, hasLength(1));
      expect(pack.schemas.single.id, 'kurta-test-v1');
    });

    test('a template-only pack carries no schemas (the separate '
        'content/schemas channel)', () {
      final pack = TemplatePack(
        id: 'pack-templates-only',
        name: 'Templates Only',
        templates: [kurtaTemplate()],
      );
      expect(pack.schemas, isEmpty);
      expect(TemplatePack.fromJson(pack.toJson()), pack);
    });

    test('structural assert: packVersion >= 1', () {
      expect(
        () => TemplatePack(id: 'p', name: 'P', packVersion: 0),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}

/// Minimal Kurta template — test-supplied content. The starter fragment
/// carries authoring-time ids (re-minted by the binder at instantiation)
/// and an asset reference authored as metadata string data (the approved
/// Q1/Q4 reading: keys appear in content only, never in package source).
GarmentTemplate kurtaTemplate() => const GarmentTemplate(
  id: 'kurta-classic-test',
  schemaRef: 'kurta-test-v1',
  structureOptions: {'neck': 'round'},
  starterDesign: DesignNode(
    id: 'starter-root',
    name: 'Classic Kurta',
    type: DesignNodeType.garment,
    metadata: {'garment_type': 'kurta'},
    children: [
      DesignNode(
        id: 'starter-base',
        name: 'Base',
        type: DesignNodeType.garmentPart,
        metadata: {'part': 'base'},
        children: [
          DesignNode(
            id: 'starter-field',
            name: 'Field',
            type: DesignNodeType.zone,
            metadata: {
              'zone_slot': 'field',
              'asset_refs': ['asset-motif-1'],
            },
          ),
        ],
      ),
    ],
  ),
  taxonomy: {
    'region': ['test-region-a', 'test-region-b'],
    'tier': ['test-tier-a'],
  },
  authorship: {'origin': 'test-suite'},
  contentVersion: 2,
);

/// Minimal pack — test-supplied content; ships one schema + one template
/// (§2 "new garments ship as data").
TemplatePack testPack() => TemplatePack(
  id: 'pack-test-v1',
  name: 'Test Pack',
  packVersion: 3,
  templates: [kurtaTemplate()],
  schemas: [kurtaSchema()],
);
