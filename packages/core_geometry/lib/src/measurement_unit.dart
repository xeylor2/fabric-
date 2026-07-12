/// Physical measurement units of the FEBRIC OS (physical-unit-first,
/// Architecture V2). Conversion is exact through millimetres at a given
/// [dotsPerInch].
enum MeasurementUnit {
  pixel('px', 'Pixels'),
  millimetre('mm', 'Millimetres'),
  centimetre('cm', 'Centimetres'),
  inch('in', 'Inches');

  const MeasurementUnit(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static MeasurementUnit fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown MeasurementUnit wire name',
      ),
    );
  }
}

/// Pure unit conversion (exact, documented rounding left to callers).
abstract final class UnitConverter {
  static const double _mmPerInch = 25.4;

  /// Converts [value] from [from] to [to] at [dotsPerInch]
  /// (required whenever pixels are involved; must be positive).
  static double convert(
    double value, {
    required MeasurementUnit from,
    required MeasurementUnit to,
    double dotsPerInch = 300,
  }) {
    if (from == to) {
      return value;
    }
    final millimetres = switch (from) {
      MeasurementUnit.millimetre => value,
      MeasurementUnit.centimetre => value * 10,
      MeasurementUnit.inch => value * _mmPerInch,
      MeasurementUnit.pixel => value / dotsPerInch * _mmPerInch,
    };
    return switch (to) {
      MeasurementUnit.millimetre => millimetres,
      MeasurementUnit.centimetre => millimetres / 10,
      MeasurementUnit.inch => millimetres / _mmPerInch,
      MeasurementUnit.pixel => millimetres / _mmPerInch * dotsPerInch,
    };
  }
}
