import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Read-only app identity displayed in Settings → About.
/// Injected by the app's composition root (features never import the app).
@immutable
class SettingsAboutInfo {
  const SettingsAboutInfo({
    required this.appName,
    required this.version,
    required this.environment,
    required this.milestone,
    required this.blueprint,
  });

  final String appName;
  final String version;
  final String environment;
  final String milestone;
  final String blueprint;
}

/// Overridden in bootstrap(); reading it without an override is a
/// programming error.
final settingsAboutInfoProvider = Provider<SettingsAboutInfo>(
  (ref) => throw StateError(
    'settingsAboutInfoProvider must be overridden by the app.',
  ),
);
