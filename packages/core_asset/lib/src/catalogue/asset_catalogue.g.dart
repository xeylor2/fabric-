// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_catalogue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetCatalogue _$AssetCatalogueFromJson(Map<String, dynamic> json) =>
    _AssetCatalogue(
      assets:
          (json['assets'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, FebricAsset.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, FebricAsset>{},
    );

Map<String, dynamic> _$AssetCatalogueToJson(_AssetCatalogue instance) =>
    <String, dynamic>{
      'assets': instance.assets.map((k, e) => MapEntry(k, e.toJson())),
    };
