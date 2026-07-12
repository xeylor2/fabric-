import 'package:feature_ai_assist/feature_ai_assist.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_ai_assist package marker is wired', () {
    expect(FeatureAiAssistPackage.id, 'feature_ai_assist');
  });
}
