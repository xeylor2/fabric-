import 'package:core_common/core_common.dart';
import 'package:test/test.dart';

void main() {
  test('core_common package marker is wired', () {
    expect(CoreCommonPackage.id, 'core_common');
  });
}
