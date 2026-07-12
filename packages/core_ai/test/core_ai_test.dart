import 'package:core_ai/core_ai.dart';
import 'package:test/test.dart';

void main() {
  test('core_ai package marker is wired', () {
    expect(CoreAiPackage.id, 'core_ai');
  });
}
