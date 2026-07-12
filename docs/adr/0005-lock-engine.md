# ADR-0005 — FEBRIC Lock Engine (`core_lock`)

- **Status:** Accepted (M1.6 freeze, 2026-07-07)
- **Decision:** Sixteen frozen `LockScope`s (project, document, layer,
  object, selection, reference, mask, tool, viewport, history, undo, ai,
  export, production, review, approval) with a frozen implication
  hierarchy (project ⇒ all; document ⇒ content scopes incl. reference;
  layer ⇒ object; history ⇒ undo; approval ⇒ document). `LockState` +
  `LockSet` (freezed, JSON) provide pure queries (`isLocked`,
  `blockingLock` with origin + reason); `LockPolicy` is the interface every
  engine consults **before** mutating (invariant I4 — checks precede
  compute). `LockOrigin` (user, system, policy, review) governs who may
  release a lock.
- **Placement:** dedicated dependency-free foundation package: every
  engine consumes it; merging into `core_common` would push domain policy
  into the kernel.
- **Consequences:** The M2 command bus must gate every command through
  `LockPolicy`; the AI constraint engine derives constraints from
  `LockSet`; UIs surface `blockingLock.reason`. Hierarchy changes require
  a new ADR (freeze-tested).
