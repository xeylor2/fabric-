import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Development-only observer: traces provider lifecycle to the debug log.
final class LoggingProviderObserver extends ProviderObserver {
  const LoggingProviderObserver();

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    developer.log(
      'added ${context.provider.name ?? context.provider.runtimeType}',
      name: 'riverpod',
    );
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    developer.log(
      'updated ${context.provider.name ?? context.provider.runtimeType}',
      name: 'riverpod',
    );
  }
}
