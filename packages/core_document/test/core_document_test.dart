import 'package:core_document/core_document.dart';
import 'package:test/test.dart';

void main() {
  test('core_document package marker is wired', () {
    expect(CoreDocumentPackage.id, 'core_document');
  });
}
