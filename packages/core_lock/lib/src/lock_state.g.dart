// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lock_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LockState _$LockStateFromJson(Map<String, dynamic> json) => _LockState(
  scope: $enumDecode(_$LockScopeEnumMap, json['scope']),
  targetId: json['targetId'] as String?,
  origin:
      $enumDecodeNullable(_$LockOriginEnumMap, json['origin']) ??
      LockOrigin.user,
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$LockStateToJson(_LockState instance) =>
    <String, dynamic>{
      'scope': _$LockScopeEnumMap[instance.scope]!,
      'targetId': instance.targetId,
      'origin': _$LockOriginEnumMap[instance.origin]!,
      'reason': instance.reason,
    };

const _$LockScopeEnumMap = {
  LockScope.project: 'project',
  LockScope.document: 'document',
  LockScope.layer: 'layer',
  LockScope.object: 'object',
  LockScope.selection: 'selection',
  LockScope.reference: 'reference',
  LockScope.mask: 'mask',
  LockScope.tool: 'tool',
  LockScope.viewport: 'viewport',
  LockScope.history: 'history',
  LockScope.undo: 'undo',
  LockScope.ai: 'ai',
  LockScope.export: 'export',
  LockScope.production: 'production',
  LockScope.review: 'review',
  LockScope.approval: 'approval',
};

const _$LockOriginEnumMap = {
  LockOrigin.user: 'user',
  LockOrigin.system: 'system',
  LockOrigin.policy: 'policy',
  LockOrigin.review: 'review',
};

_LockSet _$LockSetFromJson(Map<String, dynamic> json) => _LockSet(
  locks:
      (json['locks'] as List<dynamic>?)
          ?.map((e) => LockState.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LockState>[],
);

Map<String, dynamic> _$LockSetToJson(_LockSet instance) => <String, dynamic>{
  'locks': instance.locks.map((e) => e.toJson()).toList(),
};

_LockDecision _$LockDecisionFromJson(Map<String, dynamic> json) =>
    _LockDecision(
      allowed: json['allowed'] as bool,
      blockedBy: json['blockedBy'] == null
          ? null
          : LockState.fromJson(json['blockedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LockDecisionToJson(_LockDecision instance) =>
    <String, dynamic>{
      'allowed': instance.allowed,
      'blockedBy': instance.blockedBy?.toJson(),
    };
