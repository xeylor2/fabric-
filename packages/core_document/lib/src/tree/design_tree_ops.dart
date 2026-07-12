import 'package:core_common/core_common.dart';
import 'package:core_textile/core_textile.dart';

/// Pure structural operations over the frozen [DesignNode] vocabulary
/// (ADR-0015). The reducer composes these; nothing here touches locks,
/// history or ids beyond the injected [IdGenerator].
abstract final class DesignTreeOps {
  /// Rewrites the subtree rooted at [id] with [transform]; a null result
  /// removes the subtree. Untouched siblings are shared, not copied.
  static DesignNode? rewrite(
    DesignNode node,
    String id,
    DesignNode? Function(DesignNode) transform,
  ) {
    if (node.id == id) {
      return transform(node);
    }
    var changed = false;
    final children = <DesignNode>[];
    for (final child in node.children) {
      final result = rewrite(child, id, transform);
      if (!identical(result, child)) {
        changed = true;
      }
      if (result != null) {
        children.add(result);
      }
    }
    return changed ? node.copyWith(children: children) : node;
  }

  /// Locates [nodeId]'s parent and sibling index, or null at/below root.
  static ({String parentId, int index})? locate(
    DesignNode root,
    String nodeId,
  ) {
    for (final node in root.descendantsAndSelf) {
      for (var i = 0; i < node.children.length; i++) {
        if (node.children[i].id == nodeId) {
          return (parentId: node.id, index: i);
        }
      }
    }
    return null;
  }

  /// Deep-copies [node] with fresh ids from [ids] (duplicate semantics:
  /// same content, new identity, selection cleared).
  static DesignNode cloneWithIds(DesignNode node, IdGenerator ids) {
    return node.copyWith(
      id: ids.next(),
      selected: false,
      children: [for (final child in node.children) cloneWithIds(child, ids)],
    );
  }
}
