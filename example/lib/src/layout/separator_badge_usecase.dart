import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsSeparator extends StatelessWidget {
  const DsSeparator({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class DsBadge extends StatelessWidget {
  const DsBadge({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) => Scaffold(
      backgroundColor: context.dsColors.background,
      body: SingleChildScrollView(padding: const EdgeInsets.all(24), child: child),
    );

@widgetbook.UseCase(name: 'Separator', type: DsSeparator)
Widget separatorDefault(BuildContext context) {
  final cs = context.dsColors;
  return _page(context, Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Horizontal', style: TextStyle(fontSize: 12, color: cs.mutedForeground)),
      const SizedBox(height: 12),
      Text('Section A', style: TextStyle(fontWeight: FontWeight.w600, color: cs.foreground)),
      const SizedBox(height: 8),
      const DSSeparator.horizontal(),
      const SizedBox(height: 8),
      Text('Section B', style: TextStyle(fontWeight: FontWeight.w600, color: cs.foreground)),
      const SizedBox(height: 24),
      Text('Vertical', style: TextStyle(fontSize: 12, color: cs.mutedForeground)),
      const SizedBox(height: 12),
      Row(
        children: [
          Text('Home', style: TextStyle(color: cs.foreground)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(height: 16, child: DSSeparator.vertical()),
          ),
          Text('About', style: TextStyle(color: cs.foreground)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(height: 16, child: DSSeparator.vertical()),
          ),
          Text('Contact', style: TextStyle(color: cs.foreground)),
        ],
      ),
    ],
  ));
}

@widgetbook.UseCase(name: 'All Variants', type: DsBadge)
Widget badgeAllVariants(BuildContext context) {
  final cs = context.dsColors;
  return _page(context, Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Variants', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: cs.mutedForeground)),
      const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: [
        const DSBadge(child: Text('Default')),
        const DSBadge.secondary(child: Text('Secondary')),
        const DSBadge.outline(child: Text('Outline')),
        const DSBadge.destructive(child: Text('Destructive')),
      ]),
      const SizedBox(height: 24),
      Text('Semantic', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: cs.mutedForeground)),
      const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: [
        DSBadge(backgroundColor: cs.success, foregroundColor: cs.successForeground, child: const Text('Active')),
        DSBadge(backgroundColor: cs.warning, foregroundColor: cs.warningForeground, child: const Text('Pending')),
        DSBadge(backgroundColor: cs.info, foregroundColor: cs.infoForeground, child: const Text('Draft')),
        DSBadge(backgroundColor: cs.destructive, foregroundColor: cs.destructiveForeground, child: const Text('Error')),
      ]),
    ],
  ));
}
