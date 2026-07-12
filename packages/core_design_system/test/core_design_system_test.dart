import 'package:core_design_system/core_design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('core_design_system package marker is wired', () {
    expect(CoreDesignSystemPackage.id, 'core_design_system');
  });
}
