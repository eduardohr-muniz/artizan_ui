import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsPopover extends StatelessWidget {
  const DsPopover({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class DsTooltip extends StatelessWidget {
  const DsTooltip({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) => Scaffold(
      backgroundColor: context.dsColors.background,
      body: Center(child: child),
    );

@widgetbook.UseCase(name: 'Default', type: DsPopover)
Widget popoverDefault(BuildContext context) {
  final cs = context.dsColors;
  return _page(context, DSPopover(
    popover: (_) => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick actions',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: cs.foreground)),
          const SizedBox(height: 8),
          _PopoverItem(icon: LucideIcons.pencil, label: 'Edit'),
          _PopoverItem(icon: LucideIcons.copy, label: 'Duplicate'),
          _PopoverItem(icon: LucideIcons.trash2, label: 'Delete', destructive: true),
        ],
      ),
    ),
    child: DSButton.outline(
      onPressed: () async {},
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text('Options'), SizedBox(width: 4), Icon(LucideIcons.chevronsUpDown, size: 14)],
      ),
    ),
  ));
}

class _PopoverItem extends StatelessWidget {
  const _PopoverItem({required this.icon, required this.label, this.destructive = false});
  final IconData icon;
  final String label;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;
    final color = destructive ? cs.destructive : cs.foreground;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 13, color: color)),
        ],
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Tooltip', type: DsTooltip)
Widget tooltipDefault(BuildContext context) {
  final cs = context.dsColors;
  return _page(context, Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Hover over the icons', style: TextStyle(fontSize: 13, color: cs.mutedForeground)),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DSTooltip(
            builder: (_) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text('Add item', style: TextStyle(fontSize: 12)),
            ),
            child: DSIconButton.outline(icon: const Icon(LucideIcons.plus), onPressed: () async {}),
          ),
          const SizedBox(width: 12),
          DSTooltip(
            builder: (_) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text('Edit item', style: TextStyle(fontSize: 12)),
            ),
            child: DSIconButton.outline(icon: const Icon(LucideIcons.pencil), onPressed: () async {}),
          ),
          const SizedBox(width: 12),
          DSTooltip(
            builder: (_) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text('Delete item', style: TextStyle(fontSize: 12)),
            ),
            child: DSIconButton.destructive(icon: const Icon(LucideIcons.trash2), onPressed: () async {}),
          ),
        ],
      ),
    ],
  ));
}
