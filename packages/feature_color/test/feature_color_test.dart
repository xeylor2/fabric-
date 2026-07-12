import 'package:feature_color/feature_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_color package marker is wired', () {
    expect(FeatureColorPackage.id, 'feature_color');
  });
}
