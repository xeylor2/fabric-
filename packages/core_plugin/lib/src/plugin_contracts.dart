import 'package:core_plugin/src/plugin_manifest.dart';

/// Host-side registry of installed plugins (ADR-0010). Implementation
/// arrives with the plugin milestone; the contract is frozen here.
abstract interface class PluginRegistry {
  /// Manifests of all known plugins.
  List<PluginManifest> get manifests;

  /// Lifecycle state of [pluginId].
  PluginLifecycleState stateOf(String pluginId);

  /// Commands contributed by enabled plugins.
  List<PluginCommand> get commands;
}

/// Host-side lifecycle driver. Transitions follow
/// [PluginLifecycleState] order; the host may suspend/disable at any time
/// (crash isolation, policy).
abstract interface class PluginHost {
  Future<void> install(PluginManifest manifest);
  Future<void> enable(String pluginId);
  Future<void> disable(String pluginId);
  Future<void> uninstall(String pluginId);

  /// Dispatches a contributed command with a JSON payload; the result is
  /// JSON too — plugins never receive engine object references.
  Future<Map<String, Object?>> dispatchCommand(
    String pluginId,
    String commandId,
    Map<String, Object?> payload,
  );
}

/// Security gate consulted before install/enable (signatures, allowlists,
/// enterprise policy).
abstract interface class PluginSecurityPolicy {
  /// Whether [manifest] may be installed on this host.
  bool allowInstall(PluginManifest manifest);

  /// Whether [permission] may be granted to [pluginId].
  bool allowPermission(String pluginId, PluginPermission permission);
}

/// Compatibility rules between a plugin and this host (frozen policy:
/// same [PluginManifest.apiVersion], host version ≥ min host version).
abstract final class PluginCompatibility {
  /// The plugin API version this host implements.
  static const int hostApiVersion = 1;

  /// Whether [manifest] is compatible with a host at [hostVersion].
  static bool isCompatible(
    PluginManifest manifest, {
    required SemVer hostVersion,
    int apiVersion = hostApiVersion,
  }) {
    return manifest.apiVersion == apiVersion &&
        hostVersion >= manifest.minHostVersion;
  }
}
