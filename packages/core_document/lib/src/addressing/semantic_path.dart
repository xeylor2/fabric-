import 'package:core_textile/core_textile.dart';
import 'package:meta/meta.dart';

/// One segment of a semantic path: a matcher token, an optional
/// `[qualifier]` and an optional `@role` selector.
@immutable
final class SemanticSegment {
  const SemanticSegment({required this.token, this.qualifier, this.role});

  /// Matcher token: `*` (any node) or an identifier matched against the
  /// node's slugged name, its `part`/`garment_type` metadata wire names,
  /// or its [DesignNodeType.wireName].
  final String token;

  /// Instance qualifier from `[...]` — matched against `instance`
  /// metadata (e.g. `sleeve[left]`).
  final String? qualifier;

  /// Role selector from `@...` — matched against `role` metadata
  /// (e.g. `field@hero-motif`).
  final String? role;

  bool get isWildcard => token == '*';

  @override
  bool operator ==(Object other) =>
      other is SemanticSegment &&
      other.token == token &&
      other.qualifier == qualifier &&
      other.role == role;

  @override
  int get hashCode => Object.hash(token, qualifier, role);

  @override
  String toString() =>
      '$token${qualifier == null ? '' : '[$qualifier]'}'
      '${role == null ? '' : '@$role'}';
}

/// The semantic addressing engine of the Design Tree (Architecture V2
/// §4.3; ADR-0015) — the shared language used by the Conversation AI's
/// target resolution and every future tool:
///
/// ```
/// artwork.kurta.sleeve[left].border
/// artwork.dupatta.pallu[top]
/// artwork.kurta.field@hero-motif
/// artwork.kurta.*.border
/// ```
@immutable
final class SemanticPath {
  const SemanticPath(this.segments);

  final List<SemanticSegment> segments;

  static final RegExp _segmentPattern = RegExp(
    r'^(\*|[a-z0-9][a-z0-9_-]*)(?:\[([a-z0-9_-]+)\])?(?:@([a-z0-9_-]+))?$',
  );

  /// Parses a dotted semantic path; throws [FormatException] on invalid
  /// syntax (corrupt addresses fail loudly, never silently mis-resolve).
  factory SemanticPath.parse(String text) {
    final raw = text.trim();
    if (raw.isEmpty) {
      throw const FormatException('Semantic path cannot be empty');
    }
    final segments = <SemanticSegment>[];
    for (final part in raw.split('.')) {
      final match = _segmentPattern.firstMatch(part.trim().toLowerCase());
      if (match == null) {
        throw FormatException('Invalid semantic path segment', part);
      }
      segments.add(
        SemanticSegment(
          token: match.group(1)!,
          qualifier: match.group(2),
          role: match.group(3),
        ),
      );
    }
    return SemanticPath(segments);
  }

  /// Resolves this path against [root], returning every matching node
  /// (deterministic document order). The first segment matches the root
  /// itself; each further segment matches children of the previous
  /// matches.
  List<DesignNode> resolve(DesignNode root) {
    var current = _matches(root, segments.first)
        ? <DesignNode>[root]
        : const <DesignNode>[];
    for (final segment in segments.skip(1)) {
      final next = <DesignNode>[];
      for (final node in current) {
        for (final child in node.children) {
          if (_matches(child, segment)) {
            next.add(child);
          }
        }
      }
      current = next;
    }
    return current;
  }

  static bool _matches(DesignNode node, SemanticSegment segment) {
    if (!segment.isWildcard) {
      final slug = node.name.trim().toLowerCase().replaceAll(
        RegExp(r'\s+'),
        '_',
      );
      final part = node.metadata['part'];
      final garment = node.metadata['garment_type'];
      final tokenMatches =
          segment.token == slug ||
          segment.token == part ||
          segment.token == garment ||
          segment.token == node.type.wireName;
      if (!tokenMatches) {
        return false;
      }
    }
    if (segment.qualifier != null &&
        node.metadata['instance'] != segment.qualifier) {
      return false;
    }
    if (segment.role != null && node.metadata['role'] != segment.role) {
      return false;
    }
    return true;
  }

  @override
  bool operator ==(Object other) {
    if (other is! SemanticPath || other.segments.length != segments.length) {
      return false;
    }
    for (var i = 0; i < segments.length; i++) {
      if (segments[i] != other.segments[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode => Object.hashAll(segments);

  @override
  String toString() => segments.join('.');
}
