// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Static application identity. Version wiring moves to the release pipeline
/// in a later milestone.

@ProviderFor(appInfo)
final appInfoProvider = AppInfoProvider._();

/// Static application identity. Version wiring moves to the release pipeline
/// in a later milestone.

final class AppInfoProvider
    extends $FunctionalProvider<AppInfo, AppInfo, AppInfo>
    with $Provider<AppInfo> {
  /// Static application identity. Version wiring moves to the release pipeline
  /// in a later milestone.
  AppInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInfoHash();

  @$internal
  @override
  $ProviderElement<AppInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppInfo create(Ref ref) {
    return appInfo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppInfo>(value),
    );
  }
}

String _$appInfoHash() => r'c48e98c9036a9ca775d829bcf96026c12ef4fdda';
