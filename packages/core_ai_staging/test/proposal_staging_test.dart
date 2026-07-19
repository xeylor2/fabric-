import 'package:core_ai/core_ai.dart';
import 'package:core_ai_staging/core_ai_staging.dart';
import 'package:core_common/core_common.dart';
import 'package:core_document/core_document.dart';
import 'package:core_geometry/core_geometry.dart';
import 'package:core_layer/core_layer.dart';
import 'package:core_textile/core_textile.dart';
import 'package:test/test.dart';

/// M12A verification suite — AI Proposal Staging.
///
/// Real frozen models throughout (no mocks in lib, spy sink in test only,
/// per the M9/M11 precedent).
void main() {
  group('freeze — AiProposalStatus vocabulary', () {
    test('wire names are frozen — staged, accepted, rejected, rerolled', () {
      expect(AiProposalStatus.values.map((v) => v.wireName), [
        'staged',
        'accepted',
        'rejected',
        'rerolled',
      ]);
      for (final v in AiProposalStatus.values) {
        expect(AiProposalStatus.fromWireName(v.wireName), v);
      }
    });

    test('fromWireName rejects unknown input', () {
      expect(
        () => AiProposalStatus.fromWireName('auto_applied'),
        throwsArgumentError,
      );
    });
  });

  group('freeze — AiProposal model', () {
    test('JSON round-trip preserves nested commands and wire vocabularies', () {
      final proposal = _proposal(
        id: 'p-json',
        commands: const [
          DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer),
        ],
      );
      final restored = AiProposal.fromJson(proposal.toJson());
      expect(restored, proposal);
      final json = proposal.toJson();
      expect(json['operation'], AiOperation.motifRefinement.wireName);
      expect(json['provider'], AiProviderId.claude.wireName);
      expect(json['status'], AiProposalStatus.staged.wireName);
    });

    test('defaults: staged status, empty commands/targets/parameters', () {
      const p = AiProposal(
        id: 'p-defaults',
        operation: AiOperation.motifRefinement,
        promptHash: 'sha256:m12a',
        provider: AiProviderId.claude,
        model: 'claude-fable-5',
        constraintVersion: '1.0.0',
        toolVersion: '0.1.0',
        description: 'Minimal proposal',
      );
      expect(p.status, AiProposalStatus.staged);
      expect(p.commands, isEmpty);
      expect(p.targetNodeIds, isEmpty);
      expect(p.parameters, isEmpty);
      expect(p.predecessorId, isNull);
      expect(p.templateId, isNull);
    });
  });

  group('contract probe', () {
    test('ProposalStagingArea implements ProposalStagingContract', () {
      final area = ProposalStagingArea(sink: _SpySink().call);
      expect(area, isA<ProposalStagingContract>());
    });

    test('the frozen DocumentEngine.apply satisfies DocumentCommandSink', () {
      final engine = DocumentEngine(document: _emptyDoc());
      // Compile-time proof: binding engine.apply to the sink parameter
      // (typed DocumentCommandSink) must type-check — staging forwards to
      // the real document runtime.
      final sink = engine.apply;
      expect(ProposalStagingArea(sink: sink), isNotNull);
    });
  });

  group('stage — admission and pipeline parking', () {
    test('parks the frozen run at validation; next stage is history', () {
      final area = _area(_SpySink());
      final id = area.stage(_proposal(id: 'p-1'));
      expect(id, 'p-1');
      final run = area.pipelineRun('p-1')!;
      expect(run.currentStage, AiPipelineStage.validation);
      expect(run.nextStage, AiPipelineStage.history);
      expect(run.completed, [
        AiPipelineStage.conversation,
        AiPipelineStage.promptCompiler,
        AiPipelineStage.constraintEngine,
        AiPipelineStage.providerAdapter,
        AiPipelineStage.execution,
        AiPipelineStage.responseParser,
        AiPipelineStage.validation,
      ]);
    });

    test('rejects a duplicate id', () {
      final area = _area(_SpySink());
      area.stage(_proposal(id: 'p-dup'));
      expect(() => area.stage(_proposal(id: 'p-dup')), throwsArgumentError);
    });

    test('rejects a proposal not arriving as staged', () {
      final area = _area(_SpySink());
      expect(
        () => area.stage(
          _proposal(id: 'p-bad').copyWith(status: AiProposalStatus.accepted),
        ),
        throwsArgumentError,
      );
    });

    test('staged queue is insertion-ordered and unmodifiable', () {
      final area = _area(_SpySink());
      area.stage(_proposal(id: 'p-a'));
      area.stage(_proposal(id: 'p-b'));
      expect(area.staged.map((p) => p.id), ['p-a', 'p-b']);
      expect(() => area.staged.clear(), throwsUnsupportedError);
    });

    test('proposal() returns any lifecycle state; unknown id is null', () {
      final area = _area(_SpySink());
      area.stage(_proposal(id: 'p-q'));
      area.reject('p-q');
      expect(area.proposal('p-q')!.status, AiProposalStatus.rejected);
      expect(area.proposal('nope'), isNull);
      expect(area.pipelineRun('nope'), isNull);
    });
  });

  group('accept — the only path to the bus (I2/I5)', () {
    test('emits every command in order with CommandSource.ai + provenance '
        'from the proposal precursors and the injected clock', () {
      final sink = _SpySink();
      final area = _area(sink);
      area.stage(
        _proposal(
          id: 'p-acc',
          commands: const [
            DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer),
            DocumentCommand.renameLayer(
              artboardId: 'ab-1',
              layerId: 'l-new',
              name: 'AI Motif',
            ),
          ],
        ),
      );
      final result = area.accept('p-acc', author: 'designer-1');

      expect(sink.calls, hasLength(2));
      expect(sink.calls[0].command, isA<CreateLayerCommand>());
      expect(sink.calls[1].command, isA<RenameLayerCommand>());
      for (final call in sink.calls) {
        expect(call.source, CommandSource.ai);
        expect(call.author, 'designer-1');
        final prov = call.provenance!;
        expect(prov.promptHash, 'sha256:m12a');
        expect(prov.templateId, 'motif-generate-v1');
        expect(prov.provider, AiProviderId.claude);
        expect(prov.model, 'claude-fable-5');
        expect(prov.constraintVersion, '1.0.0');
        expect(prov.toolVersion, '0.1.0');
        expect(prov.parameters, const {'seed': 7});
        expect(prov.timestamp, _t0);
        expect(prov.id, 'prov-1');
      }
      // Both commands carry the same single record (one acceptance, one
      // provenance identity).
      expect(sink.calls[0].provenance, same(sink.calls[1].provenance));

      // Run completed the frozen back half in order; status flipped; the
      // LAST command's result is returned. `productionReady` (stage 13)
      // belongs to the Production engine — acceptance stops at approval.
      final run = area.pipelineRun('p-acc')!;
      expect(run.currentStage, AiPipelineStage.approval);
      expect(run.nextStage, AiPipelineStage.productionReady);
      expect(run.isComplete, isFalse);
      expect(run.completed.sublist(7), [
        AiPipelineStage.history,
        AiPipelineStage.documentUpdate,
        AiPipelineStage.undoStack,
        AiPipelineStage.review,
        AiPipelineStage.approval,
      ]);
      expect(area.proposal('p-acc')!.status, AiProposalStatus.accepted);
      expect((result as CommandApplied).revision, 2);
    });

    test('bus rejection on command k stops emission at k, stays staged, '
        'returns the rejection verbatim', () {
      final sink = _SpySink(rejectAtCall: 2);
      final area = _area(sink);
      area.stage(
        _proposal(
          id: 'p-rej',
          commands: const [
            DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer),
            DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer2),
            DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer3),
          ],
        ),
      );
      final result = area.accept('p-rej', author: 'designer-1');
      expect(result, isA<CommandRejected>());
      expect((result as CommandRejected).reason, CommandRejectionReason.locked);
      expect(sink.calls, hasLength(2)); // third never emitted
      expect(area.proposal('p-rej')!.status, AiProposalStatus.staged);
      expect(
        area.pipelineRun('p-rej')!.currentStage,
        AiPipelineStage.validation,
      );
    });

    test('empty proposal → StateError, zero sink calls, status unchanged', () {
      final sink = _SpySink();
      final area = _area(sink);
      area.stage(_proposal(id: 'p-empty', commands: const []));
      expect(
        () => area.accept('p-empty', author: 'designer-1'),
        throwsStateError,
      );
      expect(sink.calls, isEmpty);
      expect(area.proposal('p-empty')!.status, AiProposalStatus.staged);
    });

    test('unknown id → ArgumentError; non-staged → StateError', () {
      final area = _area(_SpySink());
      expect(
        () => area.accept('ghost', author: 'designer-1'),
        throwsArgumentError,
      );
      area.stage(_proposal(id: 'p-done'));
      area.reject('p-done');
      expect(
        () => area.accept('p-done', author: 'designer-1'),
        throwsStateError,
      );
    });
  });

  group('I2 negative proof — everything except accept is bus-silent', () {
    test('stage, queries, reject and reroll produce zero sink calls', () {
      final sink = _SpySink();
      final area = _area(sink);
      area.stage(_proposal(id: 'p-silent'));
      area
        ..proposal('p-silent')
        ..pipelineRun('p-silent')
        ..staged;
      area.reroll('p-silent', _proposal(id: 'p-silent-2'));
      area.reject('p-silent-2');
      expect(sink.calls, isEmpty);
    });
  });

  group('reject / reroll — terminal transitions and lineage', () {
    test('reject flips status; run stays parked; returns the proposal', () {
      final area = _area(_SpySink());
      area.stage(_proposal(id: 'p-r'));
      final rejected = area.reject('p-r');
      expect(rejected.status, AiProposalStatus.rejected);
      expect(area.pipelineRun('p-r')!.currentStage, AiPipelineStage.validation);
      expect(area.staged, isEmpty);
      // Terminal: reject twice is a StateError.
      expect(() => area.reject('p-r'), throwsStateError);
      expect(() => area.reject('ghost'), throwsArgumentError);
    });

    test('reroll supersedes the predecessor and forces lineage', () {
      final area = _area(_SpySink());
      area.stage(_proposal(id: 'p-old'));
      final newId = area.reroll(
        'p-old',
        // Caller's predecessor claim is overwritten by the runtime.
        _proposal(id: 'p-new').copyWith(predecessorId: 'somebody-else'),
      );
      expect(newId, 'p-new');
      expect(area.proposal('p-old')!.status, AiProposalStatus.rerolled);
      final successor = area.proposal('p-new')!;
      expect(successor.status, AiProposalStatus.staged);
      expect(successor.predecessorId, 'p-old');
      expect(area.staged.map((p) => p.id), ['p-new']);
      // Fresh run for the successor, parked at validation.
      expect(
        area.pipelineRun('p-new')!.currentStage,
        AiPipelineStage.validation,
      );
    });

    test('reroll guards: unknown/non-staged predecessor, bad replacement', () {
      final area = _area(_SpySink());
      expect(
        () => area.reroll('ghost', _proposal(id: 'x')),
        throwsArgumentError,
      );
      area.stage(_proposal(id: 'p-t'));
      area.reject('p-t');
      expect(() => area.reroll('p-t', _proposal(id: 'y')), throwsStateError);
      area.stage(_proposal(id: 'p-u'));
      expect(
        () => area.reroll(
          'p-u',
          _proposal(id: 'z').copyWith(status: AiProposalStatus.accepted),
        ),
        throwsArgumentError,
      );
      // Replacement id colliding with an existing proposal is refused and
      // the predecessor is left un-superseded only AFTER the guard: the
      // duplicate check runs before any mutation.
      expect(
        () => area.reroll('p-u', _proposal(id: 'p-t')),
        throwsArgumentError,
      );
    });
  });

  group('integration — the real frozen DocumentEngine', () {
    test('accepted proposal lands with engine-stamped provenance', () {
      final engine = DocumentEngine(
        document: _docWithArtboard(),
        clock: FixedClock(_t0),
        historyIds: SequentialIdGenerator(prefix: 'h'),
      );
      final area = ProposalStagingArea(
        sink: engine.apply,
        clock: FixedClock(_t0),
        provenanceIds: SequentialIdGenerator(prefix: 'prov'),
      );
      area.stage(
        _proposal(
          id: 'p-int',
          commands: const [
            DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer),
          ],
        ),
      );
      final result = area.accept('p-int', author: 'designer-1');
      expect(result, isA<CommandApplied>());

      // Invariant I5: the ledger gained one record; the frozen engine
      // stamped revision/affectedIds over staging's zero values.
      final ledger = engine.document.aiProvenance;
      expect(ledger, hasLength(1));
      expect(ledger.single.promptHash, 'sha256:m12a');
      expect(ledger.single.revision, (result as CommandApplied).revision);
      expect(ledger.single.affectedIds, isNotEmpty);
      expect(area.proposal('p-int')!.status, AiProposalStatus.accepted);
    });

    test('the frozen engine rejects AI emission without provenance — '
        'staging relies on the gate rather than replacing it', () {
      final engine = DocumentEngine(document: _docWithArtboard());
      final result = engine.apply(
        const DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer),
        source: CommandSource.ai,
        author: 'designer-1',
      );
      expect(result, isA<CommandRejected>());
      expect(
        (result as CommandRejected).reason,
        CommandRejectionReason.missingProvenance,
      );
    });
  });
}

