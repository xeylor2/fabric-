import 'package:flutter/foundation.dart';

/// Immutable application identity used by shells and diagnostics.
@immutable
class AppInfo {
  const AppInfo({
    required this.name,
    required this.tagline,
    required this.version,
  });

  final String name;
  final String tagline;
  final String version;
}
