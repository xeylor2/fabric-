import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_production/core_production.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M13B verification suite — Production Render Bridge.
///
/// Real frozen contracts throughout: the reference bridge drives the REAL
/// frozen M5B `RenderGraphCompiler`.
void main() {
  group('gates — the M12E validated-gate precedent, applied twice', () {
    test('a verdict for a different job is a caller error', () {
      final bridge = CompilingProductionRenderBridge();
      expect(
        () => bridge.plan(
          _job(),
          _document(),
          preflight: const PreflightReport(
            jobId: 'pj-other',
            engineVersion: 'static-preflight-1',
          ),
        ),
        throwsArgumentError,
      );
    });

    test('a failed preflight blocks planning (StateError)', () {
      final bridge = CompilingProductionRenderBridge();
      expect(
        () => bridge.plan(
          _job(),
          _document(),
          preflight: const PreflightReport(
            jobId: 'pj-1',
            engineVersion: 'static-preflight-1',
            findings: [
              PreflightFinding(
                rule: PreflightRuleKind.structure,
                severity: PreflightSeverity.blocker,
                description: 'blocked',
              ),
            ],
          ),
        ),
        throwsStateError,
      );
    });

    test('a job not at the render stage blocks planning — the frozen §12 '
        'order cannot be skipped', () {
      final bridge = CompilingProductionRenderBridge();
      // Not yet preflighted: nextStage == preflight, not render.
      expect(
        () => bridge.plan(
          _job(completedPreflight: false),
          _document(),
          preflight: _passedVerdict(),
        ),
        throwsStateError,
      );
      // Already rendered: nextStage == color.
      final past = _job().advanceTo(ProductionStage.render);
      expect(
        () => bridge.plan(past, _document(), preflight: _passedVerdict()),
        throwsStateError,
      );
    });
  });

  group('the plan — frozen target, delegated graph, declared provenance', () {
    test('derives the frozen production-export target with every other '
        'field at its frozen default (the colour-space determination)', () {
      final plan = _plan();
      expect(plan.jobId, 'pj-1');
      expect(plan.artboardIds, ['ab-1']);
      expect(plan.target.kind, RenderTargetKind.productionExport);
      expect(plan.target.fullResolution, isTrue);
      expect(plan.target.onScreen, isFalse);
      // Frozen defaults untouched — asserted on the wire, without naming
      // the colour vocabulary (the approved determination).
      expect(plan.target.toJson()['colourSpace'], 'srgb');
      expect(plan.record.toJson()['colourSpace'], 'cmyk');
      expect(plan.target.passes, isEmpty);
    });

    test('the graph is the REAL frozen compiler output — delegation, '
        'never reimplementation', () {
      final document = _document();
      final plan = _plan(document: document);
      const target = RenderTarget(
        kind: RenderTargetKind.productionExport,
        fullResolution: true,
        onScreen: false,
      );
      final direct = RenderGraphCompiler().compile(document, target);
      expect(plan.graph, direct);
      expect(plan.graph.objects, isNotEmpty); // the visible tree compiled
      expect(plan.graph.revision, document.revision);
    });

    test('the provenance record binds revision × target × declared '
        'backend identity; defaults are the frozen headless identity and '
        'backendExact', () {
      final document = _document();
      final plan = _plan(document: document);
      expect(plan.record.revision, document.revision);
      expect(plan.record.target, plan.target);
      expect(plan.record.backendId, 'headless');
      expect(
        plan.record.determinismLevel,
        RenderDeterminismLevel.backendExact.wireName,
      );
      // Declared identity is caller data (Q4), not policy:
      final declared = CompilingProductionRenderBridge(
        backendId: 'farm-eu-1',
        determinism: RenderDeterminismLevel.crossBackendBounded,
      ).plan(_job(), document, preflight: _passedVerdict());
      expect(declared.record.backendId, 'farm-eu-1');
      expect(
        declared.record.determinismLevel,
        RenderDeterminismLevel.crossBackendBounded.wireName,
      );
    });

    test('determinism: same job + document → identical plans across '
        'fresh bridges; JSON round-trips', () {
      final document = _document();
      final a = CompilingProductionRenderBridge().plan(
        _job(),
        document,
        preflight: _passedVerdict(),
      );
      final b = CompilingProductionRenderBridge().plan(
        _job(),
        document,
        preflight: _passedVerdict(),
      );
      expect(a, b);
      expect(ProductionRenderPlan.fromJson(a.toJson()), a);
    });
  });

  group('end-to-end — the §12 front half on real frozen contracts', () {
    test('preflight (M13A) → render bridge (M13B) → stage advance', () {
      const job = ProductionJob(
        id: 'pj-e2e',
        documentId: 'doc-1',
        artboardIds: ['ab-1'],
        deliverable: ProductionDeliverable.panelSet,
        physicalSize: Size2D(width: 30, height: 45),
        unit: MeasurementUnit.centimetre,
      );
      final document = _document();
      // Stage 1: the real M13A gate.
      final verdict = const StaticPreflightEngine().run(
        job,
        document,
        thresholds: const PreflightThresholds(minEffectiveDpi: 300),
      );
      expect(verdict.passed, isTrue);
      final preflighted = job.advanceTo(ProductionStage.preflight);
      // Stage 2: the render plan.
      final plan = CompilingProductionRenderBridge().plan(
        preflighted,
        document,
        preflight: verdict,
      );
      expect(plan.graph.objects, isNotEmpty);
      // The stage machine advances into render; color is next (the
      // frozen §12 order, awaiting its slice).
      final rendered = preflighted.advanceTo(ProductionStage.render);
      expect(rendered.nextStage, ProductionStage.color);
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen models throughout).
// ---------------------------------------------------------------------------

ProductionRenderPlan _plan({FebricDocument? document}) =>
    CompilingProductionRenderBridge().plan(
      _job(),
      document ?? _document(),
      preflight: _passedVerdict(),
    );

ProductionJob _job({bool completedPreflight = true}) {
  const job = ProductionJob(
    id: 'pj-1',
    documentId: 'doc-1',
    artboardIds: ['ab-1'],
    deliverable: ProductionDeliverable.repeatTile,
    physicalSize: Size2D(width: 30, height: 45),
    unit: MeasurementUnit.centimetre,
  );
  return completedPreflight ? job.advanceTo(ProductionStage.preflight) : job;
}

PreflightReport _passedVerdict() =>
    const PreflightReport(jobId: 'pj-1', engineVersion: 'static-preflight-1');

FebricDocument _document() {
  final t0 = DateTime.utc(2026, 7, 20, 20);
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
      title: 'M13B Render Bridge',
      author: 'designer-1',
      createdAt: t0,
      modifiedAt: t0,
    ),
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
