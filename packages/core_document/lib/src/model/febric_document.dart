import 'package:core_document/src/history/document_history.dart';
import 'package:core_document/src/model/ai_provenance.dart';
import 'package:core_document/src/model/artboard.dart';
import 'package:core_document/src/model/asset_registry.dart';
import 'package:core_document/src/model/document_metadata.dart';
import 'package:core_document/src/model/identifiers.dart';
import 'package:core_document/src/model/profiles.dart';
import 'package:core_document/src/model/tool_state.dart';
import 'package:core_document/src/model/workspace_viewport.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_lock/core_lock.dart';
import 'package:core_mask/core_mask.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'febric_document.freezed.dart';
part 'febric_document.g.dart';

/// THE FebricDocument — the runtime source of truth of the FEBRIC OS
/// (frozen rule 1, ADR-0014). Everything lives inside it: content,
/// registries, history, provenance, locks, profiles, tool states,
/// viewports and plugin data. It is immutable; the only way it changes is
/// a `DocumentCommand` applied through the `DocumentEngine`.
@freezed
abstract class FebricDocument with _$FebricDocument {
  const factory FebricDocument({
    required DocumentId id,
    required ProjectId projectId,

    /// Monotonic revision (increments per applied command).
    @Default(RevisionId.initial) RevisionId revision,

    required DocumentManifest manifest,
    required DocumentMetadata metadata,
    @Default(DocumentSettings()) DocumentSettings settings,
    @Default(DocumentPreferences()) DocumentPreferences preferences,

    /// Content: any number of artboards, each owning its layer tree and
    /// design tree.
    @Default(<Artboard>[]) List<Artboard> artboards,

    /// Central asset registry.
    @Default(AssetRegistry.empty) AssetRegistry assets,

    /// Mask registry: target id (layer/node) → mask stack.
    @Default(<String, MaskStack>{}) Map<String, MaskStack> masks,

    /// Lock registry (frozen Lock Engine, ADR-0005).
    @Default(LockSet.none) LockSet locks,

    /// Tool-state registry: tool/plugin id → typed envelope
    /// (frozen rules 3 and 6 — the schema never changes per tool).
    @Default(<String, ToolStateExtension>{})
    Map<String, ToolStateExtension> toolStates,

    /// Per-workspace persisted viewports.
    @Default(<String, WorkspaceViewportState>{})
    Map<String, WorkspaceViewportState> viewports,

    /// The command journal (undo/redo stacks derive from its cursor).
    @Default(DocumentHistory.empty) DocumentHistory history,

    /// AI provenance ledger (invariant I5).
    @Default(<AiProvenanceRecord>[]) List<AiProvenanceRecord> aiProvenance,

    /// Plugin-isolated extension storage:
    /// namespace → (entry kind → payload). Plugins never touch core schema.
    @Default(<String, Map<String, Object?>>{})
    Map<String, Map<String, Object?>> pluginData,

    // Profiles ---------------------------------------------------------------
    @Default(<ExportProfile>[]) List<ExportProfile> exportProfiles,
    @Default(<ProductionProfile>[]) List<ProductionProfile> productionProfiles,
    @Default(<MeasurementProfile>[])
    List<MeasurementProfile> measurementProfiles,
    @Default(<ColourProfile>[]) List<ColourProfile> colourProfiles,
    @Default(<PrintProfile>[]) List<PrintProfile> printProfiles,
  }) = _FebricDocument;

  factory FebricDocument.fromJson(Map<String, Object?> json) =>
      _$FebricDocumentFromJson(json);

  const FebricDocument._();

  /// Artboard lookup.
  Artboard? artboardById(String id) {
    for (final artboard in artboards) {
      if (artboard.id == id) {
        return artboard;
      }
    }
    return null;
  }

  /// Computed layer registry: layer id → layer, across all artboards.
  /// Hierarchical content is indexed, never duplicated (ADR-0014).
  Map<String, LayerModel> get layerRegistry {
    final index = <String, LayerModel>{};
    for (final artboard in artboards) {
      for (final layer in artboard.layerRoot.descendantsAndSelf) {
        index[layer.id] = layer;
      }
    }
    return index;
  }

  /// Derived statistics — computed so they can never drift from content.
  DocumentStatistics get statistics {
    var layers = 0;
    var nodes = 0;
    for (final artboard in artboards) {
      layers += artboard.layerRoot.descendantsAndSelf.length;
      nodes += artboard.designTreeRoot.subtreeSize;
    }
    return DocumentStatistics(
      artboards: artboards.length,
      layers: layers,
      designNodes: nodes,
      assets: assets.count,
      historyEntries: history.entries.length,
      aiProvenanceRecords: aiProvenance.length,
      revision: revision.value,
    );
  }
}
