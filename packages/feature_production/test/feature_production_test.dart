import 'package:feature_production/feature_production.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_production package marker is wired', () {
    expect(FeatureProductionPackage.id, 'feature_production');
  });
}
