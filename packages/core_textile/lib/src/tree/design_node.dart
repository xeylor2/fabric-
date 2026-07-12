import 'package:core_textile/src/tree/design_node_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_node.freezed.dart';
part 'design_node.g.dart';

/// The immutable Design Tree node of the FEBRIC Operating System.
///
/// This is the *domain shape* every engine shares — the document engine
/// (M2) adds commands, undo and addressing on top of it; nothing here
/// mutates. All mutation in FEBRIC happens by building a new tree via
/// [copyWith] under the command bus (constitutional invariant I1).
///
/// Serialization notes:
/// - [type] round-trips through its stable `wireName`.
/// - [metadata] is an open string-keyed map for milestone-specific payloads
///   (transforms, repeat specs, provenance) until those gain typed models —
///   it must never carry information that belongs in a frozen enum.
@freezed
abstract class DesignNode with _$DesignNode {
  const factory DesignNode({
    /// Stable unique identifier (assigned by the document engine).
    required String id,

    /// Human-readable name shown in the Design Tree panel. Renamable.
    required String name,

    /// The node's frozen vocabulary type.
    @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
    required DesignNodeType type,

    /// Ordered children; order IS z-order within a zone (Architecture V2 §4).
    @Default(<DesignNode>[]) List<DesignNode> children,

    /// Open metadata for milestone-specific payloads.
    @Default(<String, Object?>{}) Map<String, Object?> metadata,

    /// Hidden nodes render nowhere but keep their place in the tree.
    @Default(true) bool visible,

    /// Locked nodes reject every mutation, human or AI (invariant I4).
    @Default(false) bool locked,

    /// Selection state (session-scoped; persisted for workspace restore).
    @Default(false) bool selected,
  }) = _DesignNode;

  factory DesignNode.fromJson(Map<String, Object?> json) =>
      _$DesignNodeFromJson(json);

  const DesignNode._();

  /// Depth-first traversal of this node and all descendants.
  Iterable<DesignNode> get descendantsAndSelf sync* {
    yield this;
    for (final child in children) {
      yield* child.descendantsAndSelf;
    }
  }

  /// Total node count of this subtree.
  int get subtreeSize => descendantsAndSelf.length;

  /// Finds the first descendant (or self) with [id], or null.
  DesignNode? findById(String id) {
    for (final node in descendantsAndSelf) {
      if (node.id == id) {
        return node;
      }
    }
    return null;
  }
}

DesignNodeType _typeFromJson(String wireName) =>
    DesignNodeType.fromWireName(wireName);

String _typeToJson(DesignNodeType type) => type.wireName;
