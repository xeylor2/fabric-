# FEBRIC Document Engine (M2, ADR-0014)

The runtime source of truth of the FEBRIC OS. Everything lives inside the
document; nothing edits it directly; every change is a typed command.

## Architecture

```mermaid
graph TD
  subgraph callers["Callers (never mutate directly)"]
    UI[Workspace UI]
    TOOLS[Tools · UniversalToolContract]
    AI[AI Pipeline · stage documentUpdate]
    PLUGINS[Plugins · JSON commands]
  end
  callers -->|DocumentCommand| ENGINE

  subgraph ENGINE["DocumentEngine (frozen pipeline, rule 5)"]
    L[1 · Lock Engine\nLockPolicy · I4] --> V[2 · Validation\npure reducer checks]
    V --> H[3 · History\ncommand + inverse + author + source + revision]
    H --> D[4 · Document\nnext immutable FebricDocument]
  end
  D --> DOC[(FebricDocument)]
  DOC -->|read-only views| callers
  ENGINE -->|CommandRejected\nreason + blocking lock| callers
```

## Document schema

```mermaid
classDiagram
  FebricDocument : DocumentId id
  FebricDocument : ProjectId projectId
  FebricDocument : RevisionId revision
  FebricDocument : DocumentManifest manifest
  FebricDocument : DocumentMetadata metadata
  FebricDocument : DocumentSettings settings
  FebricDocument : DocumentPreferences preferences
  FebricDocument : LockSet locks
  FebricDocument : DocumentHistory history
  FebricDocument "1" --> "*" Artboard
  FebricDocument "1" --> "1" AssetRegistry
  FebricDocument "1" --> "*" MaskStack : masks by target
  FebricDocument "1" --> "*" ToolStateExtension : toolStates
  FebricDocument "1" --> "*" WorkspaceViewportState : viewports
  FebricDocument "1" --> "*" AiProvenanceRecord
  FebricDocument "1" --> "*" ExportProfile
  FebricDocument "1" --> "*" ProductionProfile
  FebricDocument "1" --> "*" MeasurementProfile
  FebricDocument "1" --> "*" ColourProfile
  FebricDocument "1" --> "*" PrintProfile
  Artboard : Size2D size · unit · dpi · background
  Artboard "1" --> "1" LayerModel : layerRoot
  Artboard "1" --> "1" DesignNode : designTreeRoot
  Artboard "1" --> "0..1" ViewportState : camera
```

## Command flow & undo

```mermaid
sequenceDiagram
  participant C as Caller
  participant E as DocumentEngine
  participant LK as LockPolicy
  participant R as DocumentReducer
  C->>E: apply(command, source, author, provenance?)
  E->>E: status gate · AI⇒provenance required (I5)
  E->>LK: check(history) · check(command.lockRequirement)
  LK-->>E: permit / blockedBy
  E->>R: apply(document, command)
  R-->>E: nextDoc + inverse + affectedIds | failure
  E->>E: history.append({command, inverse, …, revision+1})
  E-->>C: CommandApplied(revision) | CommandRejected(reason)
  Note over E: undo → apply(entry.inverse), cursor−1 (gated by undo lock)
  Note over E: redo → apply(entry.command), cursor+1
```

## Lifecycle

```mermaid
stateDiagram-v2
  [*] --> loading : open
  loading --> clean : decoded
  loading --> recovered : journal replay
  clean --> modified : command applied
  recovered --> modified : command applied
  modified --> saving : markSaving
  saving --> clean : markSaved
  clean --> read_only : setReadOnly
  modified --> read_only : setReadOnly
  read_only --> clean : release
  clean --> archived : markArchived
  note right of modified : dirty = revision ≠ savedRevision (derived)
```

## Dependency graph

`core_document → {core_common, core_geometry, core_textile, core_lock,
core_layer, core_mask, core_selection, core_interaction, core_ai}` — all
pure Dart, acyclic, lint-enforced. Consumers (M3+): design-tree feature,
tools, AI backbone, production.

## Acceptance criteria (verified by the 34-test suite)

Pipeline order unskippable · validation failures leave the document
untouched (`identical`) · targeted/global/history/undo locks gate exactly
per the frozen hierarchy with `blockedBy` surfaced · inverses restore
structure exactly (subtree delete/move/rename round-trips) · redo branch
truncation · AI commands refused without provenance, recorded with
revision + targets · tool states via envelopes only (unknown future tool
persists with zero schema change) · plugin namespaces isolated ·
viewport persistence round-trips · `.febric` lossless, newer-schema
refused, stepwise migration works · repository contract honoured.

## Migration & testing strategy

Schema is versioned from file one; migrations are registered stepwise and
exercised in CI with forged legacy payloads. New model fields must default
(decode of older JSON succeeds); removals/renames require a migration + a
freeze-test update + an ADR. Every engine behaviour is unit-tested with
deterministic seams (FixedClock, SequentialIdGenerator); integration with
rendering/UI arrives in later milestones against this frozen surface.