// ---------------------------------------------------------------------------
// Fixtures (real frozen models — no mocks; spy sink is test-only).
// ---------------------------------------------------------------------------

final DateTime _t0 = DateTime.utc(2026, 7, 19, 12);

const LayerModel _layer = LayerModel(
  id: 'l-new',
  name: 'Generated Motif',
  kind: LayerKind.pattern,
);
const LayerModel _layer2 = LayerModel(
  id: 'l-new-2',
  name: 'Generated Border',
  kind: LayerKind.pattern,
);
const LayerModel _layer3 = LayerModel(
  id: 'l-new-3',
  name: 'Generated Filler',
  kind: LayerKind.pattern,
);

AiProposal _proposal({
  required String id,
  List<DocumentCommand> commands = const [
    DocumentCommand.createLayer(artboardId: 'ab-1', layer: _layer),
  ],
}) {
  return AiProposal(
    id: id,
    operation: AiOperation.motifRefinement,
    commands: commands,
    targetNodeIds: const ['node-1'],
    promptHash: 'sha256:m12a',
    templateId: 'motif-generate-v1',
    provider: AiProviderId.claude,
    model: 'claude-fable-5',
    constraintVersion: '1.0.0',
    toolVersion: '0.1.0',
    parameters: const {'seed': 7},
    description: 'Generate a paisley motif on the front panel',
  );
}

