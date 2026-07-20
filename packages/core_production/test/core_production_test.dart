import 'package:core_production/core_production.dart';
import 'package:test/test.dart';

void main() {
  test('core_production package marker is wired', () {
    expect(CoreProductionPackage.id, 'core_production');
  });
}
