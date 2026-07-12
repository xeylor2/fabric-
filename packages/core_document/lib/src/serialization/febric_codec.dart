import 'dart:convert';

import 'package:core_document/src/model/document_metadata.dart';
import 'package:core_document/src/model/febric_document.dart';

/// A single schema migration step: rewrites raw `.febric` JSON from
/// [fromSchema] to `fromSchema + 1`. Migrations run stepwise so any old
/// document reaches the current schema (ADR-0014 migration strategy).
abstract interface class FebricMigration {
  int get fromSchema;

  Map<String, Object?> migrate(Map<String, Object?> json);
}

/// Raised when a `.febric` payload cannot be read.
final class FebricFormatException implements Exception {
  const FebricFormatException(this.message);

  final String message;

  @override
  String toString() => 'FebricFormatException: $message';
}

/// The frozen `.febric` codec: versioned JSON today, binary packaging
/// later (the manifest gate is the forward-compatibility seam).
final class FebricCodec {
  const FebricCodec({this.migrations = const []});

  /// Registered migration steps, applied stepwise by [decode].
  final List<FebricMigration> migrations;

  /// Encodes [document] as pretty JSON with its manifest at the head.
  String encode(FebricDocument document) {
    return const JsonEncoder.withIndent('  ').convert(document.toJson());
  }

  /// Decodes (and migrates, when necessary) a `.febric` JSON payload.
  ///
  /// Throws [FebricFormatException] when the payload is not a FEBRIC
  /// document, or was written by a NEWER schema than this engine reads
  /// (forward compatibility: refuse loudly rather than corrupt silently).
  FebricDocument decode(String source) {
    final Object? raw;
    try {
      raw = jsonDecode(source);
    } on FormatException catch (e) {
      throw FebricFormatException('Not valid JSON: ${e.message}');
    }
    if (raw is! Map<String, Object?>) {
      throw const FebricFormatException('Root must be a JSON object');
    }
    final manifest = raw['manifest'];
    if (manifest is! Map<String, Object?> ||
        manifest['format'] != DocumentManifest.formatName) {
      throw const FebricFormatException('Missing or foreign manifest');
    }
    final version = manifest['version'];
    final schema = version is Map<String, Object?> ? version['schema'] : null;
    if (schema is! int) {
      throw const FebricFormatException('Manifest carries no schema version');
    }
    if (schema > DocumentVersion.currentSchema) {
      throw FebricFormatException(
        'Document schema $schema is newer than supported '
        '${DocumentVersion.currentSchema} — upgrade FEBRIC to open it',
      );
    }
    var json = raw;
    var current = schema;
    while (current < DocumentVersion.currentSchema) {
      final step = _migrationFrom(current);
      if (step == null) {
        throw FebricFormatException(
          'No migration registered from schema $current',
        );
      }
      json = step.migrate(json);
      current++;
    }
    return FebricDocument.fromJson(json);
  }

  FebricMigration? _migrationFrom(int schema) {
    for (final migration in migrations) {
      if (migration.fromSchema == schema) {
        return migration;
      }
    }
    return null;
  }
}
