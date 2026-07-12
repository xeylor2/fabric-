// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
InteractionEvent _$InteractionEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'tap':
          return TapInteraction.fromJson(
            json
          );
                case 'doubleTap':
          return DoubleTapInteraction.fromJson(
            json
          );
                case 'longPress':
          return LongPressInteraction.fromJson(
            json
          );
                case 'drag':
          return DragInteraction.fromJson(
            json
          );
                case 'pan':
          return PanInteraction.fromJson(
            json
          );
                case 'pinch':
          return PinchInteraction.fromJson(
            json
          );
                case 'wheel':
          return WheelInteraction.fromJson(
            json
          );
                case 'shortcut':
          return ShortcutInteraction.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'InteractionEvent',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$InteractionEvent {

 InputDevice get device;
/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InteractionEventCopyWith<InteractionEvent> get copyWith => _$InteractionEventCopyWithImpl<InteractionEvent>(this as InteractionEvent, _$identity);

  /// Serializes this InteractionEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InteractionEvent&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'InteractionEvent(device: $device)';
}


}

/// @nodoc
abstract mixin class $InteractionEventCopyWith<$Res>  {
  factory $InteractionEventCopyWith(InteractionEvent value, $Res Function(InteractionEvent) _then) = _$InteractionEventCopyWithImpl;
@useResult
$Res call({
 InputDevice device
});




}
/// @nodoc
class _$InteractionEventCopyWithImpl<$Res>
    implements $InteractionEventCopyWith<$Res> {
  _$InteractionEventCopyWithImpl(this._self, this._then);

  final InteractionEvent _self;
  final $Res Function(InteractionEvent) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? device = null,}) {
  return _then(_self.copyWith(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,
  ));
}

}


