import 'package:core_garment/core_garment.dart';
import 'package:test/test.dart';

import 'garment_schema_test.dart' show kurtaSchema;
import 'garment_template_test.dart' show kurtaTemplate, testPack;

/// M13G verification suite — GarmentTemplateRegistry (the approved Q5
/// ruling: synchronous, origin-blind, version-blind; frozen registry
/// semantics). All registered content is test-supplied.
void main() {
  group('registry semantics — the frozen M11/M12D/M12F pattern', () {
    test('register returns the id; lookup returns the instance', () {
      final registry = GarmentTemplateRegistryImpl();
      expect(registry.registerTemplate(kurtaTemplate()), 'kurta-classic-test');
      expect(registry.registerSchema(kurtaSchema()), 'kurta-test-v1');
      expect(registry.templateFor('kurta-classic-test'), kurtaTemplate());
      expect(registry.schemaFor('kurta-test-v1'), kurtaSchema());
      expect(registry.isTemplateRegistered('kurta-classic-test'), isTrue);
    });

    test('lookup misses return null, never throw', () {
      final registry = GarmentTemplateRegistryImpl();
      expect(registry.templateFor('absent'), isNull);
      expect(registry.schemaFor('absent'), isNull);
      expect(registry.packFor('absent'), isNull);
      expect(registry.isTemplateRegistered('absent'), isFalse);
    });

    test('re-registration replaces the instance', () {
      final registry = GarmentTemplateRegistryImpl();
      registry.registerTemplate(kurtaTemplate());
      final revised = kurtaTemplate().copyWith(contentVersion: 5);
      registry.registerTemplate(revised);
      expect(registry.templateFor('kurta-classic-test'), revised);
      expect(registry.registeredTemplateIds, ['kurta-classic-test']);
    });

    test('registered ids list in registration order', () {
      final registry = GarmentTemplateRegistryImpl();
      registry.registerTemplate(kurtaTemplate().copyWith(id: 't-b'));
      registry.registerTemplate(kurtaTemplate().copyWith(id: 't-a'));
      expect(registry.registeredTemplateIds, ['t-b', 't-a']);
    });

    test('version-blind (Q7): a lower contentVersion replaces a higher '
        'one — no comparison policy exists', () {
      final registry = GarmentTemplateRegistryImpl();
      registry.registerTemplate(kurtaTemplate().copyWith(contentVersion: 9));
      registry.registerTemplate(kurtaTemplate().copyWith(contentVersion: 1));
      expect(registry.templateFor('kurta-classic-test')!.contentVersion, 1);
    });

    test('origin-blind (Q6): authorship never affects registration', () {
      final registry = GarmentTemplateRegistryImpl();
      final userAuthored = kurtaTemplate().copyWith(
        id: 't-user',
        authorship: {'origin': 'user'},
      );
      registry.registerTemplate(userAuthored);
      expect(registry.templateFor('t-user'), userAuthored);
    });
  });

  group('packs — registerPack registers contents under their own ids', () {
    test('pack, its schemas and its templates all resolve afterwards', () {
      final registry = GarmentTemplateRegistryImpl();
      expect(registry.registerPack(testPack()), 'pack-test-v1');
      expect(registry.packFor('pack-test-v1'), testPack());
      expect(registry.templateFor('kurta-classic-test'), kurtaTemplate());
      expect(registry.schemaFor('kurta-test-v1'), kurtaSchema());
      expect(registry.registeredPackIds, ['pack-test-v1']);
    });

    test('last registration wins across packs (the frozen replace '
        'semantics; no conflict policy)', () {
      final registry = GarmentTemplateRegistryImpl();
      registry.registerPack(testPack());
      final revisedTemplate = kurtaTemplate().copyWith(contentVersion: 7);
      registry.registerPack(
        testPack().copyWith(id: 'pack-test-v2', templates: [revisedTemplate]),
      );
      expect(registry.templateFor('kurta-classic-test')!.contentVersion, 7);
      expect(registry.registeredPackIds, ['pack-test-v1', 'pack-test-v2']);
    });
  });

  group('taxonomy filter — Q3 pure mechanics over injected data', () {
    test('exact axis/tag match, in registration order', () {
      final registry = GarmentTemplateRegistryImpl();
      final a = kurtaTemplate().copyWith(
        id: 't-a',
        taxonomy: {
          'region': ['test-region-a'],
        },
      );
      final b = kurtaTemplate().copyWith(
        id: 't-b',
        taxonomy: {
          'region': ['test-region-a', 'test-region-b'],
          'tier': ['test-tier-a'],
        },
      );
      registry.registerTemplate(a);
      registry.registerTemplate(b);
      expect(registry.templatesWhere('region', 'test-region-a'), [a, b]);
      expect(registry.templatesWhere('region', 'test-region-b'), [b]);
      expect(registry.templatesWhere('tier', 'test-tier-a'), [b]);
    });

    test('absent axis or tag → empty, never an error', () {
      final registry = GarmentTemplateRegistryImpl();
      registry.registerTemplate(kurtaTemplate());
      expect(registry.templatesWhere('absent-axis', 'x'), isEmpty);
      expect(registry.templatesWhere('tier', 'absent-tag'), isEmpty);
    });
  });
}
