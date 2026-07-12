import 'package:core_plugin/core_plugin.dart';
import 'package:test/test.dart';

void main() {
  test('permission, lifecycle, sandbox and event vocabularies are frozen', () {
    expect(PluginPermission.values.map((v) => v.wireName), [
      'read_document',
      'mutate_document',
      'read_selection',
      'use_ai_credits',
      'network',
      'storage',
      'workspace_ui',
    ]);
    expect(PluginLifecycleState.values.map((v) => v.wireName), [
      'discovered',
      'validated',
      'installed',
      'enabled',
      'active',
      'suspended',
      'disabled',
      'uninstalled',
    ]);
    expect(PluginSandbox.values.map((v) => v.wireName), ['isolate', 'process']);
    expect(PluginEventKind.values.map((v) => v.wireName), [
      'document_opened',
      'document_saved',
      'selection_changed',
      'tool_activated',
      'ai_proposal_staged',
      'theme_changed',
    ]);
  });

  test('elevated permissions are exactly the dangerous ones', () {
    expect(PluginPermission.values.where((p) => p.elevated), [
      PluginPermission.mutateDocument,
      PluginPermission.useAiCredits,
      PluginPermission.network,
    ]);
  });

  group('SemVer', () {
    test('parses, compares and stringifies', () {
      final version = SemVer.parse('1.4.2');
      expect(version, const SemVer(major: 1, minor: 4, patch: 2));
      expect(version.toString(), '1.4.2');
      expect(SemVer.parse('2.0.0') >= version, isTrue);
      expect(SemVer.parse('1.4.1') < version, isTrue);
      expect(() => SemVer.parse('1.4'), throwsFormatException);
    });
  });

  group('PluginManifest', () {
    const manifest = PluginManifest(
      id: 'com.studio.motif-pack',
      name: 'Motif Pack',
      version: SemVer(major: 1, minor: 0, patch: 0),
      apiVersion: 1,
      minHostVersion: SemVer(major: 0, minor: 1, patch: 0),
      permissions: [
        PluginPermission.readDocument,
        PluginPermission.mutateDocument,
      ],
      events: [PluginEventKind.selectionChanged],
      category: 'motifs',
    );

    test('elevated permissions trigger marketplace review', () {
      expect(manifest.requiresReview, isTrue);
      expect(
        manifest
            .copyWith(permissions: [PluginPermission.readDocument])
            .requiresReview,
        isFalse,
      );
    });

    test('compatibility: api version match and host version floor', () {
      expect(
        PluginCompatibility.isCompatible(
          manifest,
          hostVersion: const SemVer(major: 0, minor: 1, patch: 0),
        ),
        isTrue,
      );
      expect(
        PluginCompatibility.isCompatible(
          manifest,
          hostVersion: const SemVer(major: 0, minor: 0, patch: 9),
        ),
        isFalse,
        reason: 'host too old',
      );
      expect(
        PluginCompatibility.isCompatible(
          manifest,
          hostVersion: const SemVer(major: 1, minor: 0, patch: 0),
          apiVersion: 2,
        ),
        isFalse,
        reason: 'api version mismatch',
      );
    });

    test('json round trip', () {
      expect(PluginManifest.fromJson(manifest.toJson()), manifest);
      expect(manifest.toJson()['sandbox'], 'isolateSandbox');
    });
  });
}
