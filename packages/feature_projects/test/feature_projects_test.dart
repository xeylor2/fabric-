import 'package:feature_projects/feature_projects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_projects package marker is wired', () {
    expect(FeatureProjectsPackage.id, 'feature_projects');
  });
}
