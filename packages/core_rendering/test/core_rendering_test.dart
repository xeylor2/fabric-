import 'package:core_rendering/core_rendering.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('core_rendering package marker is wired', () {
    expect(CoreRenderingPackage.id, 'core_rendering');
  });
}
