// FEBRIC architecture dependency lint (Architecture V2, section 16).
//
// Enforced rules:
//   1. feature_* packages must not depend on other feature_* packages.
//   2. core_* packages must not depend on feature_* packages.
//   3. core_common must not depend on any internal package.
//   4. Pure-Dart core packages must not depend on Flutter.
//   5. lib/ imports must respect the same rules as pubspec dependencies.
//   6. Token discipline: outside core_design_system, lib/ code must not use
//      literal Color(0x...) values or the Material Colors palette
//      (Colors.transparent excepted). All colors flow from the Theme Engine.
//
// Usage (from the repository root):  dart tooling/dependency_lint.dart

import 'dart:io';

const Set<String> pureDartCorePackages = {
  'core_common',
  'core_geometry',
  'core_textile',
  'core_interaction',
  'core_lock',
  'core_layer',
  'core_mask',
  'core_selection',
  'core_plugin',
  'core_performance',
  'core_tooling',
  'core_canvas',
  'core_canvas_runtime',
  'core_render',
  'core_document',
  'core_garment',
  'core_color',
  'core_ai',
  'core_asset',
  'core_assets',
};

/// Foundation packages that must not depend on any internal package
/// (M1.6 freeze: core_interaction now builds on core_geometry, so the
/// dependency-free tier is geometry/common/textile/lock/plugin).
const Set<String> dependencyFreePackages = {
  'core_common',
  'core_geometry',
  'core_textile',
  'core_lock',
  'core_plugin',
};

final RegExp _namePattern = RegExp(r'^name:\s*(\S+)', multiLine: true);
final RegExp _internalDepPattern = RegExp(
  r'^  ((?:core|feature)_[a-z_]+):',
  multiLine: true,
);
final RegExp _internalImportPattern = RegExp(
  "import 'package:((?:core|feature)_[a-z_]+)/",
);
final RegExp _colorLiteralPattern = RegExp(r'Color\(0x[0-9A-Fa-f]+\)');
final RegExp _materialPalettePattern = RegExp(r'\bColors\.(?!transparent\b)');

void main() {
  final packagesDir = Directory('packages');
  if (!packagesDir.existsSync()) {
    stderr.writeln(
      'dependency_lint: run from the repository root (packages/ not found).',
    );
    exitCode = 2;
    return;
  }

  final violations = <String>[];
  final packageDirs = <Directory>[
    ...packagesDir.listSync().whereType<Directory>(),
    Directory('app'),
  ];

  for (final dir in packageDirs) {
    final pubspecFile = File('${dir.path}/pubspec.yaml');
    if (!pubspecFile.existsSync()) {
      continue;
    }
    final pubspec = pubspecFile.readAsStringSync();
    final nameMatch = _namePattern.firstMatch(pubspec);
    if (nameMatch == null) {
      continue;
    }
    final name = nameMatch.group(1)!;
    final internalDeps = _internalDepPattern
        .allMatches(pubspec)
        .map((m) => m.group(1)!)
        .where((dep) => dep != name)
        .toSet();
    final usesFlutter = pubspec.contains('sdk: flutter');

    if (name.startsWith('feature_')) {
      for (final dep in internalDeps.where((d) => d.startsWith('feature_'))) {
        violations.add('$name -> $dep (feature-to-feature is forbidden)');
      }
    }
    if (name.startsWith('core_')) {
      for (final dep in internalDeps.where((d) => d.startsWith('feature_'))) {
        violations.add('$name -> $dep (core-to-feature is forbidden)');
      }
      if (dependencyFreePackages.contains(name) && internalDeps.isNotEmpty) {
        violations.add(
          '$name -> ${internalDeps.join(', ')} '
          '($name must stay dependency-free)',
        );
      }
      if (pureDartCorePackages.contains(name) && usesFlutter) {
        violations.add('$name depends on Flutter (must remain pure Dart)');
      }
    }

    final libDir = Directory('${dir.path}/lib');
    if (!libDir.existsSync()) {
      continue;
    }
    final dartFiles = libDir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'));
    for (final file in dartFiles) {
      final content = file.readAsStringSync();
      for (final match in _internalImportPattern.allMatches(content)) {
        final imported = match.group(1)!;
        if (imported == name) {
          continue;
        }
        final crossFeature =
            name.startsWith('feature_') && imported.startsWith('feature_');
        final coreToFeature =
            name.startsWith('core_') && imported.startsWith('feature_');
        if (crossFeature || coreToFeature) {
          violations.add('${file.path}: imports $imported (forbidden)');
        }
      }
      if (pureDartCorePackages.contains(name) &&
          content.contains("import 'package:flutter/")) {
        violations.add('${file.path}: imports Flutter (pure Dart package)');
      }
      if (name != 'core_design_system') {
        if (_colorLiteralPattern.hasMatch(content)) {
          violations.add(
            '${file.path}: literal Color(0x...) outside the Theme Engine',
          );
        }
        if (_materialPalettePattern.hasMatch(content)) {
          violations.add(
            '${file.path}: Material Colors.* outside the Theme Engine '
            '(only Colors.transparent is allowed)',
          );
        }
      }
    }
  }

  if (violations.isEmpty) {
    stdout.writeln(
      'dependency_lint: PASS - architecture dependency rules hold.',
    );
    return;
  }
  stderr.writeln('dependency_lint: ${violations.length} violation(s):');
  for (final violation in violations) {
    stderr.writeln('  - $violation');
  }
  exitCode = 1;
}
