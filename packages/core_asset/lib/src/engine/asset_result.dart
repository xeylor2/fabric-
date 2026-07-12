import 'package:core_asset/src/model/febric_asset.dart';
import 'package:core_lock/core_lock.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_result.freezed.dart';

/// Why the Asset Engine refused an operation (frozen, append-only).
enum AssetRejectionReason {
  locked('locked', 'Locked'),
  notFound('not_found', 'Not Found'),
  invalid('invalid', 'Invalid'),
  duplicateIdentity('duplicate_identity', 'Duplicate Identity'),
  inUse('in_use', 'In Use');

  const AssetRejectionReason(this.wireName, this.label);

  /// Stable serialization name. Never changes.
  final String wireName;

  /// Default English display label.
  final String label;

  /// Resolves a wire name; throws [ArgumentError] for unknown names.
  static AssetRejectionReason fromWireName(String name) {
    return values.firstWhere(
      (v) => v.wireName == name,
      orElse: () => throw ArgumentError.value(
        name,
        'name',
        'Unknown AssetRejectionReason',
      ),
    );
  }
}

/// Outcome of one Asset Engine operation — applied with the resulting
/// asset state, or rejected with a typed reason (and the blocking lock
/// when the Lock Engine refused it, invariant I4).
@freezed
sealed class AssetResult with _$AssetResult {
  const factory AssetResult.applied({FebricAsset? asset}) = AssetApplied;

  const factory AssetResult.rejected({
    required AssetRejectionReason reason,
    String? detail,
    LockState? blockedBy,
  }) = AssetRejected;
}
