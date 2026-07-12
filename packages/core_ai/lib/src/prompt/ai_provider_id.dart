/// The AI providers FEBRIC's adapters target (ADR-0009).
///
/// Frozen initial set; future providers are appended (never renamed).
/// Providers are always reached through a `ProviderAdapter` — no provider
/// ever receives raw conversation (see `prompt_pipeline.dart`).
enum AiProviderId {
  claude('claude', 'Claude'),
  gemini('gemini', 'Gemini'),
  gpt('gpt', 'GPT'),
  nanoBanana('nano_banana', 'Nano Banana');

  const AiProviderId(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AiProviderId fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown AiProviderId wire name',
      ),
    );
  }
}

/// Provider capability classes (routing input for the API Manager, M6).
enum AiCapability {
  text('text', 'Text'),
  vision('vision', 'Vision'),
  imageGeneration('image_generation', 'Image Generation'),
  inpainting('inpainting', 'Inpainting'),
  segmentation('segmentation', 'Segmentation'),
  upscale('upscale', 'Upscale'),
  embedding('embedding', 'Embedding');

  const AiCapability(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AiCapability fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown AiCapability wire name',
      ),
    );
  }
}
