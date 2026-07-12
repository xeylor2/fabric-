import 'package:febric/di/app_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_info_provider.g.dart';

/// Static application identity. Version wiring moves to the release pipeline
/// in a later milestone.
@Riverpod(keepAlive: true)
AppInfo appInfo(Ref ref) {
  return const AppInfo(
    name: 'FEBRIC',
    tagline: 'Professional AI Textile Design Operating System',
    version: '0.1.0',
  );
}
