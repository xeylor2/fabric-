import 'package:feature_conversation/feature_conversation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('feature_conversation package marker is wired', () {
    expect(FeatureConversationPackage.id, 'feature_conversation');
  });
}
