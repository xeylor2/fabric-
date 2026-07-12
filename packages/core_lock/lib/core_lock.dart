/// FEBRIC Lock Engine (ADR-0005).
///
/// Frozen lock scopes, states and policy contracts. Locks are
/// constitutional (invariant I4): every engine — document, tools, AI,
/// export, production, plugins — checks the Lock Engine before mutating.
/// Nothing bypasses it.
///
/// Pure Dart, foundation tier: depends on nothing internal.
library;

export 'src/lock_scope.dart';
export 'src/lock_state.dart';
