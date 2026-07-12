import 'package:core_textile/src/operations/ai_operation.dart';
import 'package:core_textile/src/operations/colour_operation.dart';
import 'package:core_textile/src/repeat/repeat_type.dart';
import 'package:meta/meta.dart';

/// The frozen FEBRIC tool set (ADR-0002).
///
/// These six tools are **mandatory and permanent**: every future Tools
/// surface must expose exactly this set (extension requires an ADR).
/// Each tool references the domain operation(s) it fronts; implementations
/// arrive in their engine milestones.
enum FebricTool {
  /// Tile artwork by any [RepeatType].
  repeatPattern('repeat_pattern', 'Repeat Pattern'),

  /// Fronts [AiOperation.printReadyEnhancement].
  printReadyEnhancement('print_ready_enhancement', 'Print Ready Enhancement'),

  /// Fronts [AiOperation.enhanceModelCloth].
  enhanceModelCloth('enhance_model_cloth', 'Enhance Model Cloth'),

  /// Fronts [AiOperation.motifRefinement].
  motifRefinement('motif_refinement', 'Motif Refinement'),

  /// Fronts [AiOperation.redesignTextilePrint] (explicit whole-print
  /// redesign — constitutional invariant I6).
  redesignTextilePrint('redesign_textile_print', 'Redesign Textile Print'),

  /// Fronts the [ColourOperation] family.
  colourShift('colour_shift', 'Colour Shift');

  const FebricTool(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static FebricTool fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown FebricTool wire name',
      ),
    );
  }
}

/// Immutable descriptor binding a [FebricTool] to its domain semantics.
@immutable
final class ToolDefinition {
  const ToolDefinition({
    required this.tool,
    required this.summary,
    this.aiOperation,
    this.colourOperations = const [],
    this.repeatTypes = const [],
  });

  /// The tool this definition describes.
  final FebricTool tool;

  /// One-sentence description of what the tool does for the designer.
  final String summary;

  /// The AI operation this tool fronts, if it is AI-backed.
  final AiOperation? aiOperation;

  /// The colour operations this tool exposes, if any.
  final List<ColourOperation> colourOperations;

  /// The repeat structures this tool exposes, if any.
  final List<RepeatType> repeatTypes;

  /// Whether this tool invokes AI (and therefore staging, credits,
  /// provenance).
  bool get isAiBacked => aiOperation != null;
}

/// The frozen tool registry: exactly one definition per [FebricTool].
///
/// Engines and UI surfaces iterate this registry — never hardcode tool
/// lists.
const List<ToolDefinition> febricToolRegistry = [
  ToolDefinition(
    tool: FebricTool.repeatPattern,
    summary:
        'Tile the selected artwork into production repeats — straight, half '
        'drop, half brick, mirror, diamond, toss, custom offset or seamless.',
    repeatTypes: RepeatType.values,
  ),
  ToolDefinition(
    tool: FebricTool.printReadyEnhancement,
    summary:
        'Enhance artwork to print-ready quality: resolution, edges and '
        'detail, scoped to the selection.',
    aiOperation: AiOperation.printReadyEnhancement,
  ),
  ToolDefinition(
    tool: FebricTool.enhanceModelCloth,
    summary:
        'Improve the rendering of cloth in model photography without '
        'altering the design itself.',
    aiOperation: AiOperation.enhanceModelCloth,
  ),
  ToolDefinition(
    tool: FebricTool.motifRefinement,
    summary:
        'Clean and refine a single motif: edges, stray pixels and fine '
        'detail, leaving everything else untouched.',
    aiOperation: AiOperation.motifRefinement,
  ),
  ToolDefinition(
    tool: FebricTool.redesignTextilePrint,
    summary:
        'Explicitly redesign the whole print. The only whole-artwork AI '
        'operation in FEBRIC, and always clearly labelled as such.',
    aiOperation: AiOperation.redesignTextilePrint,
  ),
  ToolDefinition(
    tool: FebricTool.colourShift,
    summary:
        'Shift motif colours, base colour, the whole composition, or swap '
        'the entire palette.',
    colourOperations: ColourOperation.values,
  ),
];
