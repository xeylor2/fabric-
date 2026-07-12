// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateArtboardCommand _$CreateArtboardCommandFromJson(
  Map<String, dynamic> json,
) => CreateArtboardCommand(
  artboard: Artboard.fromJson(json['artboard'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CreateArtboardCommandToJson(
  CreateArtboardCommand instance,
) => <String, dynamic>{
  'artboard': instance.artboard.toJson(),
  'runtimeType': instance.$type,
};

DeleteArtboardCommand _$DeleteArtboardCommandFromJson(
  Map<String, dynamic> json,
) => DeleteArtboardCommand(
  artboardId: json['artboardId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DeleteArtboardCommandToJson(
  DeleteArtboardCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'runtimeType': instance.$type,
};

CreateLayerCommand _$CreateLayerCommandFromJson(Map<String, dynamic> json) =>
    CreateLayerCommand(
      artboardId: json['artboardId'] as String,
      parentLayerId: json['parentLayerId'] as String?,
      layer: LayerModel.fromJson(json['layer'] as Map<String, dynamic>),
      index: (json['index'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CreateLayerCommandToJson(CreateLayerCommand instance) =>
    <String, dynamic>{
      'artboardId': instance.artboardId,
      'parentLayerId': instance.parentLayerId,
      'layer': instance.layer.toJson(),
      'index': instance.index,
      'runtimeType': instance.$type,
    };

DeleteLayerCommand _$DeleteLayerCommandFromJson(Map<String, dynamic> json) =>
    DeleteLayerCommand(
      artboardId: json['artboardId'] as String,
      layerId: json['layerId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DeleteLayerCommandToJson(DeleteLayerCommand instance) =>
    <String, dynamic>{
      'artboardId': instance.artboardId,
      'layerId': instance.layerId,
      'runtimeType': instance.$type,
    };

MoveLayerCommand _$MoveLayerCommandFromJson(Map<String, dynamic> json) =>
    MoveLayerCommand(
      artboardId: json['artboardId'] as String,
      layerId: json['layerId'] as String,
      newParentId: json['newParentId'] as String,
      index: (json['index'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MoveLayerCommandToJson(MoveLayerCommand instance) =>
    <String, dynamic>{
      'artboardId': instance.artboardId,
      'layerId': instance.layerId,
      'newParentId': instance.newParentId,
      'index': instance.index,
      'runtimeType': instance.$type,
    };

RenameLayerCommand _$RenameLayerCommandFromJson(Map<String, dynamic> json) =>
    RenameLayerCommand(
      artboardId: json['artboardId'] as String,
      layerId: json['layerId'] as String,
      name: json['name'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RenameLayerCommandToJson(RenameLayerCommand instance) =>
    <String, dynamic>{
      'artboardId': instance.artboardId,
      'layerId': instance.layerId,
      'name': instance.name,
      'runtimeType': instance.$type,
    };

SetLayerMetadataCommand _$SetLayerMetadataCommandFromJson(
  Map<String, dynamic> json,
) => SetLayerMetadataCommand(
  artboardId: json['artboardId'] as String,
  layerId: json['layerId'] as String,
  key: json['key'] as String,
  value: json['value'],
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SetLayerMetadataCommandToJson(
  SetLayerMetadataCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'layerId': instance.layerId,
  'key': instance.key,
  'value': instance.value,
  'runtimeType': instance.$type,
};

ImportAssetCommand _$ImportAssetCommandFromJson(Map<String, dynamic> json) =>
    ImportAssetCommand(
      asset: AssetRecord.fromJson(json['asset'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ImportAssetCommandToJson(ImportAssetCommand instance) =>
    <String, dynamic>{
      'asset': instance.asset.toJson(),
      'runtimeType': instance.$type,
    };

RemoveAssetCommand _$RemoveAssetCommandFromJson(Map<String, dynamic> json) =>
    RemoveAssetCommand(
      assetId: json['assetId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RemoveAssetCommandToJson(RemoveAssetCommand instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'runtimeType': instance.$type,
    };

ApplyMaskCommand _$ApplyMaskCommandFromJson(Map<String, dynamic> json) =>
    ApplyMaskCommand(
      targetId: json['targetId'] as String,
      stack: MaskStack.fromJson(json['stack'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ApplyMaskCommandToJson(ApplyMaskCommand instance) =>
    <String, dynamic>{
      'targetId': instance.targetId,
      'stack': instance.stack.toJson(),
      'runtimeType': instance.$type,
    };

RemoveMaskCommand _$RemoveMaskCommandFromJson(Map<String, dynamic> json) =>
    RemoveMaskCommand(
      targetId: json['targetId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RemoveMaskCommandToJson(RemoveMaskCommand instance) =>
    <String, dynamic>{
      'targetId': instance.targetId,
      'runtimeType': instance.$type,
    };

UpdateMetadataCommand _$UpdateMetadataCommandFromJson(
  Map<String, dynamic> json,
) => UpdateMetadataCommand(
  metadata: DocumentMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateMetadataCommandToJson(
  UpdateMetadataCommand instance,
) => <String, dynamic>{
  'metadata': instance.metadata.toJson(),
  'runtimeType': instance.$type,
};

UpdateSettingsCommand _$UpdateSettingsCommandFromJson(
  Map<String, dynamic> json,
) => UpdateSettingsCommand(
  settings: DocumentSettings.fromJson(json['settings'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateSettingsCommandToJson(
  UpdateSettingsCommand instance,
) => <String, dynamic>{
  'settings': instance.settings.toJson(),
  'runtimeType': instance.$type,
};

UpdateToolStateCommand _$UpdateToolStateCommandFromJson(
  Map<String, dynamic> json,
) => UpdateToolStateCommand(
  state: ToolStateExtension.fromJson(json['state'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateToolStateCommandToJson(
  UpdateToolStateCommand instance,
) => <String, dynamic>{
  'state': instance.state.toJson(),
  'runtimeType': instance.$type,
};

UpdateViewportCommand _$UpdateViewportCommandFromJson(
  Map<String, dynamic> json,
) => UpdateViewportCommand(
  viewport: WorkspaceViewportState.fromJson(
    json['viewport'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdateViewportCommandToJson(
  UpdateViewportCommand instance,
) => <String, dynamic>{
  'viewport': instance.viewport.toJson(),
  'runtimeType': instance.$type,
};

ChangeColourCommand _$ChangeColourCommandFromJson(Map<String, dynamic> json) =>
    ChangeColourCommand(
      artboardId: json['artboardId'] as String,
      layerId: json['layerId'] as String,
      operation: _colourOpFromJson(json['operation'] as String),
      colourHex: json['colourHex'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ChangeColourCommandToJson(
  ChangeColourCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'layerId': instance.layerId,
  'operation': _colourOpToJson(instance.operation),
  'colourHex': instance.colourHex,
  'runtimeType': instance.$type,
};

RepeatPatternCommand _$RepeatPatternCommandFromJson(
  Map<String, dynamic> json,
) => RepeatPatternCommand(
  artboardId: json['artboardId'] as String,
  layerId: json['layerId'] as String,
  repeat: _repeatFromJson(json['repeat'] as String),
  parameters:
      json['parameters'] as Map<String, dynamic>? ?? const <String, Object?>{},
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$RepeatPatternCommandToJson(
  RepeatPatternCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'layerId': instance.layerId,
  'repeat': _repeatToJson(instance.repeat),
  'parameters': instance.parameters,
  'runtimeType': instance.$type,
};

SetLockCommand _$SetLockCommandFromJson(Map<String, dynamic> json) =>
    SetLockCommand(
      lock: LockState.fromJson(json['lock'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SetLockCommandToJson(SetLockCommand instance) =>
    <String, dynamic>{
      'lock': instance.lock.toJson(),
      'runtimeType': instance.$type,
    };

ReleaseLockCommand _$ReleaseLockCommandFromJson(Map<String, dynamic> json) =>
    ReleaseLockCommand(
      scope: $enumDecode(_$LockScopeEnumMap, json['scope']),
      targetId: json['targetId'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ReleaseLockCommandToJson(ReleaseLockCommand instance) =>
    <String, dynamic>{
      'scope': _$LockScopeEnumMap[instance.scope]!,
      'targetId': instance.targetId,
      'runtimeType': instance.$type,
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

UpdatePluginDataCommand _$UpdatePluginDataCommandFromJson(
  Map<String, dynamic> json,
) => UpdatePluginDataCommand(
  pluginId: json['pluginId'] as String,
  data: json['data'] as Map<String, dynamic>,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UpdatePluginDataCommandToJson(
  UpdatePluginDataCommand instance,
) => <String, dynamic>{
  'pluginId': instance.pluginId,
  'data': instance.data,
  'runtimeType': instance.$type,
};

CustomCommand _$CustomCommandFromJson(Map<String, dynamic> json) =>
    CustomCommand(
      namespace: json['namespace'] as String,
      kind: json['kind'] as String,
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, Object?>{},
      affectedIds:
          (json['affectedIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CustomCommandToJson(CustomCommand instance) =>
    <String, dynamic>{
      'namespace': instance.namespace,
      'kind': instance.kind,
      'payload': instance.payload,
      'affectedIds': instance.affectedIds,
      'runtimeType': instance.$type,
    };

CreateDesignNodeCommand _$CreateDesignNodeCommandFromJson(
  Map<String, dynamic> json,
) => CreateDesignNodeCommand(
  artboardId: json['artboardId'] as String,
  parentNodeId: json['parentNodeId'] as String?,
  node: DesignNode.fromJson(json['node'] as Map<String, dynamic>),
  index: (json['index'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CreateDesignNodeCommandToJson(
  CreateDesignNodeCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'parentNodeId': instance.parentNodeId,
  'node': instance.node.toJson(),
  'index': instance.index,
  'runtimeType': instance.$type,
};

DeleteDesignNodeCommand _$DeleteDesignNodeCommandFromJson(
  Map<String, dynamic> json,
) => DeleteDesignNodeCommand(
  artboardId: json['artboardId'] as String,
  nodeId: json['nodeId'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DeleteDesignNodeCommandToJson(
  DeleteDesignNodeCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'nodeId': instance.nodeId,
  'runtimeType': instance.$type,
};

MoveDesignNodeCommand _$MoveDesignNodeCommandFromJson(
  Map<String, dynamic> json,
) => MoveDesignNodeCommand(
  artboardId: json['artboardId'] as String,
  nodeId: json['nodeId'] as String,
  newParentId: json['newParentId'] as String,
  index: (json['index'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MoveDesignNodeCommandToJson(
  MoveDesignNodeCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'nodeId': instance.nodeId,
  'newParentId': instance.newParentId,
  'index': instance.index,
  'runtimeType': instance.$type,
};

RenameDesignNodeCommand _$RenameDesignNodeCommandFromJson(
  Map<String, dynamic> json,
) => RenameDesignNodeCommand(
  artboardId: json['artboardId'] as String,
  nodeId: json['nodeId'] as String,
  name: json['name'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$RenameDesignNodeCommandToJson(
  RenameDesignNodeCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'nodeId': instance.nodeId,
  'name': instance.name,
  'runtimeType': instance.$type,
};

SetNodeVisibilityCommand _$SetNodeVisibilityCommandFromJson(
  Map<String, dynamic> json,
) => SetNodeVisibilityCommand(
  artboardId: json['artboardId'] as String,
  nodeId: json['nodeId'] as String,
  visible: json['visible'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SetNodeVisibilityCommandToJson(
  SetNodeVisibilityCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'nodeId': instance.nodeId,
  'visible': instance.visible,
  'runtimeType': instance.$type,
};

SetNodeLockedCommand _$SetNodeLockedCommandFromJson(
  Map<String, dynamic> json,
) => SetNodeLockedCommand(
  artboardId: json['artboardId'] as String,
  nodeId: json['nodeId'] as String,
  locked: json['locked'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SetNodeLockedCommandToJson(
  SetNodeLockedCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'nodeId': instance.nodeId,
  'locked': instance.locked,
  'runtimeType': instance.$type,
};

SetNodeMetadataCommand _$SetNodeMetadataCommandFromJson(
  Map<String, dynamic> json,
) => SetNodeMetadataCommand(
  artboardId: json['artboardId'] as String,
  nodeId: json['nodeId'] as String,
  key: json['key'] as String,
  value: json['value'],
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SetNodeMetadataCommandToJson(
  SetNodeMetadataCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'nodeId': instance.nodeId,
  'key': instance.key,
  'value': instance.value,
  'runtimeType': instance.$type,
};

DuplicateDesignNodeCommand _$DuplicateDesignNodeCommandFromJson(
  Map<String, dynamic> json,
) => DuplicateDesignNodeCommand(
  artboardId: json['artboardId'] as String,
  sourceNodeId: json['sourceNodeId'] as String,
  duplicate: DesignNode.fromJson(json['duplicate'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$DuplicateDesignNodeCommandToJson(
  DuplicateDesignNodeCommand instance,
) => <String, dynamic>{
  'artboardId': instance.artboardId,
  'sourceNodeId': instance.sourceNodeId,
  'duplicate': instance.duplicate.toJson(),
  'runtimeType': instance.$type,
};
