// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProviderHealth {

@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson) HealthStatus get status;@JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson) CircuitState get circuit;/// Median probe latency, milliseconds.
 int? get latencyP50Ms;/// 95th-percentile probe latency, milliseconds.
 int? get latencyP95Ms;/// When the last probe ran.
 DateTime? get lastCheck;
/// Create a copy of ProviderHealth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderHealthCopyWith<ProviderHealth> get copyWith => _$ProviderHealthCopyWithImpl<ProviderHealth>(this as ProviderHealth, _$identity);

  /// Serializes this ProviderHealth to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderHealth&&(identical(other.status, status) || other.status == status)&&(identical(other.circuit, circuit) || other.circuit == circuit)&&(identical(other.latencyP50Ms, latencyP50Ms) || other.latencyP50Ms == latencyP50Ms)&&(identical(other.latencyP95Ms, latencyP95Ms) || other.latencyP95Ms == latencyP95Ms)&&(identical(other.lastCheck, lastCheck) || other.lastCheck == lastCheck));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,circuit,latencyP50Ms,latencyP95Ms,lastCheck);

@override
String toString() {
  return 'ProviderHealth(status: $status, circuit: $circuit, latencyP50Ms: $latencyP50Ms, latencyP95Ms: $latencyP95Ms, lastCheck: $lastCheck)';
}


}

/// @nodoc
abstract mixin class $ProviderHealthCopyWith<$Res>  {
  factory $ProviderHealthCopyWith(ProviderHealth value, $Res Function(ProviderHealth) _then) = _$ProviderHealthCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson) HealthStatus status,@JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson) CircuitState circuit, int? latencyP50Ms, int? latencyP95Ms, DateTime? lastCheck
});




}
/// @nodoc
class _$ProviderHealthCopyWithImpl<$Res>
    implements $ProviderHealthCopyWith<$Res> {
  _$ProviderHealthCopyWithImpl(this._self, this._then);

  final ProviderHealth _self;
  final $Res Function(ProviderHealth) _then;

/// Create a copy of ProviderHealth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? circuit = null,Object? latencyP50Ms = freezed,Object? latencyP95Ms = freezed,Object? lastCheck = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HealthStatus,circuit: null == circuit ? _self.circuit : circuit // ignore: cast_nullable_to_non_nullable
as CircuitState,latencyP50Ms: freezed == latencyP50Ms ? _self.latencyP50Ms : latencyP50Ms // ignore: cast_nullable_to_non_nullable
as int?,latencyP95Ms: freezed == latencyP95Ms ? _self.latencyP95Ms : latencyP95Ms // ignore: cast_nullable_to_non_nullable
as int?,lastCheck: freezed == lastCheck ? _self.lastCheck : lastCheck // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderHealth].
extension ProviderHealthPatterns on ProviderHealth {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderHealth value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderHealth() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderHealth value)  $default,){
final _that = this;
switch (_that) {
case _ProviderHealth():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderHealth value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderHealth() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson)  HealthStatus status, @JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson)  CircuitState circuit,  int? latencyP50Ms,  int? latencyP95Ms,  DateTime? lastCheck)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderHealth() when $default != null:
return $default(_that.status,_that.circuit,_that.latencyP50Ms,_that.latencyP95Ms,_that.lastCheck);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson)  HealthStatus status, @JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson)  CircuitState circuit,  int? latencyP50Ms,  int? latencyP95Ms,  DateTime? lastCheck)  $default,) {final _that = this;
switch (_that) {
case _ProviderHealth():
return $default(_that.status,_that.circuit,_that.latencyP50Ms,_that.latencyP95Ms,_that.lastCheck);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson)  HealthStatus status, @JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson)  CircuitState circuit,  int? latencyP50Ms,  int? latencyP95Ms,  DateTime? lastCheck)?  $default,) {final _that = this;
switch (_that) {
case _ProviderHealth() when $default != null:
return $default(_that.status,_that.circuit,_that.latencyP50Ms,_that.latencyP95Ms,_that.lastCheck);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderHealth extends ProviderHealth {
  const _ProviderHealth({@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson) this.status = HealthStatus.unknown, @JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson) this.circuit = CircuitState.closed, this.latencyP50Ms, this.latencyP95Ms, this.lastCheck}): super._();
  factory _ProviderHealth.fromJson(Map<String, dynamic> json) => _$ProviderHealthFromJson(json);

@override@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson) final  HealthStatus status;
@override@JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson) final  CircuitState circuit;
/// Median probe latency, milliseconds.
@override final  int? latencyP50Ms;
/// 95th-percentile probe latency, milliseconds.
@override final  int? latencyP95Ms;
/// When the last probe ran.
@override final  DateTime? lastCheck;

