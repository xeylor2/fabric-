import 'package:freezed_annotation/freezed_annotation.dart';

part 'plugin_manifest.freezed.dart';
part 'plugin_manifest.g.dart';

/// Capabilities a plugin may request (ADR-0010). Grants are explicit,
/// user-visible, and enforced by the plugin host; [elevated] permissions
/// additionally require marketplace review.
enum PluginPermission {
  readDocument('read_document', 'Read Document', elevated: false),
  mutateDocument('mutate_document', 'Mutate Document', elevated: true),
  readSelection('read_selection', 'Read Selection', elevated: false),
  useAiCredits('use_ai_credits', 'Use AI Credits', elevated: true),
  network('network', 'Network Access', elevated: true),
  storage('storage', 'Local Storage', elevated: false),
  workspaceUi('workspace_ui', 'Workspace UI', elevated: false);

  const PluginPermission(this.wireName, this.label, {required this.elevated});

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Elevated permissions need marketplace review + explicit user grant.
  final bool elevated;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PluginPermission fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PluginPermission wire name',
      ),
    );
  }
}

/// Plugin lifecycle states, in install order (ADR-0010).
enum PluginLifecycleState {
  discovered('discovered', 'Discovered'),
  validated('validated', 'Validated'),
  installed('installed', 'Installed'),
  enabled('enabled', 'Enabled'),
  active('active', 'Active'),
  suspended('suspended', 'Suspended'),
  disabled('disabled', 'Disabled'),
  uninstalled('uninstalled', 'Uninstalled');

  const PluginLifecycleState(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PluginLifecycleState fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PluginLifecycleState wire name',
      ),
    );
  }
}

/// Isolation level a plugin runs under. FEBRIC never executes plugin code
/// in the host isolate.
enum PluginSandbox {
  /// Dart isolate sandbox (default).
  isolateSandbox('isolate', 'Isolate Sandbox'),

  /// Separate OS process (native/heavy plugins).
  processSandbox('process', 'Process Sandbox');

  const PluginSandbox(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PluginSandbox fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PluginSandbox wire name',
      ),
    );
  }
}

/// Workspace events a plugin may subscribe to (append-only vocabulary).
enum PluginEventKind {
  documentOpened('document_opened', 'Document Opened'),
  documentSaved('document_saved', 'Document Saved'),
  selectionChanged('selection_changed', 'Selection Changed'),
  toolActivated('tool_activated', 'Tool Activated'),
  aiProposalStaged('ai_proposal_staged', 'AI Proposal Staged'),
  themeChanged('theme_changed', 'Theme Changed');

  const PluginEventKind(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static PluginEventKind fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown PluginEventKind wire name',
      ),
    );
  }
}

/// Semantic version with ordering — used for plugin and host API
/// compatibility checks.
@freezed
abstract class SemVer with _$SemVer {
  const factory SemVer({
    required int major,
    required int minor,
    required int patch,
  }) = _SemVer;

  factory SemVer.fromJson(Map<String, Object?> json) => _$SemVerFromJson(json);

  const SemVer._();

  /// Parses `major.minor.patch`; throws [FormatException] on bad input.
  factory SemVer.parse(String text) {
    final parts = text.split('.');
    if (parts.length != 3) {
      throw FormatException('Expected major.minor.patch', text);
    }
    return SemVer(
      major: int.parse(parts[0]),
      minor: int.parse(parts[1]),
      patch: int.parse(parts[2]),
    );
  }

  /// Standard semver precedence comparison.
  int compareTo(SemVer other) {
    if (major != other.major) {
      return major.compareTo(other.major);
    }
    if (minor != other.minor) {
      return minor.compareTo(other.minor);
    }
    return patch.compareTo(other.patch);
  }

  bool operator >=(SemVer other) => compareTo(other) >= 0;
  bool operator <(SemVer other) => compareTo(other) < 0;

  @override
  String toString() => '$major.$minor.$patch';
}

/// The plugin manifest — the marketplace-ready identity and contract of a
/// plugin (ADR-0010).
@freezed
abstract class PluginManifest with _$PluginManifest {
  const factory PluginManifest({
    /// Reverse-domain unique id (e.g. `com.studio.motif-pack`).
    required String id,

    required String name,
    required SemVer version,

    /// Host plugin-API version this plugin targets.
    required int apiVersion,

    /// Minimum FEBRIC host version required.
    required SemVer minHostVersion,

    /// Requested permissions — the host grants nothing else.
    @Default(<PluginPermission>[]) List<PluginPermission> permissions,

    @Default(PluginSandbox.isolateSandbox) PluginSandbox sandbox,

    /// Events the plugin subscribes to.
    @Default(<PluginEventKind>[]) List<PluginEventKind> events,

    String? description,
    String? author,
    String? homepage,

    /// Marketplace category slug.
    String? category,
  }) = _PluginManifest;

  factory PluginManifest.fromJson(Map<String, Object?> json) =>
      _$PluginManifestFromJson(json);

  const PluginManifest._();

  /// Whether any requested permission is elevated (triggers review).
  bool get requiresReview => permissions.any((p) => p.elevated);
}

/// A command a plugin contributes to the workspace (command palette,
/// context menus). Payloads are JSON — plugins never hold engine objects.
@freezed
abstract class PluginCommand with _$PluginCommand {
  const factory PluginCommand({
    /// Unique within the plugin (`pluginId/commandId` globally).
    required String commandId,

    required String title,

    /// Workspace category wire name this command surfaces under.
    String? category,
  }) = _PluginCommand;

  factory PluginCommand.fromJson(Map<String, Object?> json) =>
      _$PluginCommandFromJson(json);
}
