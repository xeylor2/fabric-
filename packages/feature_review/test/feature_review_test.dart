import 'package:feature_review/feature_review.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_review package marker is wired', () {
    expect(FeatureReviewPackage.id, 'feature_review');
  });
}
