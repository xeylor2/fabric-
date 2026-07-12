import 'package:feature_repeat/feature_repeat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_repeat package marker is wired', () {
    expect(FeatureRepeatPackage.id, 'feature_repeat');
  });
}
