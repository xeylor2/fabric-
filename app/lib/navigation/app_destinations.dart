import 'package:core_workspace/core_workspace.dart';
import 'package:feature_canvas_editor/feature_canvas_editor.dart';
import 'package:feature_conversation/feature_conversation.dart';
import 'package:feature_dashboard/feature_dashboard.dart';
import 'package:feature_design_tree/feature_design_tree.dart';
import 'package:feature_garment_library/feature_garment_library.dart';
import 'package:feature_inspector/feature_inspector.dart';
import 'package:feature_production/feature_production.dart';
import 'package:feature_projects/feature_projects.dart';
import 'package:feature_settings/feature_settings.dart';
import 'package:flutter/material.dart';

/// One workspace module: shell destination + route + page factory.
/// The single registry the router and shell are built from — adding a module
/// in a future milestone is one entry here.
class AppDestination {
  const AppDestination({
    required this.destination,
    required this.path,
    required this.pageBuilder,
  });

  final WorkspaceDestination destination;
  final String path;
  final Widget Function() pageBuilder;
}

final List<AppDestination> appDestinations = [
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'dashboard',
      label: 'Dashboard',
      icon: Icons.space_dashboard_outlined,
      selectedIcon: Icons.space_dashboard,
      compactPrimary: true,
    ),
    path: '/dashboard',
    pageBuilder: () => const DashboardPage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'projects',
      label: 'Projects',
      icon: Icons.folder_open_outlined,
      selectedIcon: Icons.folder,
      compactPrimary: true,
    ),
    path: '/projects',
    pageBuilder: () => const ProjectsPage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'library',
      label: 'Library',
      icon: Icons.checkroom_outlined,
      selectedIcon: Icons.checkroom,
      compactPrimary: true,
    ),
    path: '/library',
    pageBuilder: () => const GarmentLibraryPage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'design-tree',
      label: 'Design Tree',
      icon: Icons.account_tree_outlined,
      selectedIcon: Icons.account_tree,
    ),
    path: '/design-tree',
    pageBuilder: () => const DesignTreePage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'canvas',
      label: 'Canvas',
      icon: Icons.design_services_outlined,
      selectedIcon: Icons.design_services,
      compactPrimary: true,
    ),
    path: '/canvas',
    pageBuilder: () => const CanvasEditorPage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'conversation',
      label: 'Conversation',
      icon: Icons.forum_outlined,
      selectedIcon: Icons.forum,
    ),
    path: '/conversation',
    pageBuilder: () => const ConversationPage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'inspector',
      label: 'Inspector',
      icon: Icons.document_scanner_outlined,
      selectedIcon: Icons.document_scanner,
    ),
    path: '/inspector',
    pageBuilder: () => const InspectorPage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'production',
      label: 'Production',
      icon: Icons.print_outlined,
      selectedIcon: Icons.print,
    ),
    path: '/production',
    pageBuilder: () => const ProductionPage(),
  ),
  AppDestination(
    destination: const WorkspaceDestination(
      id: 'settings',
      label: 'Settings',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
    ),
    path: '/settings',
    pageBuilder: () => const SettingsPage(),
  ),
];
