import 'package:febric/env/app_environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Injected at startup by `bootstrap()`; reading it without an override is a
/// programming error, hence the throwing default.
final appEnvironmentProvider = Provider<AppEnvironment>(
  (ref) => throw StateError(
    'appEnvironmentProvider must be overridden in bootstrap().',
  ),
);
