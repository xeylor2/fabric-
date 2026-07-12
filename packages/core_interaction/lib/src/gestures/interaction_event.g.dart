// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TapInteraction _$TapInteractionFromJson(Map<String, dynamic> json) =>
    TapInteraction(
      position: Point2D.fromJson(json['position'] as Map<String, dynamic>),
      device:
          $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
          InputDevice.touch,
      modifiers: json['modifiers'] == null
          ? const KeyModifiers()
          : KeyModifiers.fromJson(json['modifiers'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TapInteractionToJson(TapInteraction instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'device': _$InputDeviceEnumMap[instance.device]!,
      'modifiers': instance.modifiers.toJson(),
      'runtimeType': instance.$type,
    };

const _$InputDeviceEnumMap = {
  InputDevice.touch: 'touch',
  InputDevice.mouse: 'mouse',
  InputDevice.trackpad: 'trackpad',
  InputDevice.stylus: 'stylus',
};

DoubleTapInteraction _$DoubleTapInteractionFromJson(
  Map<String, dynamic> json,
) => DoubleTapInteraction(
  position: Point2D.fromJson(json['position'] as Map<String, dynamic>),
  device:
      $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
      InputDevice.touch,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DoubleTapInteractionToJson(
  DoubleTapInteraction instance,
) => <String, dynamic>{
  'position': instance.position.toJson(),
  'device': _$InputDeviceEnumMap[instance.device]!,
  'runtimeType': instance.$type,
};

LongPressInteraction _$LongPressInteractionFromJson(
  Map<String, dynamic> json,
) => LongPressInteraction(
  position: Point2D.fromJson(json['position'] as Map<String, dynamic>),
  device:
      $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
      InputDevice.touch,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LongPressInteractionToJson(
  LongPressInteraction instance,
) => <String, dynamic>{
  'position': instance.position.toJson(),
  'device': _$InputDeviceEnumMap[instance.device]!,
  'runtimeType': instance.$type,
};

DragInteraction _$DragInteractionFromJson(Map<String, dynamic> json) =>
    DragInteraction(
      phase: $enumDecode(_$GesturePhaseEnumMap, json['phase']),
      position: Point2D.fromJson(json['position'] as Map<String, dynamic>),
      delta: json['delta'] == null
          ? Point2D.zero
          : Point2D.fromJson(json['delta'] as Map<String, dynamic>),
      device:
          $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
          InputDevice.touch,
      modifiers: json['modifiers'] == null
          ? const KeyModifiers()
          : KeyModifiers.fromJson(json['modifiers'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DragInteractionToJson(DragInteraction instance) =>
    <String, dynamic>{
      'phase': _$GesturePhaseEnumMap[instance.phase]!,
      'position': instance.position.toJson(),
      'delta': instance.delta.toJson(),
      'device': _$InputDeviceEnumMap[instance.device]!,
      'modifiers': instance.modifiers.toJson(),
      'runtimeType': instance.$type,
    };

const _$GesturePhaseEnumMap = {
  GesturePhase.start: 'start',
  GesturePhase.update: 'update',
  GesturePhase.end: 'end',
  GesturePhase.cancel: 'cancel',
};

PanInteraction _$PanInteractionFromJson(Map<String, dynamic> json) =>
    PanInteraction(
      phase: $enumDecode(_$GesturePhaseEnumMap, json['phase']),
      delta: json['delta'] == null
          ? Point2D.zero
          : Point2D.fromJson(json['delta'] as Map<String, dynamic>),
      pointerCount: (json['pointerCount'] as num?)?.toInt() ?? 1,
      device:
          $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
          InputDevice.touch,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PanInteractionToJson(PanInteraction instance) =>
    <String, dynamic>{
      'phase': _$GesturePhaseEnumMap[instance.phase]!,
      'delta': instance.delta.toJson(),
      'pointerCount': instance.pointerCount,
      'device': _$InputDeviceEnumMap[instance.device]!,
      'runtimeType': instance.$type,
    };

PinchInteraction _$PinchInteractionFromJson(Map<String, dynamic> json) =>
    PinchInteraction(
      phase: $enumDecode(_$GesturePhaseEnumMap, json['phase']),
      focalPoint: Point2D.fromJson(json['focalPoint'] as Map<String, dynamic>),
      scaleFactor: (json['scaleFactor'] as num?)?.toDouble() ?? 1.0,
      rotationDelta: (json['rotationDelta'] as num?)?.toDouble() ?? 0.0,
      panDelta: json['panDelta'] == null
          ? Point2D.zero
          : Point2D.fromJson(json['panDelta'] as Map<String, dynamic>),
      device:
          $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
          InputDevice.touch,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$PinchInteractionToJson(PinchInteraction instance) =>
    <String, dynamic>{
      'phase': _$GesturePhaseEnumMap[instance.phase]!,
      'focalPoint': instance.focalPoint.toJson(),
      'scaleFactor': instance.scaleFactor,
      'rotationDelta': instance.rotationDelta,
      'panDelta': instance.panDelta.toJson(),
      'device': _$InputDeviceEnumMap[instance.device]!,
      'runtimeType': instance.$type,
    };

WheelInteraction _$WheelInteractionFromJson(Map<String, dynamic> json) =>
    WheelInteraction(
      position: Point2D.fromJson(json['position'] as Map<String, dynamic>),
      scrollDelta: Point2D.fromJson(
        json['scrollDelta'] as Map<String, dynamic>,
      ),
      modifiers: json['modifiers'] == null
          ? const KeyModifiers()
          : KeyModifiers.fromJson(json['modifiers'] as Map<String, dynamic>),
      device:
          $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
          InputDevice.mouse,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$WheelInteractionToJson(WheelInteraction instance) =>
    <String, dynamic>{
      'position': instance.position.toJson(),
      'scrollDelta': instance.scrollDelta.toJson(),
      'modifiers': instance.modifiers.toJson(),
      'device': _$InputDeviceEnumMap[instance.device]!,
      'runtimeType': instance.$type,
    };

ShortcutInteraction _$ShortcutInteractionFromJson(Map<String, dynamic> json) =>
    ShortcutInteraction(
      shortcut: $enumDecode(_$InteractionShortcutEnumMap, json['shortcut']),
      device:
          $enumDecodeNullable(_$InputDeviceEnumMap, json['device']) ??
          InputDevice.mouse,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ShortcutInteractionToJson(
  ShortcutInteraction instance,
) => <String, dynamic>{
  'shortcut': _$InteractionShortcutEnumMap[instance.shortcut]!,
  'device': _$InputDeviceEnumMap[instance.device]!,
  'runtimeType': instance.$type,
};

const _$InteractionShortcutEnumMap = {
  InteractionShortcut.zoomIn: 'zoomIn',
  InteractionShortcut.zoomOut: 'zoomOut',
  InteractionShortcut.fitScreen: 'fitScreen',
  InteractionShortcut.actualSize: 'actualSize',
  InteractionShortcut.zoomToSelection: 'zoomToSelection',
  InteractionShortcut.resetView: 'resetView',
};
