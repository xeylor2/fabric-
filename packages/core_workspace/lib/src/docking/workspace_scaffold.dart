import 'package:core_design_system/core_design_system.dart';
import 'package:core_workspace/src/docking/inspector_panel.dart';
import 'package:core_workspace/src/docking/more_modules_sheet.dart';
import 'package:core_workspace/src/docking/workspace_rail.dart';
import 'package:core_workspace/src/docking/workspace_side_bar.dart';
import 'package:core_workspace/src/docking/workspace_status_bar.dart';
import 'package:core_workspace/src/docking/workspace_toolbar.dart';
import 'package:core_workspace/src/model/workspace_destination.dart';
import 'package:flutter/material.dart';

/// The adaptive frame of the FEBRIC Operating System
/// (Architecture V2, System 12 — Desktop-First Workspace).
///
/// Layout per breakpoint:
/// - **Desktop (≥1024):** top toolbar · left sidebar · center · right
///   inspector (resizable) · bottom status bar.
/// - **Tablet (600–1023):** toolbar · navigation rail · center · status bar;
///   inspector as end drawer.
/// - **Phone portrait (<600):** app bar · center · bottom navigation with a
///   "More" bottom sheet.
/// - **Phone landscape (<600 wide, <500 tall):** app bar · icon rail ·
///   center (no bottom bar — vertical space is precious).
///
/// Every region is safe-area aware; the shell never assumes screen shape
/// (foldables, split screen, free window resize).
class WorkspaceScaffold extends StatefulWidget {
  const WorkspaceScaffold({
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
    this.toolbarActions = const [],
    this.statusItems = const [],
    this.statusTrailing = const [],
    this.inspector,
    super.key,
  });

  final List<WorkspaceDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget body;
  final List<Widget> toolbarActions;
  final List<WorkspaceStatusItem> statusItems;
  final List<WorkspaceStatusItem> statusTrailing;

  /// Right inspector content; null disables the inspector entirely.
  final Widget? inspector;

  @override
  State<WorkspaceScaffold> createState() => _WorkspaceScaffoldState();
}

