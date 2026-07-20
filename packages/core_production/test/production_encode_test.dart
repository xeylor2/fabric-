import 'package:core_color/core_color.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_production/core_production.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M13D verification suite — Encode Contracts + Production Encode Plan.
void main() {
  group('freeze — model JSON round-trips', () {
    test('request round-trips with frozen format/unit wire names and the '
        '§12 size + DPI embedding', () {
      const request = EncodeRequest(
        id: 'enc-1',
        sourceReferences: ['ro-1@cmyk_fogra39'],
        format: ExportFormat.tiff,
        exportProfileId: 'export-tiff',
        physicalSize: Size2D(width: 64, height: 64),
        unit: MeasurementUnit.centimetre,
        dpi: 300,
      );
      expect(EncodeRequest.fromJson(request.toJson()), request);
      final json = request.toJson();
      expect(json['format'], 'tiff');
      expect(json['unit'], 'cm');
      expect(json['dpi'], 300.0);
      expect(
        () => EncodeRequest(
          id: 'enc-bad',
          format: ExportFormat.png,
          exportProfileId: 'x',
          physicalSize: const Size2D(width: 1, height: 1),
          unit: MeasurementUnit.centimetre,
          dpi: 0,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('both result kinds round-trip with the kind discriminator', () {
      const encoded = EncodeResult.encoded(
        requestId: 'enc-1',
        outputReferences: ['artefact-tiff-1'],
        encoderVersion: 'fake-codec-1',
      );
      expect(EncodeResult.fromJson(encoded.toJson()), encoded);
      expect(encoded.toJson()['kind'], 'encoded');

      const unsupported = EncodeResult.unsupported(
        requestId: 'enc-2',
        format: ExportFormat.svg,
        encoderVersion: 'fake-codec-1',
        detail: 'svg is not declared by this encoder',
      );
      expect(EncodeResult.fromJson(unsupported.toJson()), unsupported);
      expect(unsupported.toJson()['kind'], 'unsupported');
      expect(unsupported.toJson()['format'], 'svg');
    });

    test('plan round-trips', () {
      final plan = _plannedEncode();
      expect(ProductionEncodePlan.fromJson(plan.toJson()), plan);
    });
  });

  group('the encoder seam — capability as declared data, typed outcomes', () {
    test('a declared format encodes; an undeclared one answers the typed '
        'unsupported outcome — nothing throws (the approved '
        'reserved-format determination)', () {
      const encoder = _FakeEncoder({ExportFormat.tiff, ExportFormat.png});
      expect(encoder, isA<ProductionEncoder>());
      expect(encoder.supportedFormats, {ExportFormat.tiff, ExportFormat.png});

      final tiff = encoder.encode(_request(format: ExportFormat.tiff));
      final ok = tiff as EncodeEncoded;
      expect(ok.outputReferences, ['ro-1@cmyk_fogra39.tiff']);
      expect(ok.encoderVersion, 'fake-codec-1');

      // §12 'SVG reserved' honoured as an emergent capability fact:
      final svg = encoder.encode(_request(format: ExportFormat.svg));
      final missing = svg as EncodeUnsupported;
      expect(missing.format, ExportFormat.svg);
      expect(missing.encoderVersion, 'fake-codec-1');
    });

    test('determinism: same request → identical result', () {
      const encoder = _FakeEncoder({ExportFormat.pdf});
      final request = _request(format: ExportFormat.pdf);
      expect(encoder.encode(request), encoder.encode(request));
    });
  });

  group('gates — the M12E/M13B/M13C precedent', () {
    test('a colour plan for a different job is a caller error', () {
      final f = _Fixture();
      expect(
        () => const BindingProductionEncodeBridge().plan(
          f.job,
          f.document,
          colourPlan: f.colourPlan.copyWith(jobId: 'pj-other'),
          transformResult: f.transformResult,
          exportProfileIds: const ['export-tiff'],
        ),
        throwsArgumentError,
      );
    });

    test('a transform result that answers a different request is a '
        'caller error (colour completion evidenced by artefact)', () {
      final f = _Fixture();
      expect(
        () => const BindingProductionEncodeBridge().plan(
          f.job,
          f.document,
          colourPlan: f.colourPlan,
          transformResult: f.transformResult.copyWith(requestId: 'other'),
          exportProfileIds: const ['export-tiff'],
        ),
        throwsArgumentError,
      );
    });

    test('a job not at the encode stage blocks planning', () {
      final f = _Fixture();
      final early = f.job.copyWith(
        completed: [ProductionStage.preflight, ProductionStage.render],
      );
      expect(
        () => const BindingProductionEncodeBridge().plan(
          early,
          f.document,
          colourPlan: f.colourPlan,
          transformResult: f.transformResult,
          exportProfileIds: const ['export-tiff'],
        ),
        throwsStateError,
      );
    });

    test('an unresolvable export profile is a caller error — never a '
        'fabricated export', () {
      final f = _Fixture();
      expect(
        () => const BindingProductionEncodeBridge().plan(
          f.job,
          f.document,
          colourPlan: f.colourPlan,
          transformResult: f.transformResult,
          exportProfileIds: const ['export-ghost'],
        ),
        throwsArgumentError,
      );
    });
  });

  group('the plan — a pure binder', () {
    test('one request per selected profile in selection order; sources '
        'are the COLOURED outputs; size/unit from the job; dpi = profile '
        'dpi × scale; formats pass through unrestricted (incl. svg)', () {
      final f = _Fixture();
      final plan = const BindingProductionEncodeBridge().plan(
        f.job,
        f.document,
        colourPlan: f.colourPlan,
        transformResult: f.transformResult,
        exportProfileIds: const ['export-png', 'export-tiff', 'export-svg'],
      );
      expect(plan.jobId, f.job.id);
      expect(plan.requests.map((r) => r.format), [
        ExportFormat.png,
        ExportFormat.tiff,
        ExportFormat.svg, // no bridge-level filter: the seam decides
      ]);
      for (final request in plan.requests) {
        expect(request.sourceReferences, f.transformResult.outputReferences);
        expect(request.physicalSize, f.job.physicalSize);
        expect(request.unit, f.job.unit);
      }
      expect(plan.requests[0].dpi, 150 * 2.0); // png profile: dpi × scale
      expect(plan.requests[1].dpi, 300 * 1.0);
      expect(plan.requests[0].id, 'encode-pj-1-export-png');
    });

    test('determinism + selection-order variance', () {
      final f = _Fixture();
      ProductionEncodePlan run(List<String> ids) =>
          const BindingProductionEncodeBridge().plan(
            f.job,
            f.document,
            colourPlan: f.colourPlan,
            transformResult: f.transformResult,
            exportProfileIds: ids,
          );
      expect(run(const ['export-tiff']), run(const ['export-tiff']));
      expect(
        run(const ['export-tiff', 'export-png']).requests.map((r) => r.format),
        [ExportFormat.tiff, ExportFormat.png],
      );
    });
  });

  group('end-to-end — §12 preflight → render → colour → encode', () {
    test('the full pipeline walks on real frozen contracts; a fake '
        'encoder answers each request with its typed fate; the stage '
        'machine reaches package', () {
      final f = _Fixture();
      final plan = const BindingProductionEncodeBridge().plan(
        f.job,
        f.document,
        colourPlan: f.colourPlan,
        transformResult: f.transformResult,
        exportProfileIds: const ['export-tiff', 'export-svg'],
      );
      const encoder = _FakeEncoder({ExportFormat.tiff, ExportFormat.png});
      final results = [for (final r in plan.requests) encoder.encode(r)];
      expect(results[0], isA<EncodeEncoded>());
      expect(results[1], isA<EncodeUnsupported>()); // svg: emergent fact
      final encoded = f.job.advanceTo(ProductionStage.encode);
      expect(encoded.nextStage, ProductionStage.package);
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen contracts; fake codec at the seam only).
// ---------------------------------------------------------------------------

EncodeRequest _request({required ExportFormat format}) => EncodeRequest(
  id: 'enc-${format.wireName}',
  sourceReferences: const ['ro-1@cmyk_fogra39'],
  format: format,
  exportProfileId: 'export-${format.wireName}',
  physicalSize: const Size2D(width: 64, height: 64),
  unit: MeasurementUnit.centimetre,
  dpi: 300,
);

ProductionEncodePlan _plannedEncode() {
  final f = _Fixture();
  return const BindingProductionEncodeBridge().plan(
    f.job,
    f.document,
    colourPlan: f.colourPlan,
    transformResult: f.transformResult,
    exportProfileIds: const ['export-tiff'],
  );
}

/// Test-only codec fake: mechanical reference mapping, zero codec code.
final class _FakeEncoder implements ProductionEncoder {
  const _FakeEncoder(this.supportedFormats);

  @override
  final Set<ExportFormat> supportedFormats;

  @override
  String get version => 'fake-codec-1';

  @override
  EncodeResult encode(EncodeRequest request) {
    if (!supportedFormats.contains(request.format)) {
      return EncodeResult.unsupported(
        requestId: request.id,
        format: request.format,
        encoderVersion: version,
        detail: '${request.format.wireName} is not declared by this encoder',
      );
    }
    return EncodeResult.encoded(
      requestId: request.id,
      outputReferences: [
        for (final source in request.sourceReferences)
          '$source.${request.format.wireName}',
      ],
      encoderVersion: version,
    );
  }
}

final class _Fixture {
  _Fixture() {
    document = _document();
    const planned = ProductionJob(
      id: 'pj-1',
      documentId: 'doc-1',
      artboardIds: ['ab-1'],
      deliverable: ProductionDeliverable.repeatTile,
      physicalSize: Size2D(width: 30, height: 45),
      unit: MeasurementUnit.centimetre,
    );
    final preflighted = planned.advanceTo(ProductionStage.preflight);
    final renderPlan = CompilingProductionRenderBridge().plan(
      preflighted,
      document,
      preflight: const PreflightReport(
        jobId: 'pj-1',
        engineVersion: 'static-preflight-1',
      ),
    );
    final rendered = preflighted.advanceTo(ProductionStage.render);
    colourPlan = const BindingProductionColourBridge().plan(
      rendered,
      document,
      renderPlan: renderPlan,
      colourProfileId: 'profile-fogra39',
    );
    transformResult = ColourTransformResult(
      requestId: colourPlan.request.id,
      outputReferences: [
        for (final source in colourPlan.request.sourceReferences)
          '$source@cmyk_fogra39',
      ],
      gamutReport: GamutReport(
        requestId: colourPlan.request.id,
        colourProfileId: 'profile-fogra39',
      ),
      transformerVersion: 'fake-icc-1',
    );
    job = rendered.advanceTo(ProductionStage.color);
  }

  late final FebricDocument document;
  late final ProductionColourPlan colourPlan;
  late final ColourTransformResult transformResult;
  late final ProductionJob job;
}

FebricDocument _document() {
  final t0 = DateTime.utc(2026, 7, 20, 23);
  return FebricDocument(
    id: const DocumentId('doc-1'),
    projectId: const ProjectId('project-1'),
    manifest: const DocumentManifest(
      version: DocumentVersion(
        schema: DocumentVersion.currentSchema,
        generator: 'febric-test',
      ),
    ),
    metadata: DocumentMetadata(
      title: 'M13D Encode',
      author: 'designer-1',
      createdAt: t0,
      modifiedAt: t0,
    ),
    colourProfiles: const [
      ColourProfile(
        id: 'profile-fogra39',
        name: 'FOGRA39 Coated',
        space: 'cmyk_fogra39',
      ),
    ],
    exportProfiles: const [
      ExportProfile(
        id: 'export-tiff',
        name: 'Mill TIFF',
        format: ExportFormat.tiff,
        dpi: 300,
      ),
      ExportProfile(
        id: 'export-png',
        name: 'Preview PNG',
        format: ExportFormat.png,
        dpi: 150,
        scale: 2.0,
      ),
      ExportProfile(
        id: 'export-svg',
        name: 'Reserved SVG',
        format: ExportFormat.svg,
        dpi: 300,
      ),
    ],
    artboards: [
      const Artboard(
        id: 'ab-1',
        name: 'Front Panel',
        size: Size2D(width: 30, height: 45),
        unit: MeasurementUnit.centimetre,
        dpi: 300,
        backgroundColourHex: '#F0EADD',
        layerRoot: LayerModel(
          id: 'ab-1-layers',
          name: 'Layers',
          kind: LayerKind.artboard,
        ),
        designTreeRoot: DesignNode(
          id: 'ab-1-tree',
          name: 'Artwork',
          type: DesignNodeType.artwork,
          children: [
            DesignNode(
              id: 'node-hero',
              name: 'Hero Motif',
              type: DesignNodeType.element,
            ),
          ],
        ),
      ),
    ],
  );
}
