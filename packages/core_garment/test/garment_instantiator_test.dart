import 'package:core_document/core_document.dart';
import 'package:core_garment/core_garment.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

import 'garment_schema_test.dart' show kurtaSchema;

/// M13F verification suite — deterministic instantiation.
void main() {
  const instantiator = SchemaGarmentInstantiator();

  group('the instance subtree — §3 schema vs instance', () {
    test('root is a garment node typed by the frozen vocabulary with the '
        'frozen garment_type key', () {
      final tree = instantiator.instantiate(kurtaSchema(), rootId: 'g-1');
      expect(tree.id, 'g-1');
      expect(tree.type, DesignNodeType.garment);
      expect(tree.name, GarmentType.kurta.label);
      expect(tree.metadata['garment_type'], 'kurta');
    });

    test('cardinality expands to instances: a mirrored pair qualifies '
        'left/right (§3); singles are unqualified', () {
      final tree = instantiator.instantiate(kurtaSchema(), rootId: 'g-1');
      expect(tree.children, hasLength(3)); // 2 sleeves + 1 front panel
      final sleeves = tree.children
          .where((n) => n.metadata['part'] == 'sleeve')
          .toList();
      expect(sleeves.map((n) => n.metadata['instance']), ['left', 'right']);
      expect(sleeves.map((n) => n.id), ['g-1-sleeve-left', 'g-1-sleeve-right']);
      expect(sleeves.map((n) => n.metadata['symmetry_group']).toSet(), {
        'sleeves',
      });
      final front = tree.children.last;
      expect(front.metadata['part'], 'base');
      expect(front.metadata.containsKey('instance'), isFalse);
      expect(front.type, DesignNodeType.garmentPart);
    });

    test('zone slots become frozen zone nodes carrying their slot id', () {
      final tree = instantiator.instantiate(kurtaSchema(), rootId: 'g-1');
      final front = tree.children.last;
      expect(front.children.map((z) => z.type).toSet(), {DesignNodeType.zone});
      expect(front.children.map((z) => z.metadata['zone_slot']), [
        'field',
        'hem-zone',
      ]);
      expect(front.children.map((z) => z.name), ['Field', 'Hem Zone']);
      expect(front.children[0].id, 'g-1-base-field');
    });

    test('cardinality > 2 qualifies with 1-based ordinals', () {
      const schema = GarmentSchema(
        id: 's',
        garment: GarmentType.dupatta,
        parts: [
          PartDefinition(
            part: GarmentPart.border,
            cardinality: 3,
            panelSize: Size2D(width: 10, height: 200),
          ),
        ],
      );
      final tree = instantiator.instantiate(schema, rootId: 'g-2');
      expect(tree.children.map((n) => n.metadata['instance']), ['1', '2', '3']);
    });

    test('determinism: same schema + rootId → identical subtree', () {
      expect(
        instantiator.instantiate(kurtaSchema(), rootId: 'g-1'),
        instantiator.instantiate(kurtaSchema(), rootId: 'g-1'),
      );
    });
  });

  group('the frozen write/read contract — SemanticPath resolves the '
      'instance', () {
    test('the frozen resolver reads what the instantiator wrote: '
        'garment_type, part and instance keys', () {
      final tree = instantiator.instantiate(kurtaSchema(), rootId: 'g-1');
      // The frozen SemanticPath grammar: token[qualifier] segments match
      // node metadata written by this slice.
      final left = SemanticPath.parse('kurta.sleeve[left]').resolve(tree);
      expect(left, hasLength(1));
      expect(left.single.id, 'g-1-sleeve-left');
      final anySleeve = SemanticPath.parse('kurta.sleeve').resolve(tree);
      expect(anySleeve, hasLength(2));
      final zone = SemanticPath.parse('kurta.base.field').resolve(tree);
      expect(zone.single.metadata['zone_slot'], 'field');
    });
  });
}
