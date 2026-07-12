/// The thirteen frozen asset types of the FEBRIC Asset Engine
/// (Architecture V2; ADR-0016). Append-only; changes require an ADR.
enum AssetType {
  image('image', 'Image'),
  referenceImage('reference_image', 'Reference Image'),
  fabric('fabric', 'Fabric'),
  motif('motif', 'Motif'),
  pattern('pattern', 'Pattern'),
  texture('texture', 'Texture'),
  mask('mask', 'Mask'),
  brush('brush', 'Brush'),
  palette('palette', 'Palette'),
  font('font', 'Font'),
  template('template', 'Template'),
  pluginAsset('plugin_asset', 'Plugin Asset'),
  aiGenerated('ai_generated', 'AI Generated');

  const AssetType(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Whether assets of this type carry raster pixels and therefore MUST
  /// declare dimensions (validated by the engine at registration).
  bool get isRaster => switch (this) {
    image ||
    referenceImage ||
    fabric ||
    motif ||
    pattern ||
    texture ||
    mask ||
    brush ||
    aiGenerated => true,
    palette || font || template || pluginAsset => false,
  };

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AssetType fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () =>
          throw ArgumentError.value(name, 'name', 'Unknown AssetType'),
    );
  }
}
