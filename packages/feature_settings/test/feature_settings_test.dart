import 'package:feature_settings/feature_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_settings package marker is wired', () {
    expect(FeatureSettingsPackage.id, 'feature_settings');
  });
}
