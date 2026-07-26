import 'package:core_tools/core_tools.dart';
import 'package:test/test.dart';

void main() {
  test('core_tools package marker is wired', () {
    expect(CoreToolsPackage.id, 'core_tools');
  });
}