/// Adds pattern-matching-related methods to [InteractionEvent].
extension InteractionEventPatterns on InteractionEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TapInteraction value)?  tap,TResult Function( DoubleTapInteraction value)?  doubleTap,TResult Function( LongPressInteraction value)?  longPress,TResult Function( DragInteraction value)?  drag,TResult Function( PanInteraction value)?  pan,TResult Function( PinchInteraction value)?  pinch,TResult Function( WheelInteraction value)?  wheel,TResult Function( ShortcutInteraction value)?  shortcut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TapInteraction() when tap != null:
return tap(_that);case DoubleTapInteraction() when doubleTap != null:
return doubleTap(_that);case LongPressInteraction() when longPress != null:
return longPress(_that);case DragInteraction() when drag != null:
return drag(_that);case PanInteraction() when pan != null:
return pan(_that);case PinchInteraction() when pinch != null:
return pinch(_that);case WheelInteraction() when wheel != null:
return wheel(_that);case ShortcutInteraction() when shortcut != null:
return shortcut(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TapInteraction value)  tap,required TResult Function( DoubleTapInteraction value)  doubleTap,required TResult Function( LongPressInteraction value)  longPress,required TResult Function( DragInteraction value)  drag,required TResult Function( PanInteraction value)  pan,required TResult Function( PinchInteraction value)  pinch,required TResult Function( WheelInteraction value)  wheel,required TResult Function( ShortcutInteraction value)  shortcut,}){
final _that = this;
switch (_that) {
case TapInteraction():
return tap(_that);case DoubleTapInteraction():
return doubleTap(_that);case LongPressInteraction():
return longPress(_that);case DragInteraction():
return drag(_that);case PanInteraction():
return pan(_that);case PinchInteraction():
return pinch(_that);case WheelInteraction():
return wheel(_that);case ShortcutInteraction():
return shortcut(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TapInteraction value)?  tap,TResult? Function( DoubleTapInteraction value)?  doubleTap,TResult? Function( LongPressInteraction value)?  longPress,TResult? Function( DragInteraction value)?  drag,TResult? Function( PanInteraction value)?  pan,TResult? Function( PinchInteraction value)?  pinch,TResult? Function( WheelInteraction value)?  wheel,TResult? Function( ShortcutInteraction value)?  shortcut,}){
final _that = this;
switch (_that) {
case TapInteraction() when tap != null:
return tap(_that);case DoubleTapInteraction() when doubleTap != null:
return doubleTap(_that);case LongPressInteraction() when longPress != null:
return longPress(_that);case DragInteraction() when drag != null:
return drag(_that);case PanInteraction() when pan != null:
return pan(_that);case PinchInteraction() when pinch != null:
return pinch(_that);case WheelInteraction() when wheel != null:
return wheel(_that);case ShortcutInteraction() when shortcut != null:
return shortcut(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Point2D position,  InputDevice device,  KeyModifiers modifiers)?  tap,TResult Function( Point2D position,  InputDevice device)?  doubleTap,TResult Function( Point2D position,  InputDevice device)?  longPress,TResult Function( GesturePhase phase,  Point2D position,  Point2D delta,  InputDevice device,  KeyModifiers modifiers)?  drag,TResult Function( GesturePhase phase,  Point2D delta,  int pointerCount,  InputDevice device)?  pan,TResult Function( GesturePhase phase,  Point2D focalPoint,  double scaleFactor,  double rotationDelta,  Point2D panDelta,  InputDevice device)?  pinch,TResult Function( Point2D position,  Point2D scrollDelta,  KeyModifiers modifiers,  InputDevice device)?  wheel,TResult Function( InteractionShortcut shortcut,  InputDevice device)?  shortcut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TapInteraction() when tap != null:
return tap(_that.position,_that.device,_that.modifiers);case DoubleTapInteraction() when doubleTap != null:
return doubleTap(_that.position,_that.device);case LongPressInteraction() when longPress != null:
return longPress(_that.position,_that.device);case DragInteraction() when drag != null:
return drag(_that.phase,_that.position,_that.delta,_that.device,_that.modifiers);case PanInteraction() when pan != null:
return pan(_that.phase,_that.delta,_that.pointerCount,_that.device);case PinchInteraction() when pinch != null:
return pinch(_that.phase,_that.focalPoint,_that.scaleFactor,_that.rotationDelta,_that.panDelta,_that.device);case WheelInteraction() when wheel != null:
return wheel(_that.position,_that.scrollDelta,_that.modifiers,_that.device);case ShortcutInteraction() when shortcut != null:
return shortcut(_that.shortcut,_that.device);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Point2D position,  InputDevice device,  KeyModifiers modifiers)  tap,required TResult Function( Point2D position,  InputDevice device)  doubleTap,required TResult Function( Point2D position,  InputDevice device)  longPress,required TResult Function( GesturePhase phase,  Point2D position,  Point2D delta,  InputDevice device,  KeyModifiers modifiers)  drag,required TResult Function( GesturePhase phase,  Point2D delta,  int pointerCount,  InputDevice device)  pan,required TResult Function( GesturePhase phase,  Point2D focalPoint,  double scaleFactor,  double rotationDelta,  Point2D panDelta,  InputDevice device)  pinch,required TResult Function( Point2D position,  Point2D scrollDelta,  KeyModifiers modifiers,  InputDevice device)  wheel,required TResult Function( InteractionShortcut shortcut,  InputDevice device)  shortcut,}) {final _that = this;
switch (_that) {
case TapInteraction():
return tap(_that.position,_that.device,_that.modifiers);case DoubleTapInteraction():
return doubleTap(_that.position,_that.device);case LongPressInteraction():
return longPress(_that.position,_that.device);case DragInteraction():
return drag(_that.phase,_that.position,_that.delta,_that.device,_that.modifiers);case PanInteraction():
return pan(_that.phase,_that.delta,_that.pointerCount,_that.device);case PinchInteraction():
return pinch(_that.phase,_that.focalPoint,_that.scaleFactor,_that.rotationDelta,_that.panDelta,_that.device);case WheelInteraction():
return wheel(_that.position,_that.scrollDelta,_that.modifiers,_that.device);case ShortcutInteraction():
return shortcut(_that.shortcut,_that.device);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Point2D position,  InputDevice device,  KeyModifiers modifiers)?  tap,TResult? Function( Point2D position,  InputDevice device)?  doubleTap,TResult? Function( Point2D position,  InputDevice device)?  longPress,TResult? Function( GesturePhase phase,  Point2D position,  Point2D delta,  InputDevice device,  KeyModifiers modifiers)?  drag,TResult? Function( GesturePhase phase,  Point2D delta,  int pointerCount,  InputDevice device)?  pan,TResult? Function( GesturePhase phase,  Point2D focalPoint,  double scaleFactor,  double rotationDelta,  Point2D panDelta,  InputDevice device)?  pinch,TResult? Function( Point2D position,  Point2D scrollDelta,  KeyModifiers modifiers,  InputDevice device)?  wheel,TResult? Function( InteractionShortcut shortcut,  InputDevice device)?  shortcut,}) {final _that = this;
switch (_that) {
case TapInteraction() when tap != null:
return tap(_that.position,_that.device,_that.modifiers);case DoubleTapInteraction() when doubleTap != null:
return doubleTap(_that.position,_that.device);case LongPressInteraction() when longPress != null:
return longPress(_that.position,_that.device);case DragInteraction() when drag != null:
return drag(_that.phase,_that.position,_that.delta,_that.device,_that.modifiers);case PanInteraction() when pan != null:
return pan(_that.phase,_that.delta,_that.pointerCount,_that.device);case PinchInteraction() when pinch != null:
return pinch(_that.phase,_that.focalPoint,_that.scaleFactor,_that.rotationDelta,_that.panDelta,_that.device);case WheelInteraction() when wheel != null:
return wheel(_that.position,_that.scrollDelta,_that.modifiers,_that.device);case ShortcutInteraction() when shortcut != null:
return shortcut(_that.shortcut,_that.device);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TapInteraction extends InteractionEvent {
  const TapInteraction({required this.position, this.device = InputDevice.touch, this.modifiers = const KeyModifiers(), final  String? $type}): $type = $type ?? 'tap',super._();
  factory TapInteraction.fromJson(Map<String, dynamic> json) => _$TapInteractionFromJson(json);

 final  Point2D position;
@override@JsonKey() final  InputDevice device;
@JsonKey() final  KeyModifiers modifiers;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapInteractionCopyWith<TapInteraction> get copyWith => _$TapInteractionCopyWithImpl<TapInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TapInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapInteraction&&(identical(other.position, position) || other.position == position)&&(identical(other.device, device) || other.device == device)&&(identical(other.modifiers, modifiers) || other.modifiers == modifiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,device,modifiers);

@override
String toString() {
  return 'InteractionEvent.tap(position: $position, device: $device, modifiers: $modifiers)';
}


}

/// @nodoc
abstract mixin class $TapInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $TapInteractionCopyWith(TapInteraction value, $Res Function(TapInteraction) _then) = _$TapInteractionCopyWithImpl;
@override @useResult
$Res call({
 Point2D position, InputDevice device, KeyModifiers modifiers
});


$Point2DCopyWith<$Res> get position;$KeyModifiersCopyWith<$Res> get modifiers;

}
/// @nodoc
class _$TapInteractionCopyWithImpl<$Res>
    implements $TapInteractionCopyWith<$Res> {
  _$TapInteractionCopyWithImpl(this._self, this._then);

  final TapInteraction _self;
  final $Res Function(TapInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? device = null,Object? modifiers = null,}) {
  return _then(TapInteraction(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Point2D,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,modifiers: null == modifiers ? _self.modifiers : modifiers // ignore: cast_nullable_to_non_nullable
as KeyModifiers,
  ));
}

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get position {
  
  return $Point2DCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyModifiersCopyWith<$Res> get modifiers {
  
  return $KeyModifiersCopyWith<$Res>(_self.modifiers, (value) {
    return _then(_self.copyWith(modifiers: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class DoubleTapInteraction extends InteractionEvent {
  const DoubleTapInteraction({required this.position, this.device = InputDevice.touch, final  String? $type}): $type = $type ?? 'doubleTap',super._();
  factory DoubleTapInteraction.fromJson(Map<String, dynamic> json) => _$DoubleTapInteractionFromJson(json);

 final  Point2D position;
@override@JsonKey() final  InputDevice device;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoubleTapInteractionCopyWith<DoubleTapInteraction> get copyWith => _$DoubleTapInteractionCopyWithImpl<DoubleTapInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DoubleTapInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoubleTapInteraction&&(identical(other.position, position) || other.position == position)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,device);

@override
String toString() {
  return 'InteractionEvent.doubleTap(position: $position, device: $device)';
}


}

/// @nodoc
abstract mixin class $DoubleTapInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $DoubleTapInteractionCopyWith(DoubleTapInteraction value, $Res Function(DoubleTapInteraction) _then) = _$DoubleTapInteractionCopyWithImpl;
@override @useResult
$Res call({
 Point2D position, InputDevice device
});


$Point2DCopyWith<$Res> get position;

}
/// @nodoc
class _$DoubleTapInteractionCopyWithImpl<$Res>
    implements $DoubleTapInteractionCopyWith<$Res> {
  _$DoubleTapInteractionCopyWithImpl(this._self, this._then);

  final DoubleTapInteraction _self;
  final $Res Function(DoubleTapInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? device = null,}) {
  return _then(DoubleTapInteraction(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Point2D,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,
  ));
}

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get position {
  
  return $Point2DCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class LongPressInteraction extends InteractionEvent {
  const LongPressInteraction({required this.position, this.device = InputDevice.touch, final  String? $type}): $type = $type ?? 'longPress',super._();
  factory LongPressInteraction.fromJson(Map<String, dynamic> json) => _$LongPressInteractionFromJson(json);

 final  Point2D position;
@override@JsonKey() final  InputDevice device;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LongPressInteractionCopyWith<LongPressInteraction> get copyWith => _$LongPressInteractionCopyWithImpl<LongPressInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LongPressInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LongPressInteraction&&(identical(other.position, position) || other.position == position)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,device);

@override
String toString() {
  return 'InteractionEvent.longPress(position: $position, device: $device)';
}


}

/// @nodoc
abstract mixin class $LongPressInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $LongPressInteractionCopyWith(LongPressInteraction value, $Res Function(LongPressInteraction) _then) = _$LongPressInteractionCopyWithImpl;
@override @useResult
$Res call({
 Point2D position, InputDevice device
});


$Point2DCopyWith<$Res> get position;

}
/// @nodoc
class _$LongPressInteractionCopyWithImpl<$Res>
    implements $LongPressInteractionCopyWith<$Res> {
  _$LongPressInteractionCopyWithImpl(this._self, this._then);

  final LongPressInteraction _self;
  final $Res Function(LongPressInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? device = null,}) {
  return _then(LongPressInteraction(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Point2D,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,
  ));
}

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get position {
  
  return $Point2DCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class DragInteraction extends InteractionEvent {
  const DragInteraction({required this.phase, required this.position, this.delta = Point2D.zero, this.device = InputDevice.touch, this.modifiers = const KeyModifiers(), final  String? $type}): $type = $type ?? 'drag',super._();
  factory DragInteraction.fromJson(Map<String, dynamic> json) => _$DragInteractionFromJson(json);

 final  GesturePhase phase;
 final  Point2D position;
@JsonKey() final  Point2D delta;
@override@JsonKey() final  InputDevice device;
@JsonKey() final  KeyModifiers modifiers;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DragInteractionCopyWith<DragInteraction> get copyWith => _$DragInteractionCopyWithImpl<DragInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DragInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DragInteraction&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.position, position) || other.position == position)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.device, device) || other.device == device)&&(identical(other.modifiers, modifiers) || other.modifiers == modifiers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phase,position,delta,device,modifiers);

@override
String toString() {
  return 'InteractionEvent.drag(phase: $phase, position: $position, delta: $delta, device: $device, modifiers: $modifiers)';
}


}

/// @nodoc
abstract mixin class $DragInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $DragInteractionCopyWith(DragInteraction value, $Res Function(DragInteraction) _then) = _$DragInteractionCopyWithImpl;
@override @useResult
$Res call({
 GesturePhase phase, Point2D position, Point2D delta, InputDevice device, KeyModifiers modifiers
});


$Point2DCopyWith<$Res> get position;$Point2DCopyWith<$Res> get delta;$KeyModifiersCopyWith<$Res> get modifiers;

}
/// @nodoc
class _$DragInteractionCopyWithImpl<$Res>
    implements $DragInteractionCopyWith<$Res> {
  _$DragInteractionCopyWithImpl(this._self, this._then);

  final DragInteraction _self;
  final $Res Function(DragInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? position = null,Object? delta = null,Object? device = null,Object? modifiers = null,}) {
  return _then(DragInteraction(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GesturePhase,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Point2D,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as Point2D,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,modifiers: null == modifiers ? _self.modifiers : modifiers // ignore: cast_nullable_to_non_nullable
as KeyModifiers,
  ));
}

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get position {
  
  return $Point2DCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get delta {
  
  return $Point2DCopyWith<$Res>(_self.delta, (value) {
    return _then(_self.copyWith(delta: value));
  });
}/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyModifiersCopyWith<$Res> get modifiers {
  
  return $KeyModifiersCopyWith<$Res>(_self.modifiers, (value) {
    return _then(_self.copyWith(modifiers: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PanInteraction extends InteractionEvent {
  const PanInteraction({required this.phase, this.delta = Point2D.zero, this.pointerCount = 1, this.device = InputDevice.touch, final  String? $type}): $type = $type ?? 'pan',super._();
  factory PanInteraction.fromJson(Map<String, dynamic> json) => _$PanInteractionFromJson(json);

 final  GesturePhase phase;
@JsonKey() final  Point2D delta;
@JsonKey() final  int pointerCount;
@override@JsonKey() final  InputDevice device;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PanInteractionCopyWith<PanInteraction> get copyWith => _$PanInteractionCopyWithImpl<PanInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PanInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PanInteraction&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.delta, delta) || other.delta == delta)&&(identical(other.pointerCount, pointerCount) || other.pointerCount == pointerCount)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phase,delta,pointerCount,device);

@override
String toString() {
  return 'InteractionEvent.pan(phase: $phase, delta: $delta, pointerCount: $pointerCount, device: $device)';
}


}

/// @nodoc
abstract mixin class $PanInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $PanInteractionCopyWith(PanInteraction value, $Res Function(PanInteraction) _then) = _$PanInteractionCopyWithImpl;
@override @useResult
$Res call({
 GesturePhase phase, Point2D delta, int pointerCount, InputDevice device
});


$Point2DCopyWith<$Res> get delta;

}
/// @nodoc
class _$PanInteractionCopyWithImpl<$Res>
    implements $PanInteractionCopyWith<$Res> {
  _$PanInteractionCopyWithImpl(this._self, this._then);

  final PanInteraction _self;
  final $Res Function(PanInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? delta = null,Object? pointerCount = null,Object? device = null,}) {
  return _then(PanInteraction(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GesturePhase,delta: null == delta ? _self.delta : delta // ignore: cast_nullable_to_non_nullable
as Point2D,pointerCount: null == pointerCount ? _self.pointerCount : pointerCount // ignore: cast_nullable_to_non_nullable
as int,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,
  ));
}

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get delta {
  
  return $Point2DCopyWith<$Res>(_self.delta, (value) {
    return _then(_self.copyWith(delta: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PinchInteraction extends InteractionEvent {
  const PinchInteraction({required this.phase, required this.focalPoint, this.scaleFactor = 1.0, this.rotationDelta = 0.0, this.panDelta = Point2D.zero, this.device = InputDevice.touch, final  String? $type}): $type = $type ?? 'pinch',super._();
  factory PinchInteraction.fromJson(Map<String, dynamic> json) => _$PinchInteractionFromJson(json);

 final  GesturePhase phase;
 final  Point2D focalPoint;
@JsonKey() final  double scaleFactor;
@JsonKey() final  double rotationDelta;
@JsonKey() final  Point2D panDelta;
@override@JsonKey() final  InputDevice device;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinchInteractionCopyWith<PinchInteraction> get copyWith => _$PinchInteractionCopyWithImpl<PinchInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PinchInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinchInteraction&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.focalPoint, focalPoint) || other.focalPoint == focalPoint)&&(identical(other.scaleFactor, scaleFactor) || other.scaleFactor == scaleFactor)&&(identical(other.rotationDelta, rotationDelta) || other.rotationDelta == rotationDelta)&&(identical(other.panDelta, panDelta) || other.panDelta == panDelta)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phase,focalPoint,scaleFactor,rotationDelta,panDelta,device);

@override
String toString() {
  return 'InteractionEvent.pinch(phase: $phase, focalPoint: $focalPoint, scaleFactor: $scaleFactor, rotationDelta: $rotationDelta, panDelta: $panDelta, device: $device)';
}


}

/// @nodoc
abstract mixin class $PinchInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $PinchInteractionCopyWith(PinchInteraction value, $Res Function(PinchInteraction) _then) = _$PinchInteractionCopyWithImpl;
@override @useResult
$Res call({
 GesturePhase phase, Point2D focalPoint, double scaleFactor, double rotationDelta, Point2D panDelta, InputDevice device
});


$Point2DCopyWith<$Res> get focalPoint;$Point2DCopyWith<$Res> get panDelta;

}
/// @nodoc
class _$PinchInteractionCopyWithImpl<$Res>
    implements $PinchInteractionCopyWith<$Res> {
  _$PinchInteractionCopyWithImpl(this._self, this._then);

  final PinchInteraction _self;
  final $Res Function(PinchInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? focalPoint = null,Object? scaleFactor = null,Object? rotationDelta = null,Object? panDelta = null,Object? device = null,}) {
  return _then(PinchInteraction(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as GesturePhase,focalPoint: null == focalPoint ? _self.focalPoint : focalPoint // ignore: cast_nullable_to_non_nullable
as Point2D,scaleFactor: null == scaleFactor ? _self.scaleFactor : scaleFactor // ignore: cast_nullable_to_non_nullable
as double,rotationDelta: null == rotationDelta ? _self.rotationDelta : rotationDelta // ignore: cast_nullable_to_non_nullable
as double,panDelta: null == panDelta ? _self.panDelta : panDelta // ignore: cast_nullable_to_non_nullable
as Point2D,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,
  ));
}

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get focalPoint {
  
  return $Point2DCopyWith<$Res>(_self.focalPoint, (value) {
    return _then(_self.copyWith(focalPoint: value));
  });
}/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get panDelta {
  
  return $Point2DCopyWith<$Res>(_self.panDelta, (value) {
    return _then(_self.copyWith(panDelta: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class WheelInteraction extends InteractionEvent {
  const WheelInteraction({required this.position, required this.scrollDelta, this.modifiers = const KeyModifiers(), this.device = InputDevice.mouse, final  String? $type}): $type = $type ?? 'wheel',super._();
  factory WheelInteraction.fromJson(Map<String, dynamic> json) => _$WheelInteractionFromJson(json);

 final  Point2D position;
 final  Point2D scrollDelta;
@JsonKey() final  KeyModifiers modifiers;
@override@JsonKey() final  InputDevice device;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WheelInteractionCopyWith<WheelInteraction> get copyWith => _$WheelInteractionCopyWithImpl<WheelInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WheelInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WheelInteraction&&(identical(other.position, position) || other.position == position)&&(identical(other.scrollDelta, scrollDelta) || other.scrollDelta == scrollDelta)&&(identical(other.modifiers, modifiers) || other.modifiers == modifiers)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,scrollDelta,modifiers,device);

@override
String toString() {
  return 'InteractionEvent.wheel(position: $position, scrollDelta: $scrollDelta, modifiers: $modifiers, device: $device)';
}


}

/// @nodoc
abstract mixin class $WheelInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $WheelInteractionCopyWith(WheelInteraction value, $Res Function(WheelInteraction) _then) = _$WheelInteractionCopyWithImpl;
@override @useResult
$Res call({
 Point2D position, Point2D scrollDelta, KeyModifiers modifiers, InputDevice device
});


$Point2DCopyWith<$Res> get position;$Point2DCopyWith<$Res> get scrollDelta;$KeyModifiersCopyWith<$Res> get modifiers;

}
/// @nodoc
class _$WheelInteractionCopyWithImpl<$Res>
    implements $WheelInteractionCopyWith<$Res> {
  _$WheelInteractionCopyWithImpl(this._self, this._then);

  final WheelInteraction _self;
  final $Res Function(WheelInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? scrollDelta = null,Object? modifiers = null,Object? device = null,}) {
  return _then(WheelInteraction(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Point2D,scrollDelta: null == scrollDelta ? _self.scrollDelta : scrollDelta // ignore: cast_nullable_to_non_nullable
as Point2D,modifiers: null == modifiers ? _self.modifiers : modifiers // ignore: cast_nullable_to_non_nullable
as KeyModifiers,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,
  ));
}

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get position {
  
  return $Point2DCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Point2DCopyWith<$Res> get scrollDelta {
  
  return $Point2DCopyWith<$Res>(_self.scrollDelta, (value) {
    return _then(_self.copyWith(scrollDelta: value));
  });
}/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KeyModifiersCopyWith<$Res> get modifiers {
  
  return $KeyModifiersCopyWith<$Res>(_self.modifiers, (value) {
    return _then(_self.copyWith(modifiers: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ShortcutInteraction extends InteractionEvent {
  const ShortcutInteraction({required this.shortcut, this.device = InputDevice.mouse, final  String? $type}): $type = $type ?? 'shortcut',super._();
  factory ShortcutInteraction.fromJson(Map<String, dynamic> json) => _$ShortcutInteractionFromJson(json);

 final  InteractionShortcut shortcut;
@override@JsonKey() final  InputDevice device;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortcutInteractionCopyWith<ShortcutInteraction> get copyWith => _$ShortcutInteractionCopyWithImpl<ShortcutInteraction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShortcutInteractionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortcutInteraction&&(identical(other.shortcut, shortcut) || other.shortcut == shortcut)&&(identical(other.device, device) || other.device == device));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shortcut,device);

@override
String toString() {
  return 'InteractionEvent.shortcut(shortcut: $shortcut, device: $device)';
}


}

/// @nodoc
abstract mixin class $ShortcutInteractionCopyWith<$Res> implements $InteractionEventCopyWith<$Res> {
  factory $ShortcutInteractionCopyWith(ShortcutInteraction value, $Res Function(ShortcutInteraction) _then) = _$ShortcutInteractionCopyWithImpl;
@override @useResult
$Res call({
 InteractionShortcut shortcut, InputDevice device
});




}
/// @nodoc
class _$ShortcutInteractionCopyWithImpl<$Res>
    implements $ShortcutInteractionCopyWith<$Res> {
  _$ShortcutInteractionCopyWithImpl(this._self, this._then);

  final ShortcutInteraction _self;
  final $Res Function(ShortcutInteraction) _then;

/// Create a copy of InteractionEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shortcut = null,Object? device = null,}) {
  return _then(ShortcutInteraction(
shortcut: null == shortcut ? _self.shortcut : shortcut // ignore: cast_nullable_to_non_nullable
as InteractionShortcut,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as InputDevice,
  ));
}


}

// dart format on
