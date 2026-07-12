import 'package:febric/navigation/app_destinations.dart';
import 'package:febric/workspace/workspace_shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Application router: one stateful shell with a branch per workspace module
/// (state is preserved per branch, deep links land inside the shell).
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: appDestinations.first.path,
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => appDestinations.first.path,
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            WorkspaceShell(navigationShell: navigationShell),
        branches: [
          for (final d in appDestinations)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: d.path,
                  name: d.destination.id,
                  builder: (context, state) => d.pageBuilder(),
                ),
              ],
            ),
        ],
      ),
    ],
  );
});
