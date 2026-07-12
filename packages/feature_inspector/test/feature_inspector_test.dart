import 'package:feature_inspector/feature_inspector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_inspector package marker is wired', () {
    expect(FeatureInspectorPackage.id, 'feature_inspector');
  });
}
