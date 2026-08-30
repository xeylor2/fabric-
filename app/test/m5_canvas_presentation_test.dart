import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:core_design_system/core_design_system.dart';
import 'package:core_document/core_document.dart';
import 'package:core_render/core_render.dart';
import 'package:core_textile/core_textile.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:febric/di/design_tree_session.dart';
import 'package:febric/di/garment_content.dart';
import 'package:febric/di/textile_artwork.dart';
import 'package:febric/workspace/canvas_panel.dart';
import 'package:flutter/material.dart' hide RenderObject;
import 'package:flutter/rendering.dart' hide RenderObject;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// M5 / M5A — the visual presentation foundation.
///
/// The chain under test is the frozen one, end to end and nothing more:
///
///   Document (real Kurta / Pant / Dupatta content)
///   → frozen GraphCompiler (+ the frozen M16 textile producer seam)
///   → RenderGraph / RenderObject
///   → frozen RenderBackend seam
///   → Flutter render driver
///   → actual pixels
///
/// and, read-only alongside it, the frozen RenderSession / HitTestContract
/// resolving a pointer to an existing node identity.
void main() {
  DesignNode treeRoot(DesignTreeSession session) =>
      session.engine.document.artboards.first.designTreeRoot;

  DesignNode garmentNode(DesignTreeSession session, String wireName) =>
      SemanticPath.parse('*.$wireName').resolve(treeRoot(session)).single;

  RenderObject objectFor(RenderGraph graph, String nodeId) =>
      graph.objects.firstWhere((o) => o.source.refId == nodeId);

  bool hasObjectFor(RenderGraph graph, String nodeId) =>
      graph.objects.any((o) => o.source.refId == nodeId);

  group('every garment reaches the render graph as real geometry', () {
    for (final type in launchGarmentTypes) {
      test('${type.label} compiles into placed panels, zones and content', () {
        final session = DesignTreeSession.inMemory();
        addTearDown(session.dispose);
        expect(
          session.instantiateGarment(type.wireName),
          isA<CommandApplied>(),
          reason: session.lastResult,
        );

        final graph = session.canvasRenderGraph;
        final garment = garmentNode(session, type.wireName);

        // Every node of the garment subtree is on the surface.
        for (final node in garment.descendantsAndSelf) {
          expect(
            hasObjectFor(graph, node.id),
            isTrue,
            reason: '${node.name} (${node.id}) must render',
          );
        }

        // The garment sheet carries the deterministic geometry the composition
        // root authored — not the id-derived 8x8 fallback.
        final panels = garmentPanelRects(type);
        final sheetWidth = panels
            .map((r) => r.left + r.width)
            .reduce((a, b) => a > b ? a : b);
        final sheet = objectFor(graph, garment.id);
        expect(sheet.bounds.left, 0);
        expect(sheet.bounds.top, 0);
        expect(sheet.bounds.width, closeTo(sheetWidth, 1e-9));
        expect(sheet.bounds.width, greaterThan(100), reason: 'real panel size');

        // Each part instance sits on its own panel rectangle, in the frozen
        // GarmentAnatomy order the instantiator emitted.
        for (var i = 0; i < garment.children.length; i++) {
          final part = objectFor(graph, garment.children[i].id);
          expect(part.bounds, panels[i], reason: 'panel $i');
          expect(part.kind, RenderObjectKind.group);
        }

        // Garment structure is visible AS structure; textile content carries
        // its own frozen classification.
        for (final node in garment.descendantsAndSelf) {
          final object = objectFor(graph, node.id);
          switch (node.metadata['object_type']) {
            case 'fabric':
              expect(object.kind, RenderObjectKind.fabricBase);
              expect(object.bounds.width, greaterThan(0));
            case 'motif':
              expect(object.kind, RenderObjectKind.motif);
              expect(object.bounds.width, greaterThan(0));
            default:
              expect(object.kind, RenderObjectKind.group);
          }
        }

        // At least one substrate and one independently editable printed motif
        // layer exist and are separate objects.
        final fabrics = graph.objects
            .where((o) => o.kind == RenderObjectKind.fabricBase)
            .toList();
        final motifs = graph.objects
            .where((o) => o.kind == RenderObjectKind.motif)
            .toList();
        expect(fabrics, isNotEmpty);
        expect(motifs, isNotEmpty);
        expect(
          fabrics
              .map((o) => o.source.refId)
              .toSet()
              .intersection(motifs.map((o) => o.source.refId).toSet()),
          isEmpty,
          reason: 'the print is never flattened into the cloth',
        );
      });
    }

    test('all three coexist on one surface, each with its own objects', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      for (final type in launchGarmentTypes) {
        session.instantiateGarment(type.wireName);
      }
      final graph = session.canvasRenderGraph;
      for (final type in launchGarmentTypes) {
        final garment = garmentNode(session, type.wireName);
        expect(hasObjectFor(graph, garment.id), isTrue, reason: type.label);
        expect(
          garment.descendantsAndSelf.every((n) => hasObjectFor(graph, n.id)),
          isTrue,
        );
      }
      // One graph per revision, a pure function of the document (R3 / §F).
      expect(graph.revision, session.engine.document.revision);
      expect(session.canvasRenderGraph, graph);
    });

    test('compiling the surface mutates nothing', () {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.instantiateGarment(GarmentType.kurta.wireName);
      final document = session.engine.document;
      final revision = document.revision;
      final history = document.history.entries.length;

      session.canvasRenderGraph;
      session.canvasRenderGraph;

      expect(session.engine.document, same(document));
      expect(session.engine.document.revision, revision);
      expect(session.engine.document.history.entries, hasLength(history));
    });
  });

  group('the surface paints actual pixels', () {
    Future<DesignTreeSession> pumpCanvas(
      WidgetTester tester, {
      List<GarmentType> garments = const [],
      DesignTreeSession? existing,
    }) async {
      tester.view.physicalSize = const Size(1200, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      final session = existing ?? DesignTreeSession.inMemory();
      if (existing == null) {
        addTearDown(session.dispose);
      }
      for (final type in garments) {
        session.instantiateGarment(type.wireName);
      }
      await tester.pumpWidget(
        ProviderScope(
          overrides: [designTreeSessionProvider.overrideWithValue(session)],
          child: MaterialApp(
            theme: FebricTheme.build(FebricThemeVariant.light),
            home: const Scaffold(body: CanvasPanel()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      return session;
    }

    /// Rasterizes the canvas surface's own repaint boundary — the real pixels
    /// the driver produced this frame. `runAsync` is required because
    /// rasterization is real engine work, not fake-async test time.
    Future<_Raster> raster(WidgetTester tester) async {
      final boundary = tester.renderObject<RenderRepaintBoundary>(
        find.descendant(
          of: find.byType(CanvasEditorPage),
          matching: find.byType(RepaintBoundary),
        ),
      );
      final data = await tester.runAsync(() async {
        final image = await boundary.toImage();
        final bytes = await image.toByteData();
        image.dispose();
        return bytes;
      });
      return _Raster(data!);
    }

    for (final type in launchGarmentTypes) {
      testWidgets('${type.label} is visually presented', (tester) async {
        await pumpCanvas(tester, garments: [type]);
        expect(find.byKey(const Key('canvas-surface')), findsOneWidget);
        expect(find.byType(ModulePlaceholderView), findsNothing);

        final pixels = await raster(tester);
        expect(pixels.painted, greaterThan(0), reason: 'something was drawn');
        expect(
          pixels.distinctColours,
          greaterThan(2),
          reason: 'sections, cloth and print are distinguishable',
        );
        expect(tester.takeException(), isNull);
      });
    }

    testWidgets('Kurta, Pant and Dupatta present together', (tester) async {
      await pumpCanvas(tester, garments: launchGarmentTypes);
      final pixels = await raster(tester);
      expect(pixels.painted, greaterThan(0));
      expect(pixels.distinctColours, greaterThan(2));
      expect(tester.takeException(), isNull);
    });

    testWidgets('an empty document paints no garment and does not fail', (
      tester,
    ) async {
      await pumpCanvas(tester);
      expect(find.byKey(const Key('canvas-surface')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('a tap resolves an existing node and writes nothing', (
      tester,
    ) async {
      final session = await pumpCanvas(tester, garments: [GarmentType.kurta]);
      final document = session.engine.document;
      final revision = session.revision.value;
      final history = document.history.entries.length;

      await tester.tap(find.byKey(const Key('canvas-surface-gestures')));
      await tester.pumpAndSettle();

      // The document is the identical instance and the engine never ran.
      expect(session.engine.document, same(document));
      expect(session.revision.value, revision);
      expect(session.engine.document.history.entries, hasLength(history));
      expect(session.engine.document.revision, document.revision);
      expect(tester.takeException(), isNull);
    });

    testWidgets('uploaded artwork is projected to the surface as artwork', (
      tester,
    ) async {
      final session = DesignTreeSession.inMemory();
      addTearDown(session.dispose);
      session.instantiateGarment(GarmentType.kurta.wireName);

      // The substrate cloth of the Kurta's base field.
      final fabric = treeRoot(session).descendantsAndSelf.firstWhere(
        (n) => n.metadata['object_type'] == 'fabric',
      );
      // Encoding is real engine work, so it runs outside fake-async time.
      final bytes = await tester.runAsync(_pngBytes);
      final applied = await session.applyTextileArtworkBytes(
        fabric.id,
        TextileArtwork(name: 'weave.png', mimeType: 'image/png', bytes: bytes!),
      );
      expect(applied, isA<CommandApplied>(), reason: session.lastResult);

      // The composition root now projects that reference for the surface: the
      // referencing node, the frozen content address, and bytes in the frozen
      // content store at that address.
      final bindings = session.canvasArtworkBindings;
      expect(bindings.map((b) => b.nodeId), contains(fabric.id));
      final binding = bindings.firstWhere((b) => b.nodeId == fabric.id);
      expect(await session.artworkStore.contains(binding.contentHash), isTrue);

      // Those projected bytes are real, decodable artwork the driver can draw —
      // the same resolution path the surface runs.
      final resolved = await tester.runAsync(() async {
        final stored = await session.artworkStore.get(binding.contentHash);
        return resolveCanvasArtwork([
          CanvasArtworkSource(
            nodeId: binding.nodeId,
            contentHash: binding.contentHash,
            bytes: stored!,
          ),
        ]);
      });
      expect(resolved!.keys, contains(fabric.id));
      expect(
        resolved[fabric.id]!.resourceKey,
        ResourceKey(kind: ResourceKind.texture, key: binding.contentHash),
      );
      for (final artwork in resolved.values) {
        artwork.image.dispose();
      }

      await pumpCanvas(tester, existing: session);
      expect(find.byKey(const Key('canvas-surface')), findsOneWidget);
      final pixels = await raster(tester);
      expect(pixels.painted, greaterThan(0));
      expect(tester.takeException(), isNull);
    });
  });
}

/// Real PNG bytes of a small opaque square, produced by the platform encoder.
Future<Uint8List> _pngBytes() async {
  final recorder = ui.PictureRecorder();
  ui.Canvas(recorder).drawRect(
    const ui.Rect.fromLTWH(0, 0, 8, 8),
    ui.Paint()..color = const Color(0xFF00A0FF),
  );
  final picture = recorder.endRecording();
  final image = await picture.toImage(8, 8);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  picture.dispose();
  image.dispose();
  return data!.buffer.asUint8List();
}

/// A rasterized frame, reduced to the two facts that matter: whether anything
/// was painted, and how many distinct colours the frame holds.
final class _Raster {
  _Raster(ByteData data) {
    final colours = <int>{};
    var opaque = 0;
    for (var offset = 0; offset + 3 < data.lengthInBytes; offset += 4) {
      final alpha = data.getUint8(offset + 3);
      if (alpha == 0) {
        continue;
      }
      opaque++;
      colours.add(data.getUint32(offset));
    }
    painted = opaque;
    distinctColours = colours.length;
  }

  late final int painted;
  late final int distinctColours;
}
