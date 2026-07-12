import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// The tool set is frozen by ADR-0002: exactly these six, mandatory.
void main() {
  test('FebricTool wire names are frozen — the mandatory six', () {
    expect(FebricTool.values.map((v) => v.wireName), [
      'repeat_pattern',
      'print_ready_enhancement',
      'enhance_model_cloth',
      'motif_refinement',
      'redesign_textile_print',
      'colour_shift',
    ]);
  });

  test('registry defines every tool exactly once, in enum order', () {
    expect(febricToolRegistry.map((d) => d.tool).toList(), FebricTool.values);
  });

  test('every definition has a meaningful summary', () {
    for (final definition in febricToolRegistry) {
      expect(definition.summary.trim().length, greaterThan(20));
    }
  });

  test('AI-backed tools map to their frozen AiOperation', () {
    ToolDefinition of(FebricTool tool) =>
        febricToolRegistry.firstWhere((d) => d.tool == tool);

    expect(
      of(FebricTool.printReadyEnhancement).aiOperation,
      AiOperation.printReadyEnhancement,
    );
    expect(
      of(FebricTool.enhanceModelCloth).aiOperation,
      AiOperation.enhanceModelCloth,
    );
    expect(
      of(FebricTool.motifRefinement).aiOperation,
      AiOperation.motifRefinement,
    );
    expect(
      of(FebricTool.redesignTextilePrint).aiOperation,
      AiOperation.redesignTextilePrint,
    );
    expect(of(FebricTool.redesignTextilePrint).isAiBacked, isTrue);
  });

  test('non-AI tools front their domain operations', () {
    final repeat = febricToolRegistry.firstWhere(
      (d) => d.tool == FebricTool.repeatPattern,
    );
    expect(repeat.isAiBacked, isFalse);
    expect(repeat.repeatTypes, RepeatType.values);

    final colour = febricToolRegistry.firstWhere(
      (d) => d.tool == FebricTool.colourShift,
    );
    expect(colour.isAiBacked, isFalse);
    expect(colour.colourOperations, ColourOperation.values);
  });
}
