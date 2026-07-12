// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SemVer _$SemVerFromJson(Map<String, dynamic> json) => _SemVer(
  major: (json['major'] as num).toInt(),
  minor: (json['minor'] as num).toInt(),
  patch: (json['patch'] as num).toInt(),
);

Map<String, dynamic> _$SemVerToJson(_SemVer instance) => <String, dynamic>{
  'major': instance.major,
  'minor': instance.minor,
  'patch': instance.patch,
};

_PluginManifest _$PluginManifestFromJson(Map<String, dynamic> json) =>
    _PluginManifest(
      id: json['id'] as String,
      name: json['name'] as String,
      version: SemVer.fromJson(json['version'] as Map<String, dynamic>),
      apiVersion: (json['apiVersion'] as num).toInt(),
      minHostVersion: SemVer.fromJson(
        json['minHostVersion'] as Map<String, dynamic>,
      ),
      permissions:
          (json['permissions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$PluginPermissionEnumMap, e))
              .toList() ??
          const <PluginPermission>[],
      sandbox:
          $enumDecodeNullable(_$PluginSandboxEnumMap, json['sandbox']) ??
          PluginSandbox.isolateSandbox,
      events:
          (json['events'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$PluginEventKindEnumMap, e))
              .toList() ??
          const <PluginEventKind>[],
      description: json['description'] as String?,
      author: json['author'] as String?,
      homepage: json['homepage'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$PluginManifestToJson(
  _PluginManifest instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'version': instance.version.toJson(),
  'apiVersion': instance.apiVersion,
  'minHostVersion': instance.minHostVersion.toJson(),
  'permissions': instance.permissions
      .map((e) => _$PluginPermissionEnumMap[e]!)
      .toList(),
  'sandbox': _$PluginSandboxEnumMap[instance.sandbox]!,
  'events': instance.events.map((e) => _$PluginEventKindEnumMap[e]!).toList(),
  'description': instance.description,
  'author': instance.author,
  'homepage': instance.homepage,
  'category': instance.category,
};

const _$PluginPermissionEnumMap = {
  PluginPermission.readDocument: 'readDocument',
  PluginPermission.mutateDocument: 'mutateDocument',
  PluginPermission.readSelection: 'readSelection',
  PluginPermission.useAiCredits: 'useAiCredits',
  PluginPermission.network: 'network',
  PluginPermission.storage: 'storage',
  PluginPermission.workspaceUi: 'workspaceUi',
};

const _$PluginSandboxEnumMap = {
  PluginSandbox.isolateSandbox: 'isolateSandbox',
  PluginSandbox.processSandbox: 'processSandbox',
};

const _$PluginEventKindEnumMap = {
  PluginEventKind.documentOpened: 'documentOpened',
  PluginEventKind.documentSaved: 'documentSaved',
  PluginEventKind.selectionChanged: 'selectionChanged',
  PluginEventKind.toolActivated: 'toolActivated',
  PluginEventKind.aiProposalStaged: 'aiProposalStaged',
  PluginEventKind.themeChanged: 'themeChanged',
};

_PluginCommand _$PluginCommandFromJson(Map<String, dynamic> json) =>
    _PluginCommand(
      commandId: json['commandId'] as String,
      title: json['title'] as String,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$PluginCommandToJson(_PluginCommand instance) =>
    <String, dynamic>{
      'commandId': instance.commandId,
      'title': instance.title,
      'category': instance.category,
    };
