import 'package:core_design_system/core_design_system.dart';
import 'package:flutter/material.dart';

/// Right inspector panel (desktop): resizable via its left edge,
/// closable from its header.
class InspectorPanel extends StatelessWidget {
  const InspectorPanel({
    required this.width,
    required this.onWidthChanged,
    required this.child,
    this.onClose,
    super.key,
  });

  static const double minWidth = 260;
  static const double maxWidth = 420;
  static const double defaultWidth = 300;

  final double width;
  final ValueChanged<double> onWidthChanged;
  final VoidCallback? onClose;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return Row(
      children: [
        _ResizeHandle(
          onDrag: (delta) {
            onWidthChanged((width - delta).clamp(minWidth, maxWidth));
          },
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: colors.panel,
            border: Border(left: BorderSide(color: colors.hairline)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: FebricSpacing.lg,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'INSPECTOR',
                          style: context.febricText.labelSmall,
                        ),
                      ),
                      if (onClose != null)
                        IconButton(
                          onPressed: onClose,
                          iconSize: FebricIconSize.sm,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 28,
                            minHeight: 28,
                          ),
                          icon: Icon(Icons.close, color: colors.inkMuted),
                          tooltip: 'Hide inspector',
                        ),
                    ],
                  ),
                ),
              ),
              Divider(color: colors.hairline),
              Expanded(child: child),
            ],
          ),
        ),
      ],
    );
  }
}

/// Invisible-until-hovered vertical resize handle.
class _ResizeHandle extends StatefulWidget {
  const _ResizeHandle({required this.onDrag});

  final ValueChanged<double> onDrag;

  @override
  State<_ResizeHandle> createState() => _ResizeHandleState();
}

class _ResizeHandleState extends State<_ResizeHandle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.febricColors;
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragUpdate: (details) => widget.onDrag(details.delta.dx),
        child: SizedBox(
          width: 6,
          child: Center(
            child: AnimatedContainer(
              duration: FebricMotion.fast,
              width: 2,
              color: _hovered ? colors.focusRing : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
