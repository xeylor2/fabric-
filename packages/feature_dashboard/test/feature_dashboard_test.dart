import 'package:feature_dashboard/feature_dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_dashboard package marker is wired', () {
    expect(FeatureDashboardPackage.id, 'feature_dashboard');
  });
}
