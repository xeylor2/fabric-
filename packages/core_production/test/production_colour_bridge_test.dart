import 'package:core_color/core_color.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_production/core_production.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M13C-2 verification suite — Production Colour Bridge.
void main() {
  group('gates — the M12E/M13B precedent', () {
    test('a render plan for a different job is a caller error', () {
      final plans = _prepared();
      expect(
        () => const BindingProductionColourBridge().plan(
          plans.job,
          plans.document,
          renderPlan: plans.renderPlan.copyWith(jobId: 'pj-other'),
          colourProfileId: 'profile-fogra39',
        ),
        throwsArgumentError,
      );
    });

    test('a job not at the color stage blocks planning', () {
      final plans = _prepared();
      // Still at render (preflight only completed).
      final early = plans.job.copyWith(completed: [ProductionStage.preflight]);
      expect(
        () => const BindingProductionColourBridge().plan(
          early,
          plans.document,
          renderPlan: plans.renderPlan,
          colourProfileId: 'profile-fogra39',
        ),
        throwsStateError,
      );
    });

    test('an unresolvable colour/print profile is a caller error — never '
        'a fabricated conversion', () {
      final plans = _prepared();
      expect(
        () => const BindingProductionColourBridge().plan(
          plans.job,
          plans.document,
          renderPlan: plans.renderPlan,
          colourProfileId: 'profile-ghost',
        ),
        throwsArgumentError,
      );
      expect(
        () => const BindingProductionColourBridge().plan(
          plans.job,
          plans.document,
          renderPlan: plans.renderPlan,
          colourProfileId: 'profile-fogra39',
          printProfileId: 'mill-ghost',
        ),
        throwsArgumentError,
      );
    });
  });

  group('the plan — pure profile binding', () {
    test('binds document profiles by id and derives the reference-based '
        'work order: sources are the render work-list, source space is '
        'the recorded working space, target space is the frozen '
        'profile.space verbatim', () {
      final plans = _prepared();
      final plan = const BindingProductionColourBridge().plan(
        plans.job,
        plans.document,
        renderPlan: plans.renderPlan,
        colourProfileId: 'profile-fogra39',
        printProfileId: 'mill-lahore-1',
      );
      expect(plan.jobId, plans.job.id);
      expect(plan.colourProfileId, 'profile-fogra39');
      expect(plan.printProfileId, 'mill-lahore-1');
      expect(plan.gamutReport, isNull); // awaits a transformer
      final request = plan.request;
      expect(request.id, 'colour-${plans.job.id}');
      expect(
        request.sourceReferences,
        plans.renderPlan.graph.objects.map((o) => o.id).toList(),
      );
      expect(request.sourceReferences, isNotEmpty);
      expect(request.sourceSpace, 'srgb'); // the frozen working default
      expect(request.targetSpace, 'cmyk_fogra39'); // profile.space verbatim
      expect(request.colourProfileId, 'profile-fogra39');
    });

    test('determinism + JSON round-trip', () {
      final plans = _prepared();
      ProductionColourPlan run() => const BindingProductionColourBridge().plan(
        plans.job,
        plans.document,
        renderPlan: plans.renderPlan,
        colourProfileId: 'profile-fogra39',
      );
      expect(run(), run());
      expect(ProductionColourPlan.fromJson(run().toJson()), run());
    });
  });

  group('end-to-end — §12 preflight → render → colour on real frozen '
      'contracts', () {
    test('the full front half walks; a fake transformer answers the work '
        'order and the report slots in', () {
      final plans = _prepared();
      final plan = const BindingProductionColourBridge().plan(
        plans.job,
        plans.document,
        renderPlan: plans.renderPlan,
        colourProfileId: 'profile-fogra39',
      );
      // The seam is synchronous (the approved determination): a test
      // transformer answers inline.
      final result = _FakeTransformer().transform(plan.request);
      final measured = plan.copyWith(gamutReport: result.gamutReport);
      expect(measured.gamutReport!.requestId, plan.request.id);
      // The stage machine advances: color completes, encode is next.
      final coloured = plans.job.advanceTo(ProductionStage.color);
      expect(coloured.nextStage, ProductionStage.encode);
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen contracts; fake transformer at the seam only).
// ---------------------------------------------------------------------------

final class _Prepared {
  _Prepared(this.job, this.document, this.renderPlan);

  final ProductionJob job;
  final FebricDocument document;
  final ProductionRenderPlan renderPlan;
}

_Prepared _prepared() {
  const job = ProductionJob(
    id: 'pj-1',
    documentId: 'doc-1',
    artboardIds: ['ab-1'],
    deliverable: ProductionDeliverable.repeatTile,
    physicalSize: Size2D(width: 30, height: 45),
    unit: MeasurementUnit.centimetre,
  );
  final document = _document();
  final preflighted = job.advanceTo(ProductionStage.preflight);
  final renderPlan = CompilingProductionRenderBridge().plan(
    preflighted,
    document,
    preflight: const PreflightReport(
      jobId: 'pj-1',
      engineVersion: 'static-preflight-1',
    ),
  );
  final rendered = preflighted.advanceTo(ProductionStage.render);
  return _Prepared(rendered, document, renderPlan);
}

final class _FakeTransformer implements ColourTransformContract {
  @override
  String get version => 'fake-icc-1';

  @override
  ColourTransformResult transform(ColourTransformRequest request) =>
      ColourTransformResult(
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

FebricDocument _document() {
  final t0 = DateTime.utc(2026, 7, 20, 22);
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
      title: 'M13C Colour Bridge',
      author: 'designer-1',
      createdAt: t0,
      modifiedAt: t0,
    ),
    colourProfiles: const [
      ColourProfile(
        id: 'profile-fogra39',
        name: 'FOGRA39 Coated',
        space: 'cmyk_fogra39',
        iccAssetId: 'sha256:icc-fogra39',
      ),
    ],
    printProfiles: const [
      PrintProfile(
        id: 'mill-lahore-1',
        name: 'Lahore Mill — Lawn',
        widthMm: 1200,
        colourProfileId: 'profile-fogra39',
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
