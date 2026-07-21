// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'garment_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartInsets _$PartInsetsFromJson(Map<String, dynamic> json) => _PartInsets(
  left: (json['left'] as num?)?.toDouble() ?? 0.0,
  top: (json['top'] as num?)?.toDouble() ?? 0.0,
  right: (json['right'] as num?)?.toDouble() ?? 0.0,
  bottom: (json['bottom'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PartInsetsToJson(_PartInsets instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
    };

_ZoneSlot _$ZoneSlotFromJson(Map<String, dynamic> json) => _ZoneSlot(
  id: json['id'] as String,
  name: json['name'] as String,
  accepts:
      (json['accepts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$ZoneSlotToJson(_ZoneSlot instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'accepts': instance.accepts,
};

_PartDefinition _$PartDefinitionFromJson(Map<String, dynamic> json) =>
    _PartDefinition(
      part: _partFromJson(json['part'] as String),
      cardinality: (json['cardinality'] as num?)?.toInt() ?? 1,
      panelSize: Size2D.fromJson(json['panelSize'] as Map<String, dynamic>),
      seamAllowance: json['seamAllowance'] == null
          ? PartInsets.zero
          : PartInsets.fromJson(json['seamAllowance'] as Map<String, dynamic>),
      bleed: json['bleed'] == null
          ? PartInsets.zero
          : PartInsets.fromJson(json['bleed'] as Map<String, dynamic>),
      zoneSlots:
          (json['zoneSlots'] as List<dynamic>?)
              ?.map((e) => ZoneSlot.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ZoneSlot>[],
      allowedVariants:
          (json['allowedVariants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      symmetryGroup: json['symmetryGroup'] as String?,
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$PartDefinitionToJson(_PartDefinition instance) =>
    <String, dynamic>{
      'part': _partToJson(instance.part),
      'cardinality': instance.cardinality,
      'panelSize': instance.panelSize.toJson(),
      'seamAllowance': instance.seamAllowance.toJson(),
      'bleed': instance.bleed.toJson(),
      'zoneSlots': instance.zoneSlots.map((e) => e.toJson()).toList(),
      'allowedVariants': instance.allowedVariants,
      'symmetryGroup': instance.symmetryGroup,
      'metadata': instance.metadata,
    };

_GarmentSchema _$GarmentSchemaFromJson(Map<String, dynamic> json) =>
    _GarmentSchema(
      id: json['id'] as String,
      garment: _garmentFromJson(json['garment'] as String),
      schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 1,
      unit: json['unit'] == null
          ? MeasurementUnit.centimetre
          : _unitFromJson(json['unit'] as String),
      parts:
          (json['parts'] as List<dynamic>?)
              ?.map((e) => PartDefinition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PartDefinition>[],
      symmetryLinks:
          (json['symmetryLinks'] as List<dynamic>?)
              ?.map((e) => SymmetryLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SymmetryLink>[],
      metadata:
          json['metadata'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$GarmentSchemaToJson(_GarmentSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'garment': _garmentToJson(instance.garment),
      'schemaVersion': instance.schemaVersion,
      'unit': _unitToJson(instance.unit),
      'parts': instance.parts.map((e) => e.toJson()).toList(),
      'symmetryLinks': instance.symmetryLinks.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
    };
