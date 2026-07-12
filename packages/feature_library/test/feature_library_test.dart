import 'package:feature_library/feature_library.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_library package marker is wired', () {
    expect(FeatureLibraryPackage.id, 'feature_library');
  });
}
