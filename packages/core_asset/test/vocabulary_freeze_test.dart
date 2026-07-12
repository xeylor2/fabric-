import 'package:core_asset/core_asset.dart';
import 'package:core_document/core_document.dart';
import 'package:test/test.dart';

/// Wire freezes (ADR-0016): append-only; changes require an ADR.
void main() {
  test('AssetType wire names are frozen — the thirteen types', () {
    expect(AssetType.values.map((v) => v.wireName), [
      'image',
      'reference_image',
      'fabric',
      'motif',
      'pattern',
      'texture',
      'mask',
      'brush',
      'palette',
      'font',
      'template',
      'plugin_asset',
      'ai_generated',
    ]);
    expect(() => AssetType.fromWireName('unknown'), throwsArgumentError);
  });

  test('the raster split is frozen (raster types must carry dimensions)', () {
    final raster = AssetType.values.where((t) => t.isRaster);
    expect(raster.map((t) => t.wireName), [
      'image',
      'reference_image',
      'fabric',
      'motif',
      'pattern',
      'texture',
      'mask',
      'brush',
      'ai_generated',
    ]);
  });

  test('AssetOrigin wire names are frozen and reconcile with the document '
      'manifest AssetSource vocabulary', () {
    expect(AssetOrigin.values.map((v) => v.wireName), [
      'imported',
      'generated',
      'library',
      'capture',
      'created',
      'plugin',
    ]);
    // The first four ARE the frozen document AssetSource wire names —
    // one identity, no translation.
    for (final source in AssetSource.values) {
      expect(
        AssetOrigin.fromWireName(source.wireName).wireName,
        source.wireName,
      );
    }
    expect(() => AssetOrigin.fromWireName('unknown'), throwsArgumentError);
  });

  test('AssetColourSpace wire names are frozen', () {
    expect(AssetColourSpace.values.map((v) => v.wireName), [
      'srgb',
      'display_p3',
      'adobe_rgb',
      'cmyk',
      'lab',
      'greyscale',
    ]);
    expect(
      () => AssetColourSpace.fromWireName('unknown'),
      throwsArgumentError,
    );
  });

  test('AssetRejectionReason wire names are frozen', () {
    expect(AssetRejectionReason.values.map((v) => v.wireName), [
      'locked',
      'not_found',
      'invalid',
      'duplicate_identity',
      'in_use',
    ]);
    expect(
      () => AssetRejectionReason.fromWireName('unknown'),
      throwsArgumentError,
    );
  });

  group('document manifest mappings are frozen and total (ADR-0016)', () {
    test('every AssetType coarsens to a REAL document AssetKind', () {
      final expected = {
        AssetType.image: 'image',
        AssetType.referenceImage: 'reference_photo',
        AssetType.fabric: 'texture',
        AssetType.motif: 'motif',
        AssetType.pattern: 'pattern',
        AssetType.texture: 'texture',
        AssetType.mask: 'image',
        AssetType.brush: 'image',
        AssetType.palette: 'imported',
        AssetType.font: 'imported',
        AssetType.template: 'imported',
        AssetType.pluginAsset: 'imported',
        AssetType.aiGenerated: 'generated',
      };
      for (final type in AssetType.values) {
        final wire = DocumentAssetBinding.documentKindWireName(type);
        expect(wire, expected[type], reason: type.wireName);
        // Parses against the REAL frozen document enum — never drifts.
        expect(AssetKind.fromWireName(wire), isA<AssetKind>());
      }
    });

    test('every AssetOrigin coarsens to a REAL document AssetSource', () {
      final expected = {
        AssetOrigin.imported: 'imported',
        AssetOrigin.generated: 'generated',
        AssetOrigin.library: 'library',
        AssetOrigin.capture: 'capture',
        AssetOrigin.created: 'library',
        AssetOrigin.plugin: 'imported',
      };
      for (final origin in AssetOrigin.values) {
        final wire = DocumentAssetBinding.documentSourceWireName(origin);
        expect(wire, expected[origin], reason: origin.wireName);
        expect(AssetSource.fromWireName(wire), isA<AssetSource>());
      }
    });

    test('precise type/origin recover losslessly via record metadata', () {
      for (final type in AssetType.values) {
        expect(
          DocumentAssetBinding.typeFromRecord(
            kindWireName: DocumentAssetBinding.documentKindWireName(type),
            metadata: {
              DocumentAssetBinding.assetTypeMetadataKey: type.wireName,
            },
          ),
          type,
        );
      }
      for (final origin in AssetOrigin.values) {
        expect(
          DocumentAssetBinding.originFromRecord(
            sourceWireName: DocumentAssetBinding.documentSourceWireName(
              origin,
            ),
            metadata: {
              DocumentAssetBinding.assetOriginMetadataKey: origin.wireName,
            },
          ),
          origin,
        );
      }
    });

    test('coarse inference covers every document kind; unknown throws', () {
      for (final kind in AssetKind.values) {
        expect(
          DocumentAssetBinding.typeFromRecord(kindWireName: kind.wireName),
          isA<AssetType>(),
          reason: kind.wireName,
        );
      }
      expect(
        () => DocumentAssetBinding.typeFromRecord(kindWireName: 'unknown'),
        throwsArgumentError,
      );
    });
  });

  test('the frozen node binding metadata keys', () {
    expect(NodeAssetBinding.assetIdKey, 'asset_id');
    expect(NodeAssetBinding.assetRefsKey, 'asset_refs');
    expect(DocumentAssetBinding.assetTypeMetadataKey, 'asset_type');
    expect(DocumentAssetBinding.assetOriginMetadataKey, 'asset_origin');
  });

  test('core_asset package marker is wired', () {
    expect(CoreAssetPackage.id, 'core_asset');
  });
}