ProposalStagingArea _area(_SpySink sink) {
  return ProposalStagingArea(
    sink: sink.call,
    clock: FixedClock(_t0),
    provenanceIds: SequentialIdGenerator(prefix: 'prov'),
  );
}

/// One recorded sink invocation.
class _SinkCall {
  _SinkCall(this.command, this.source, this.author, this.provenance);

  final DocumentCommand command;
  final CommandSource source;
  final String author;
  final AiProvenanceRecord? provenance;
}

/// Test-only spy matching the frozen `DocumentEngine.apply` shape. Applies
/// successfully with incrementing revisions unless configured to reject at
/// a given (1-based) call index.
class _SpySink {
  _SpySink({this.rejectAtCall});

  final int? rejectAtCall;
  final List<_SinkCall> calls = [];

  CommandResult call(
    DocumentCommand command, {
    CommandSource source = CommandSource.user,
    String author = 'local',
    AiProvenanceRecord? provenance,
  }) {
    calls.add(_SinkCall(command, source, author, provenance));
    if (rejectAtCall != null && calls.length == rejectAtCall) {
      return const CommandResult.rejected(
        reason: CommandRejectionReason.locked,
        detail: 'test lock',
      );
    }
    return CommandResult.applied(
      revision: calls.length,
      affectedIds: const ['l-new'],
    );
  }
}

FebricDocument _emptyDoc() => FebricDocument(
  id: const DocumentId('doc-1'),
  projectId: const ProjectId('project-1'),
  manifest: const DocumentManifest(
    version: DocumentVersion(
      schema: DocumentVersion.currentSchema,
      generator: 'febric-test',
    ),
  ),
  metadata: DocumentMetadata(
    title: 'M12A Staging',
    author: 'designer-1',
    createdAt: _t0,
    modifiedAt: _t0,
  ),
);

FebricDocument _docWithArtboard() => _emptyDoc().copyWith(
  artboards: [
    const Artboard(
      id: 'ab-1',
      name: 'Front Panel',
      size: Size2D(width: 1200, height: 1800),
      dpi: 300,
      backgroundColourHex: '#F0EADD',
      layerRoot: LayerModel(
        id: 'ab-1-layers',
        name: 'Layers',
        kind: LayerKind.artboard,
      ),
      designTreeRoot: DesignNode(
        id: 'ab-1-tree',
        name: 'Artwork',
        type: DesignNodeType.artwork,
      ),
    ),
  ],
);
