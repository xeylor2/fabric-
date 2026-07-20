import 'package:core_color/core_color.dart';
import 'package:test/test.dart';

/// M13C-1 verification suite — colour-transform seam + gamut vocabulary.
void main() {
  group('freeze — model JSON round-trips (references only)', () {
    test('request round-trips; sources are ids, never buffers', () {
      const request = ColourTransformRequest(
        id: 'req-1',
        sourceReferences: ['ro-1', 'ro-2'],
        sourceSpace: 'srgb',
        targetSpace: 'cmyk_fogra39',
        colourProfileId: 'profile-fogra39',
      );
      expect(ColourTransformRequest.fromJson(request.toJson()), request);
      expect(request.toJson()['sourceReferences'], ['ro-1', 'ro-2']);
    });

    test('finding/report round-trip; ΔE assert; outOfGamutCount derives '
        'from facts', () {
      const report = GamutReport(
        requestId: 'req-1',
        colourProfileId: 'profile-fogra39',
        findings: [
          GamutFinding(reference: '#AA0000', deltaE: 1.2, inGamut: true),
          GamutFinding(reference: '#00FF88', deltaE: 7.9, inGamut: false),
          GamutFinding(reference: 'ro-2', deltaE: 4.1, inGamut: false),
        ],
      );
      expect(GamutReport.fromJson(report.toJson()), report);
      expect(report.outOfGamutCount, 2);
      expect(
        () => GamutFinding(reference: 'x', deltaE: -0.1, inGamut: true),
        throwsA(isA<AssertionError>()),
      );
    });

    test('result round-trips with the transformer version stamped', () {
      const result = ColourTransformResult(
        requestId: 'req-1',
        outputReferences: ['ro-1-cmyk'],
        gamutReport: GamutReport(
          requestId: 'req-1',
          colourProfileId: 'profile-fogra39',
        ),
        transformerVersion: 'fake-icc-1',
      );
      expect(ColourTransformResult.fromJson(result.toJson()), result);
    });
  });

  group('the seam — synchronous, deterministic, implementable', () {
    test('a fake transformer satisfies the contract synchronously; same '
        'request → same result (no science ships here)', () {
      const transformer = _FakeTransformer();
      const request = ColourTransformRequest(
        id: 'req-det',
        sourceReferences: ['ro-1'],
        sourceSpace: 'srgb',
        targetSpace: 'cmyk_fogra39',
        colourProfileId: 'profile-fogra39',
      );
      final a = transformer.transform(request);
      final b = transformer.transform(request);
      expect(a, b);
      expect(a.requestId, 'req-det');
      expect(a.outputReferences, ['ro-1@cmyk_fogra39']);
      expect(a.gamutReport.colourProfileId, 'profile-fogra39');
      expect(a.transformerVersion, transformer.version);
      // The contract is a ColourTransformContract (probe).
      expect(transformer, isA<ColourTransformContract>());
    });
  });
}

/// Test-only fake (the M12D `_FakeAdapter` precedent): mechanical
/// reference mapping, zero colour science.
final class _FakeTransformer implements ColourTransformContract {
  const _FakeTransformer();

  @override
  String get version => 'fake-icc-1';

  @override
  ColourTransformResult transform(ColourTransformRequest request) {
    return ColourTransformResult(
      requestId: request.id,
      outputReferences: [
        for (final source in request.sourceReferences)
          '$source@${request.targetSpace}',
      ],
      gamutReport: GamutReport(
        requestId: request.id,
        colourProfileId: request.colourProfileId,
      ),
      transformerVersion: version,
    );
  }
}