class _WorkspaceScaffoldState extends State<WorkspaceScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _sidebarCollapsed = false;
  bool _inspectorVisible = true;
  double _inspectorWidth = InspectorPanel.defaultWidth;

  String get _title => widget.destinations[widget.selectedIndex].label;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final breakpoint = FebricBreakpoint.fromWidth(size.width);

    if (breakpoint.isDesktop) {
      return _desktop(context, breakpoint);
    }
    // Short windows (landscape phones, half-height split screen) get the
    // slim rail layout regardless of width — vertical space is precious.
    if (size.height < FebricBreakpoint.shortHeightMax) {
      return _phoneLandscape(context);
    }
    if (breakpoint.isMedium) {
      return _tablet(context);
    }
    return _phonePortrait(context);
  }

  // ---------------------------------------------------------------- desktop

  Widget _desktop(BuildContext context, FebricBreakpoint breakpoint) {
    final colors = context.febricColors;
    final showInspector = widget.inspector != null && _inspectorVisible;

    return Scaffold(
      backgroundColor: colors.canvas,
      body: SafeArea(
        child: Column(
          children: [
            WorkspaceToolbar(
              title: _title,
              actions: widget.toolbarActions,
              showCommandField:
                  breakpoint == FebricBreakpoint.large ||
                  breakpoint == FebricBreakpoint.expanded,
              inspectorVisible: widget.inspector == null
                  ? null
                  : _inspectorVisible,
              onToggleInspector: widget.inspector == null
                  ? null
                  : () =>
                        setState(() => _inspectorVisible = !_inspectorVisible),
            ),
            Expanded(
              child: Row(
                children: [
                  WorkspaceSideBar(
                    destinations: widget.destinations,
                    selectedIndex: widget.selectedIndex,
                    onDestinationSelected: widget.onDestinationSelected,
                    collapsed: _sidebarCollapsed,
                    onToggleCollapsed: () =>
                        setState(() => _sidebarCollapsed = !_sidebarCollapsed),
                  ),
                  Expanded(child: ClipRect(child: widget.body)),
                  if (showInspector)
                    InspectorPanel(
                      width: _inspectorWidth,
                      onWidthChanged: (w) =>
                          setState(() => _inspectorWidth = w),
                      onClose: () => setState(() => _inspectorVisible = false),
                      child: widget.inspector!,
                    ),
                ],
              ),
            ),
            WorkspaceStatusBar(
              items: widget.statusItems,
              trailing: widget.statusTrailing,
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------------- tablet

  Widget _tablet(BuildContext context) {
    final colors = context.febricColors;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.canvas,
      endDrawer: widget.inspector == null
          ? null
          : Drawer(
              width: 320,
              backgroundColor: colors.panel,
              child: SafeArea(child: widget.inspector!),
            ),
      body: SafeArea(
        child: Column(
          children: [
            WorkspaceToolbar(
              title: _title,
              actions: widget.toolbarActions,
              showCommandField: false,
              inspectorVisible: widget.inspector == null ? null : false,
              onToggleInspector: widget.inspector == null
                  ? null
                  : () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
            Expanded(
              child: Row(
                children: [
                  WorkspaceRail(
                    destinations: widget.destinations,
                    selectedIndex: widget.selectedIndex,
                    onDestinationSelected: widget.onDestinationSelected,
                  ),
                  Expanded(child: ClipRect(child: widget.body)),
                ],
              ),
            ),
            WorkspaceStatusBar(
              items: widget.statusItems,
              trailing: widget.statusTrailing,
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------- phone portrait

  Widget _phonePortrait(BuildContext context) {
    final colors = context.febricColors;

    final primary = <int>[
      for (var i = 0; i < widget.destinations.length; i++)
        if (widget.destinations[i].compactPrimary) i,
    ].take(4).toList();
    final selectedBarIndex = primary.indexOf(widget.selectedIndex);

    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: _mobileAppBar(context),
      body: SafeArea(top: false, bottom: false, child: widget.body),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedBarIndex >= 0
            ? selectedBarIndex
            : primary.length,
        onDestinationSelected: (barIndex) {
          if (barIndex < primary.length) {
            widget.onDestinationSelected(primary[barIndex]);
          } else {
            showMoreModulesSheet(
              context: context,
              destinations: widget.destinations,
              selectedIndex: widget.selectedIndex,
              onDestinationSelected: widget.onDestinationSelected,
            );
          }
        },
        destinations: [
          for (final i in primary)
            NavigationDestination(
              icon: Icon(widget.destinations[i].icon),
              selectedIcon: Icon(widget.destinations[i].selectedIcon),
              label: widget.destinations[i].label,
            ),
          const NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view),
            label: 'More',
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------- phone landscape

  Widget _phoneLandscape(BuildContext context) {
    final colors = context.febricColors;
    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: _mobileAppBar(context),
      body: SafeArea(
        top: false,
        child: Row(
          children: [
            WorkspaceRail(
              destinations: widget.destinations,
              selectedIndex: widget.selectedIndex,
              onDestinationSelected: widget.onDestinationSelected,
              showLabels: false,
            ),
            Expanded(child: ClipRect(child: widget.body)),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _mobileAppBar(BuildContext context) {
    final colors = context.febricColors;
    return AppBar(
      title: Text(_title),
      leading: Padding(
        padding: const EdgeInsets.all(FebricSpacing.md),
        child: Container(
          decoration: BoxDecoration(
            color: colors.accent,
            borderRadius: FebricRadius.smAll,
          ),
          alignment: Alignment.center,
          child: Text(
            'F',
            style: context.febricText.labelLarge!.copyWith(
              color: colors.onAccent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      actions: [
        ...widget.toolbarActions,
        const SizedBox(width: FebricSpacing.xs),
      ],
    );
  }
}
