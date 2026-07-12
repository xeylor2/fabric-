/// Identifier seam of the FEBRIC runtime (dependency inversion): engines
/// never invent ids inline, so tests and replays are deterministic.
abstract interface class IdGenerator {
  /// Returns a new unique id.
  String next();
}

/// Monotonic, prefix-scoped generator — deterministic for tests and
/// collision-free within a session. Persistent global uniqueness comes
/// from combining it with the session-unique document id.
final class SequentialIdGenerator implements IdGenerator {
  SequentialIdGenerator({this.prefix = 'id'});

  final String prefix;
  int _next = 1;

  @override
  String next() => '$prefix-${_next++}';
}
