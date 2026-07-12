/// Time seam of the FEBRIC runtime (dependency inversion): engines never
/// call `DateTime.now()` directly, so tests and replays are deterministic.
abstract interface class Clock {
  DateTime now();
}

/// Production clock.
final class SystemClock implements Clock {
  const SystemClock();

  @override
  DateTime now() => DateTime.now().toUtc();
}

/// Deterministic clock for tests and replay tooling.
final class FixedClock implements Clock {
  const FixedClock(this.fixed);

  final DateTime fixed;

  @override
  DateTime now() => fixed;
}