/// Create a copy of ProviderHealth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderHealthCopyWith<_ProviderHealth> get copyWith => __$ProviderHealthCopyWithImpl<_ProviderHealth>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderHealthToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderHealth&&(identical(other.status, status) || other.status == status)&&(identical(other.circuit, circuit) || other.circuit == circuit)&&(identical(other.latencyP50Ms, latencyP50Ms) || other.latencyP50Ms == latencyP50Ms)&&(identical(other.latencyP95Ms, latencyP95Ms) || other.latencyP95Ms == latencyP95Ms)&&(identical(other.lastCheck, lastCheck) || other.lastCheck == lastCheck));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,circuit,latencyP50Ms,latencyP95Ms,lastCheck);

@override
String toString() {
  return 'ProviderHealth(status: $status, circuit: $circuit, latencyP50Ms: $latencyP50Ms, latencyP95Ms: $latencyP95Ms, lastCheck: $lastCheck)';
}


}

/// @nodoc
abstract mixin class _$ProviderHealthCopyWith<$Res> implements $ProviderHealthCopyWith<$Res> {
  factory _$ProviderHealthCopyWith(_ProviderHealth value, $Res Function(_ProviderHealth) _then) = __$ProviderHealthCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _healthStatusFromJson, toJson: _healthStatusToJson) HealthStatus status,@JsonKey(fromJson: _circuitFromJson, toJson: _circuitToJson) CircuitState circuit, int? latencyP50Ms, int? latencyP95Ms, DateTime? lastCheck
});




}
/// @nodoc
class __$ProviderHealthCopyWithImpl<$Res>
    implements _$ProviderHealthCopyWith<$Res> {
  __$ProviderHealthCopyWithImpl(this._self, this._then);

  final _ProviderHealth _self;
  final $Res Function(_ProviderHealth) _then;

/// Create a copy of ProviderHealth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? circuit = null,Object? latencyP50Ms = freezed,Object? latencyP95Ms = freezed,Object? lastCheck = freezed,}) {
  return _then(_ProviderHealth(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HealthStatus,circuit: null == circuit ? _self.circuit : circuit // ignore: cast_nullable_to_non_nullable
as CircuitState,latencyP50Ms: freezed == latencyP50Ms ? _self.latencyP50Ms : latencyP50Ms // ignore: cast_nullable_to_non_nullable
as int?,latencyP95Ms: freezed == latencyP95Ms ? _self.latencyP95Ms : latencyP95Ms // ignore: cast_nullable_to_non_nullable
as int?,lastCheck: freezed == lastCheck ? _self.lastCheck : lastCheck // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ProviderQuota {

 int get used; int get limit;/// When the quota window resets.
 DateTime? get resetAt;
/// Create a copy of ProviderQuota
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderQuotaCopyWith<ProviderQuota> get copyWith => _$ProviderQuotaCopyWithImpl<ProviderQuota>(this as ProviderQuota, _$identity);

  /// Serializes this ProviderQuota to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderQuota&&(identical(other.used, used) || other.used == used)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.resetAt, resetAt) || other.resetAt == resetAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,used,limit,resetAt);

@override
String toString() {
  return 'ProviderQuota(used: $used, limit: $limit, resetAt: $resetAt)';
}


}

/// @nodoc
abstract mixin class $ProviderQuotaCopyWith<$Res>  {
  factory $ProviderQuotaCopyWith(ProviderQuota value, $Res Function(ProviderQuota) _then) = _$ProviderQuotaCopyWithImpl;
@useResult
$Res call({
 int used, int limit, DateTime? resetAt
});




}
/// @nodoc
class _$ProviderQuotaCopyWithImpl<$Res>
    implements $ProviderQuotaCopyWith<$Res> {
  _$ProviderQuotaCopyWithImpl(this._self, this._then);

  final ProviderQuota _self;
  final $Res Function(ProviderQuota) _then;

/// Create a copy of ProviderQuota
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? used = null,Object? limit = null,Object? resetAt = freezed,}) {
  return _then(_self.copyWith(
used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,resetAt: freezed == resetAt ? _self.resetAt : resetAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderQuota].
extension ProviderQuotaPatterns on ProviderQuota {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderQuota value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderQuota() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderQuota value)  $default,){
final _that = this;
switch (_that) {
case _ProviderQuota():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderQuota value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderQuota() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int used,  int limit,  DateTime? resetAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderQuota() when $default != null:
return $default(_that.used,_that.limit,_that.resetAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int used,  int limit,  DateTime? resetAt)  $default,) {final _that = this;
switch (_that) {
case _ProviderQuota():
return $default(_that.used,_that.limit,_that.resetAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int used,  int limit,  DateTime? resetAt)?  $default,) {final _that = this;
switch (_that) {
case _ProviderQuota() when $default != null:
return $default(_that.used,_that.limit,_that.resetAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderQuota extends ProviderQuota {
  const _ProviderQuota({required this.used, required this.limit, this.resetAt}): assert(used >= 0, 'used must be non-negative'),assert(limit > 0, 'limit must be positive'),super._();
  factory _ProviderQuota.fromJson(Map<String, dynamic> json) => _$ProviderQuotaFromJson(json);

@override final  int used;
@override final  int limit;
/// When the quota window resets.
@override final  DateTime? resetAt;

/// Create a copy of ProviderQuota
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderQuotaCopyWith<_ProviderQuota> get copyWith => __$ProviderQuotaCopyWithImpl<_ProviderQuota>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderQuotaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderQuota&&(identical(other.used, used) || other.used == used)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.resetAt, resetAt) || other.resetAt == resetAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,used,limit,resetAt);

@override
String toString() {
  return 'ProviderQuota(used: $used, limit: $limit, resetAt: $resetAt)';
}


}

/// @nodoc
abstract mixin class _$ProviderQuotaCopyWith<$Res> implements $ProviderQuotaCopyWith<$Res> {
  factory _$ProviderQuotaCopyWith(_ProviderQuota value, $Res Function(_ProviderQuota) _then) = __$ProviderQuotaCopyWithImpl;
@override @useResult
$Res call({
 int used, int limit, DateTime? resetAt
});




}
/// @nodoc
class __$ProviderQuotaCopyWithImpl<$Res>
    implements _$ProviderQuotaCopyWith<$Res> {
  __$ProviderQuotaCopyWithImpl(this._self, this._then);

  final _ProviderQuota _self;
  final $Res Function(_ProviderQuota) _then;

/// Create a copy of ProviderQuota
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? used = null,Object? limit = null,Object? resetAt = freezed,}) {
  return _then(_ProviderQuota(
used: null == used ? _self.used : used // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,resetAt: freezed == resetAt ? _self.resetAt : resetAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ProviderValidity {

 bool get keyValid; DateTime? get lastValidation;
/// Create a copy of ProviderValidity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderValidityCopyWith<ProviderValidity> get copyWith => _$ProviderValidityCopyWithImpl<ProviderValidity>(this as ProviderValidity, _$identity);

  /// Serializes this ProviderValidity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderValidity&&(identical(other.keyValid, keyValid) || other.keyValid == keyValid)&&(identical(other.lastValidation, lastValidation) || other.lastValidation == lastValidation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyValid,lastValidation);

@override
String toString() {
  return 'ProviderValidity(keyValid: $keyValid, lastValidation: $lastValidation)';
}


}

/// @nodoc
abstract mixin class $ProviderValidityCopyWith<$Res>  {
  factory $ProviderValidityCopyWith(ProviderValidity value, $Res Function(ProviderValidity) _then) = _$ProviderValidityCopyWithImpl;
@useResult
$Res call({
 bool keyValid, DateTime? lastValidation
});




}
/// @nodoc
class _$ProviderValidityCopyWithImpl<$Res>
    implements $ProviderValidityCopyWith<$Res> {
  _$ProviderValidityCopyWithImpl(this._self, this._then);

  final ProviderValidity _self;
  final $Res Function(ProviderValidity) _then;

/// Create a copy of ProviderValidity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyValid = null,Object? lastValidation = freezed,}) {
  return _then(_self.copyWith(
keyValid: null == keyValid ? _self.keyValid : keyValid // ignore: cast_nullable_to_non_nullable
as bool,lastValidation: freezed == lastValidation ? _self.lastValidation : lastValidation // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderValidity].
extension ProviderValidityPatterns on ProviderValidity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderValidity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderValidity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderValidity value)  $default,){
final _that = this;
switch (_that) {
case _ProviderValidity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderValidity value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderValidity() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool keyValid,  DateTime? lastValidation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderValidity() when $default != null:
return $default(_that.keyValid,_that.lastValidation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool keyValid,  DateTime? lastValidation)  $default,) {final _that = this;
switch (_that) {
case _ProviderValidity():
return $default(_that.keyValid,_that.lastValidation);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool keyValid,  DateTime? lastValidation)?  $default,) {final _that = this;
switch (_that) {
case _ProviderValidity() when $default != null:
return $default(_that.keyValid,_that.lastValidation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderValidity implements ProviderValidity {
  const _ProviderValidity({required this.keyValid, this.lastValidation});
  factory _ProviderValidity.fromJson(Map<String, dynamic> json) => _$ProviderValidityFromJson(json);

@override final  bool keyValid;
@override final  DateTime? lastValidation;

/// Create a copy of ProviderValidity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderValidityCopyWith<_ProviderValidity> get copyWith => __$ProviderValidityCopyWithImpl<_ProviderValidity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderValidityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderValidity&&(identical(other.keyValid, keyValid) || other.keyValid == keyValid)&&(identical(other.lastValidation, lastValidation) || other.lastValidation == lastValidation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,keyValid,lastValidation);

@override
String toString() {
  return 'ProviderValidity(keyValid: $keyValid, lastValidation: $lastValidation)';
}


}

/// @nodoc
abstract mixin class _$ProviderValidityCopyWith<$Res> implements $ProviderValidityCopyWith<$Res> {
  factory _$ProviderValidityCopyWith(_ProviderValidity value, $Res Function(_ProviderValidity) _then) = __$ProviderValidityCopyWithImpl;
@override @useResult
$Res call({
 bool keyValid, DateTime? lastValidation
});




}
/// @nodoc
class __$ProviderValidityCopyWithImpl<$Res>
    implements _$ProviderValidityCopyWith<$Res> {
  __$ProviderValidityCopyWithImpl(this._self, this._then);

  final _ProviderValidity _self;
  final $Res Function(_ProviderValidity) _then;

/// Create a copy of ProviderValidity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyValid = null,Object? lastValidation = freezed,}) {
  return _then(_ProviderValidity(
keyValid: null == keyValid ? _self.keyValid : keyValid // ignore: cast_nullable_to_non_nullable
as bool,lastValidation: freezed == lastValidation ? _self.lastValidation : lastValidation // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ProviderProfile {

/// Stable profile id (a user may hold several profiles per provider).
 String get id;/// The provider this profile targets (frozen vocabulary).
@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId get provider;@JsonKey(fromJson: _modeFromJson, toJson: _modeToJson) ProviderMode get mode;/// Service endpoint — data only; never dialled by this package.
 String? get endpoint;/// Opaque reference into OS secure storage; never resolved here.
 String? get keyRef;/// Capability classes this profile serves (frozen vocabulary).
@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> get capabilities;/// Ordered model preference list (§10 `models[tier]` — order
/// expresses tier preference).
 List<String> get models;/// Quota snapshot; null = unmetered.
 ProviderQuota? get quota;/// Health snapshot. A fresh profile starts routable (§10: probes
/// adjust it continuously).
 ProviderHealth get health;/// Key-validity snapshot; null = never validated.
 ProviderValidity? get validity; Map<String, Object?> get metadata;
/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderProfileCopyWith<ProviderProfile> get copyWith => _$ProviderProfileCopyWithImpl<ProviderProfile>(this as ProviderProfile, _$identity);

  /// Serializes this ProviderProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.keyRef, keyRef) || other.keyRef == keyRef)&&const DeepCollectionEquality().equals(other.capabilities, capabilities)&&const DeepCollectionEquality().equals(other.models, models)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.health, health) || other.health == health)&&(identical(other.validity, validity) || other.validity == validity)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provider,mode,endpoint,keyRef,const DeepCollectionEquality().hash(capabilities),const DeepCollectionEquality().hash(models),quota,health,validity,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ProviderProfile(id: $id, provider: $provider, mode: $mode, endpoint: $endpoint, keyRef: $keyRef, capabilities: $capabilities, models: $models, quota: $quota, health: $health, validity: $validity, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProviderProfileCopyWith<$Res>  {
  factory $ProviderProfileCopyWith(ProviderProfile value, $Res Function(ProviderProfile) _then) = _$ProviderProfileCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider,@JsonKey(fromJson: _modeFromJson, toJson: _modeToJson) ProviderMode mode, String? endpoint, String? keyRef,@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> capabilities, List<String> models, ProviderQuota? quota, ProviderHealth health, ProviderValidity? validity, Map<String, Object?> metadata
});


$ProviderQuotaCopyWith<$Res>? get quota;$ProviderHealthCopyWith<$Res> get health;$ProviderValidityCopyWith<$Res>? get validity;

}
/// @nodoc
class _$ProviderProfileCopyWithImpl<$Res>
    implements $ProviderProfileCopyWith<$Res> {
  _$ProviderProfileCopyWithImpl(this._self, this._then);

  final ProviderProfile _self;
  final $Res Function(ProviderProfile) _then;

/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? provider = null,Object? mode = null,Object? endpoint = freezed,Object? keyRef = freezed,Object? capabilities = null,Object? models = null,Object? quota = freezed,Object? health = null,Object? validity = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ProviderMode,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,keyRef: freezed == keyRef ? _self.keyRef : keyRef // ignore: cast_nullable_to_non_nullable
as String?,capabilities: null == capabilities ? _self.capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as Set<AiCapability>,models: null == models ? _self.models : models // ignore: cast_nullable_to_non_nullable
as List<String>,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as ProviderQuota?,health: null == health ? _self.health : health // ignore: cast_nullable_to_non_nullable
as ProviderHealth,validity: freezed == validity ? _self.validity : validity // ignore: cast_nullable_to_non_nullable
as ProviderValidity?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}
/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderQuotaCopyWith<$Res>? get quota {
    if (_self.quota == null) {
    return null;
  }

  return $ProviderQuotaCopyWith<$Res>(_self.quota!, (value) {
    return _then(_self.copyWith(quota: value));
  });
}/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderHealthCopyWith<$Res> get health {
  
  return $ProviderHealthCopyWith<$Res>(_self.health, (value) {
    return _then(_self.copyWith(health: value));
  });
}/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderValidityCopyWith<$Res>? get validity {
    if (_self.validity == null) {
    return null;
  }

  return $ProviderValidityCopyWith<$Res>(_self.validity!, (value) {
    return _then(_self.copyWith(validity: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProviderProfile].
extension ProviderProfilePatterns on ProviderProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderProfile() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderProfile value)  $default,){
final _that = this;
switch (_that) {
case _ProviderProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderProfile value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderProfile() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider, @JsonKey(fromJson: _modeFromJson, toJson: _modeToJson)  ProviderMode mode,  String? endpoint,  String? keyRef, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)  Set<AiCapability> capabilities,  List<String> models,  ProviderQuota? quota,  ProviderHealth health,  ProviderValidity? validity,  Map<String, Object?> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderProfile() when $default != null:
return $default(_that.id,_that.provider,_that.mode,_that.endpoint,_that.keyRef,_that.capabilities,_that.models,_that.quota,_that.health,_that.validity,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider, @JsonKey(fromJson: _modeFromJson, toJson: _modeToJson)  ProviderMode mode,  String? endpoint,  String? keyRef, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)  Set<AiCapability> capabilities,  List<String> models,  ProviderQuota? quota,  ProviderHealth health,  ProviderValidity? validity,  Map<String, Object?> metadata)  $default,) {final _that = this;
switch (_that) {
case _ProviderProfile():
return $default(_that.id,_that.provider,_that.mode,_that.endpoint,_that.keyRef,_that.capabilities,_that.models,_that.quota,_that.health,_that.validity,_that.metadata);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson)  AiProviderId provider, @JsonKey(fromJson: _modeFromJson, toJson: _modeToJson)  ProviderMode mode,  String? endpoint,  String? keyRef, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson)  Set<AiCapability> capabilities,  List<String> models,  ProviderQuota? quota,  ProviderHealth health,  ProviderValidity? validity,  Map<String, Object?> metadata)?  $default,) {final _that = this;
switch (_that) {
case _ProviderProfile() when $default != null:
return $default(_that.id,_that.provider,_that.mode,_that.endpoint,_that.keyRef,_that.capabilities,_that.models,_that.quota,_that.health,_that.validity,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderProfile extends ProviderProfile {
  const _ProviderProfile({required this.id, @JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) required this.provider, @JsonKey(fromJson: _modeFromJson, toJson: _modeToJson) required this.mode, this.endpoint, this.keyRef, @JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) final  Set<AiCapability> capabilities = const <AiCapability>{}, final  List<String> models = const <String>[], this.quota, this.health = const ProviderHealth(status: HealthStatus.healthy), this.validity, final  Map<String, Object?> metadata = const <String, Object?>{}}): _capabilities = capabilities,_models = models,_metadata = metadata,super._();
  factory _ProviderProfile.fromJson(Map<String, dynamic> json) => _$ProviderProfileFromJson(json);

/// Stable profile id (a user may hold several profiles per provider).
@override final  String id;
/// The provider this profile targets (frozen vocabulary).
@override@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) final  AiProviderId provider;
@override@JsonKey(fromJson: _modeFromJson, toJson: _modeToJson) final  ProviderMode mode;
/// Service endpoint — data only; never dialled by this package.
@override final  String? endpoint;
/// Opaque reference into OS secure storage; never resolved here.
@override final  String? keyRef;
/// Capability classes this profile serves (frozen vocabulary).
 final  Set<AiCapability> _capabilities;
/// Capability classes this profile serves (frozen vocabulary).
@override@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> get capabilities {
  if (_capabilities is EqualUnmodifiableSetView) return _capabilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_capabilities);
}

/// Ordered model preference list (§10 `models[tier]` — order
/// expresses tier preference).
 final  List<String> _models;
/// Ordered model preference list (§10 `models[tier]` — order
/// expresses tier preference).
@override@JsonKey() List<String> get models {
  if (_models is EqualUnmodifiableListView) return _models;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_models);
}

/// Quota snapshot; null = unmetered.
@override final  ProviderQuota? quota;
/// Health snapshot. A fresh profile starts routable (§10: probes
/// adjust it continuously).
@override@JsonKey() final  ProviderHealth health;
/// Key-validity snapshot; null = never validated.
@override final  ProviderValidity? validity;
 final  Map<String, Object?> _metadata;
@override@JsonKey() Map<String, Object?> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderProfileCopyWith<_ProviderProfile> get copyWith => __$ProviderProfileCopyWithImpl<_ProviderProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.endpoint, endpoint) || other.endpoint == endpoint)&&(identical(other.keyRef, keyRef) || other.keyRef == keyRef)&&const DeepCollectionEquality().equals(other._capabilities, _capabilities)&&const DeepCollectionEquality().equals(other._models, _models)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.health, health) || other.health == health)&&(identical(other.validity, validity) || other.validity == validity)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provider,mode,endpoint,keyRef,const DeepCollectionEquality().hash(_capabilities),const DeepCollectionEquality().hash(_models),quota,health,validity,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ProviderProfile(id: $id, provider: $provider, mode: $mode, endpoint: $endpoint, keyRef: $keyRef, capabilities: $capabilities, models: $models, quota: $quota, health: $health, validity: $validity, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProviderProfileCopyWith<$Res> implements $ProviderProfileCopyWith<$Res> {
  factory _$ProviderProfileCopyWith(_ProviderProfile value, $Res Function(_ProviderProfile) _then) = __$ProviderProfileCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(fromJson: _providerFromJson, toJson: _providerToJson) AiProviderId provider,@JsonKey(fromJson: _modeFromJson, toJson: _modeToJson) ProviderMode mode, String? endpoint, String? keyRef,@JsonKey(fromJson: _capabilitiesFromJson, toJson: _capabilitiesToJson) Set<AiCapability> capabilities, List<String> models, ProviderQuota? quota, ProviderHealth health, ProviderValidity? validity, Map<String, Object?> metadata
});


@override $ProviderQuotaCopyWith<$Res>? get quota;@override $ProviderHealthCopyWith<$Res> get health;@override $ProviderValidityCopyWith<$Res>? get validity;

}
/// @nodoc
class __$ProviderProfileCopyWithImpl<$Res>
    implements _$ProviderProfileCopyWith<$Res> {
  __$ProviderProfileCopyWithImpl(this._self, this._then);

  final _ProviderProfile _self;
  final $Res Function(_ProviderProfile) _then;

/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? provider = null,Object? mode = null,Object? endpoint = freezed,Object? keyRef = freezed,Object? capabilities = null,Object? models = null,Object? quota = freezed,Object? health = null,Object? validity = freezed,Object? metadata = null,}) {
  return _then(_ProviderProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderId,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ProviderMode,endpoint: freezed == endpoint ? _self.endpoint : endpoint // ignore: cast_nullable_to_non_nullable
as String?,keyRef: freezed == keyRef ? _self.keyRef : keyRef // ignore: cast_nullable_to_non_nullable
as String?,capabilities: null == capabilities ? _self._capabilities : capabilities // ignore: cast_nullable_to_non_nullable
as Set<AiCapability>,models: null == models ? _self._models : models // ignore: cast_nullable_to_non_nullable
as List<String>,quota: freezed == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as ProviderQuota?,health: null == health ? _self.health : health // ignore: cast_nullable_to_non_nullable
as ProviderHealth,validity: freezed == validity ? _self.validity : validity // ignore: cast_nullable_to_non_nullable
as ProviderValidity?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderQuotaCopyWith<$Res>? get quota {
    if (_self.quota == null) {
    return null;
  }

  return $ProviderQuotaCopyWith<$Res>(_self.quota!, (value) {
    return _then(_self.copyWith(quota: value));
  });
}/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderHealthCopyWith<$Res> get health {
  
  return $ProviderHealthCopyWith<$Res>(_self.health, (value) {
    return _then(_self.copyWith(health: value));
  });
}/// Create a copy of ProviderProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderValidityCopyWith<$Res>? get validity {
    if (_self.validity == null) {
    return null;
  }

  return $ProviderValidityCopyWith<$Res>(_self.validity!, (value) {
    return _then(_self.copyWith(validity: value));
  });
}
}

// dart format on
