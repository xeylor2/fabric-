import 'package:core_workspace/core_workspace.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('core_workspace package marker is wired', () {
    expect(CoreWorkspacePackage.id, 'core_workspace');
  });
}
