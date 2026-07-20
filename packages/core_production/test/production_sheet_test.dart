import 'package:core_color/core_color.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_production/core_production.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M13E verification suite — Production Sheet + Package Bridge.
void main() {
  group('gates — the chain verified by artefact, one link further', () {
    test('every mismatched artefact is a caller error', () {
      final f = _Fixture();
      ProductionSheet run({
        PreflightReport? preflight,
        ProductionRenderPlan? renderPlan,
        ProductionColourPlan? colourPlan,
        ColourTransformResult? transformResult,
        ProductionEncodePlan? encodePlan,
        List<EncodeResult>? encodeResults,
      }) => const AssemblingProductionPackageBridge().assemble(
        f.job,
        preflight: preflight ?? f.preflight,
        renderPlan: renderPlan ?? f.renderPlan,
        colourPlan: colourPlan ?? f.colourPlan,
        transformResult: transformResult ?? f.transformResult,
        encodePlan: encodePlan ?? f.encodePlan,
        encodeResults: encodeResults ?? f.encodeResults,
      );

      expect(
        () => run(preflight: f.preflight.copyWith(jobId: 'other')),
        throwsArgumentError,
      );
      expect(
        () => run(renderPlan: f.renderPlan.copyWith(jobId: 'other')),
        throwsArgumentError,
      );
      expect(
        () => run(colourPlan: f.colourPlan.copyWith(jobId: 'other')),
        throwsArgumentError,
      );
      expect(
        () => run(
          transformResult: f.transformResult.copyWith(requestId: 'other'),
        ),
        throwsArgumentError,
      );
      expect(
        () => run(encodePlan: f.encodePlan.copyWith(jobId: 'other')),
        throwsArgumentError,
      );
      expect(
        () => run(
          encodeResults: [
            const EncodeResult.encoded(
              requestId: 'enc-ghost',
              encoderVersion: 'fake-codec-1',
            ),
          ],
        ),
        throwsArgumentError,
      );
    });

    test('a job not at the package stage blocks assembly', () {
      final f = _Fixture();
      final early = f.job.copyWith(
        completed: [
          ProductionStage.preflight,
          ProductionStage.render,
          ProductionStage.color,
        ],
      );
      expect(
        () => const AssemblingProductionPackageBridge().assemble(
          early,
          preflight: f.preflight,
          renderPlan: f.renderPlan,
          colourPlan: f.colourPlan,
          transformResult: f.transformResult,
          encodePlan: f.encodePlan,
          encodeResults: f.encodeResults,
        ),
        throwsStateError,
      );
    });
  });

  group('the sheet — the approved aggregation boundary', () {
    test('embeds own-stage values, references document-owned data, pins '
        'the graph through the record identity', () {
      final f = _Fixture();
      final sheet = f.sheet;
      // Job identity + §12 embedding.
      expect(sheet.jobId, 'pj-1');
      expect(sheet.deliverable, ProductionDeliverable.repeatTile);
      expect(sheet.physicalSize, const Size2D(width: 30, height: 45));
      expect(sheet.unit, MeasurementUnit.centimetre);
      expect(sheet.dpi, 300);
      // References: document + revision (ledger reachable), artboards,
      // profiles — ids only.
      expect(sheet.documentId, 'doc-1');
      expect(sheet.revision, f.renderPlan.record.revision);
      expect(sheet.artboardIds, ['ab-1']);
      expect(sheet.colourProfileId, 'profile-fogra39');
      // Embedded own-stage values.
      expect(sheet.preflight, f.preflight);
      expect(sheet.reproducibility, f.renderPlan.record);
      expect(sheet.gamutReport, f.transformResult.gamutReport);
      expect(sheet.encodeRequests, f.encodePlan.requests);
      expect(sheet.encodeResults, f.encodeResults);
      // The graph is NOT on the sheet: its identity is the embedded
      // record's frozen (revision, target) pair.
      expect(sheet.reproducibility.target, f.renderPlan.target);
      expect(sheet.sheetVersion, 'production-sheet-1');
    });

    test('encode fates surface as facts: encoded/unsupported counts '
        '(no blocking rule — the approved completeness ruling)', () {
      final f = _Fixture();
      expect(f.sheet.encodedCount, 1); // tiff
      expect(f.sheet.unsupportedCount, 1); // svg
      // An all-unsupported sheet is still a valid sheet.
      final allUnsupported = const AssemblingProductionPackageBridge().assemble(
        f.job,
        preflight: f.preflight,
        renderPlan: f.renderPlan,
        colourPlan: f.colourPlan,
        transformResult: f.transformResult,
        encodePlan: f.encodePlan,
        encodeResults: [
          for (final r in f.encodePlan.requests)
            EncodeResult.unsupported(
              requestId: r.id,
              format: r.format,
              encoderVersion: 'fake-codec-1',
            ),
        ],
      );
      expect(allUnsupported.encodedCount, 0);
      expect(allUnsupported.unsupportedCount, 2);
    });

    test('determinism + JSON round-trip', () {
      final f = _Fixture();
      expect(f.sheet, f.assembleSheet());
      expect(ProductionSheet.fromJson(f.sheet.toJson()), f.sheet);
      expect(f.sheet.toJson()['unit'], 'cm');
    });
  });

  group('end-to-end — the complete §12 pipeline, all five stages', () {
    test('preflight → render → colour → encode → package: the sheet '
        'assembles and the stage machine completes', () {
      final f = _Fixture();
      expect(f.sheet.jobId, f.job.id);
      final packaged = f.job.advanceTo(ProductionStage.package);
      expect(packaged.isComplete, isTrue);
      expect(packaged.nextStage, isNull);
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures: the full real pipeline (fakes only at the ICC/codec seams).
// ---------------------------------------------------------------------------

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
    // Stage 1 — preflight (real M13A engine).
    preflight = const StaticPreflightEngine().run(planned, document);
    final preflighted = planned.advanceTo(ProductionStage.preflight);
    // Stage 2 — render (real M13B bridge + frozen M5B compiler).
    renderPlan = CompilingProductionRenderBridge().plan(
      preflighted,
      document,
      preflight: preflight,
    );
    final rendered = preflighted.advanceTo(ProductionStage.render);
    // Stage 3 — colour (real M13C bridge; fake ICC at the seam).
    colourPlan = const BindingProductionColourBridge().plan(
      rendered,
      document,
      renderPlan: renderPlan,
      colourProfileId: 'profile-fogra39',
    );
    transformResult = ColourTransformResult(
      requestId: colourPlan.request.id,
      outputReferences: [
        for (final s in colourPlan.request.sourceReferences) '$s@cmyk_fogra39',
      ],
      gamutReport: GamutReport(
        requestId: colourPlan.request.id,
        colourProfileId: 'profile-fogra39',
        findings: const [
          GamutFinding(reference: '#F0EADD', deltaE: 0.8, inGamut: true),
        ],
      ),
      transformerVersion: 'fake-icc-1',
    );
    final coloured = rendered.advanceTo(ProductionStage.color);
    // Stage 4 — encode (real M13D bridge; fake codec at the seam).
    encodePlan = const BindingProductionEncodeBridge().plan(
      coloured,
      document,
      colourPlan: colourPlan,
      transformResult: transformResult,
      exportProfileIds: const ['export-tiff', 'export-svg'],
    );
    encodeResults = [
      EncodeResult.encoded(
        requestId: encodePlan.requests[0].id,
        outputReferences: const ['artefact-tiff-1'],
        encoderVersion: 'fake-codec-1',
      ),
      EncodeResult.unsupported(
        requestId: encodePlan.requests[1].id,
        format: ExportFormat.svg,
        encoderVersion: 'fake-codec-1',
      ),
    ];
    job = coloured.advanceTo(ProductionStage.encode);
    // Stage 5 — package (the slice under test).
    sheet = assembleSheet();
  }

  late final FebricDocument document;
  late final PreflightReport preflight;
  late final ProductionRenderPlan renderPlan;
  late final ProductionColourPlan colourPlan;
  late final ColourTransformResult transformResult;
  late final ProductionEncodePlan encodePlan;
  late final List<EncodeResult> encodeResults;
  late final ProductionJob job;
  late final ProductionSheet sheet;

  ProductionSheet assembleSheet() =>
      const AssemblingProductionPackageBridge().assemble(
        job,
        preflight: preflight,
        renderPlan: renderPlan,
        colourPlan: colourPlan,
        transformResult: transformResult,
        encodePlan: encodePlan,
        encodeResults: encodeResults,
      );
}

FebricDocument _document() {
  final t0 = DateTime.utc(2026, 7, 21);
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
      title: 'M13E Package',
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
