import 'package:core_asset/core_asset.dart';
import 'package:core_common/core_common.dart';

/// Deterministic fixtures shared by the M4 test suite (real models — no
/// mocks).
final DateTime t0 = DateTime.utc(2026, 7, 12, 9);

/// A clock that advances one second per read — for modified-stamp tests.
final class TickingClock implements Clock {
  TickingClock(this._current);

  DateTime _current;

  @override
  DateTime now() {
    final value = _current;
    _current = _current.add(const Duration(seconds: 1));
    return value;
  }
}

AssetEngine engine({Clock? clock}) {
  return AssetEngine(
    clock: clock ?? FixedClock(t0),
    assetIds: SequentialIdGenerator(prefix: 'a'),
  );
}

/// Registers a canonical raster motif and returns the applied asset.
FebricAsset registerMotif(
  AssetEngine e, {
  String? id,
  String name = 'Boteh',
  String hash = 'sha256:m1',
  List<String> tags = const ['paisley'],
}) {
  final result = e.register(
    id: id,
    name: name,
    type: AssetType.motif,
    origin: AssetOrigin.imported,
    mimeType: 'image/png',
    hash: hash,
    width: 512,
    height: 512,
    dpi: 300,
    colourSpace: AssetColourSpace.srgb,
    tags: tags,
  );
  return (result as AssetApplied).asset!;
}

AssetUsage usage(
  String assetId, {
  String nodeId = 'n-1',
  String artboardId = 'ab-1',
  String documentId = 'doc-1',
}) {
  return AssetUsage(
    assetId: assetId,
    nodeId: nodeId,
    artboardId: artboardId,
    documentId: documentId,
  );
}
