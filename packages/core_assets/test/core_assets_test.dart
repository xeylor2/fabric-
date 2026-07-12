import 'package:core_assets/core_assets.dart';
import 'package:test/test.dart';

void main() {
  test('core_assets package marker is wired', () {
    expect(CoreAssetsPackage.id, 'core_assets');
  });
}
