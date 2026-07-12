/// The AI-assisted operations FEBRIC offers over textile artwork.
///
/// Frozen vocabulary (ADR-0002). Naming an operation here grants it an
/// identity across documents, credits, provenance and the Tools surface —
/// the AI engine (a later milestone) implements them. Every operation
/// remains subject to the constitutional invariants (scoped, staged,
/// user-approved).
enum AiOperation {
  /// Upscale/sharpen artwork to production print quality.
  printReadyEnhancement('print_ready_enhancement', 'Print Ready Enhancement'),

  /// Enhance a model/garment photograph's cloth rendering.
  enhanceModelCloth('enhance_model_cloth', 'Enhance Model Cloth'),

  /// Clean and refine a single motif (edges, detail, stray pixels).
  motifRefinement('motif_refinement', 'Motif Refinement'),

  /// Explicitly requested whole-print redesign (constitutional invariant
  /// I6: this is its own labelled operation — never an escalation of any
  /// other operation).
  redesignTextilePrint('redesign_textile_print', 'Redesign Textile Print'),

  /// Remove/repair the background around subject artwork.
  backgroundCleanup('background_cleanup', 'Background Cleanup'),

  /// Restore damaged or low-quality fabric scans.
  fabricRestoration('fabric_restoration', 'Fabric Restoration');

  const AiOperation(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AiOperation fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown AiOperation wire name',
      ),
    );
  }
}
