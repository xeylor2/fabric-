/// Package marker for `core_imaging`.
///
/// Imaging engine: raster operations, masks, compositing, isolate execution, FFI seam.
///
/// Keeps the package importable and testable from day one; real
/// implementation arrives in its architecture milestone.
abstract final class CoreImagingPackage {
  static const String id = 'core_imaging';
  static const String description =
      'Imaging engine: raster operations, masks, compositing, isolate execution, FFI seam.';
}
