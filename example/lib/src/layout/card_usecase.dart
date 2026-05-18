import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsCard extends StatelessWidget {
  const DsCard({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) => Scaffold(
      backgroundColor: context.dsColors.background,
      body: SingleChildScrollView(padding: const EdgeInsets.all(24), child: child),
    );

@widgetbook.UseCase(name: 'Default', type: DsCard)
Widget cardDefault(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Notifications');
  final desc = context.knobs.string(label: 'Description', initialValue: 'You have 3 unread messages.');
  final showFooter = context.knobs.boolean(label: 'Show footer', initialValue: true);

  return _page(context, DSCard(
    title: Text(title),
    description: Text(desc),
    footer: showFooter
        ? Row(
            children: [
              DSButton.outline(onPressed: () async {}, child: const Text('Cancel')),
              const SizedBox(width: 8),
              DSButton(onPressed: () async {}, child: const Text('Save')),
            ],
          )
        : null,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          for (final item in ['Push Notifications', 'Email Digest', 'SMS Alerts'])
            DSSwitch(
              initialValue: item == 'Push Notifications',
              label: Text(item),
              onChanged: (_) {},
            ),
        ],
      ),
    ),
  ));
}

@widgetbook.UseCase(name: 'With Leading', type: DsCard)
Widget cardWithLeading(BuildContext context) {
  final cs = context.dsColors;
  return _page(context, Column(
    children: [
      for (final item in [
        (LucideIcons.creditCard, 'Payment method', 'Visa ending in 4242', '\$24.00'),
        (LucideIcons.receipt, 'Last invoice', 'Due on Jan 30, 2025', '\$128.50'),
        (LucideIcons.circleCheck, 'Subscription', 'Pro plan · Active', 'Monthly'),
      ])
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: DSCard(
            leading: Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: cs.muted, borderRadius: BorderRadius.circular(8)),
              child: Icon(item.$1, size: 18, color: cs.mutedForeground),
            ),
            title: Text(item.$2, style: const TextStyle(fontWeight: FontWeight.w600)),
            description: Text(item.$3),
            trailing: Text(item.$4,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: cs.foreground)),
          ),
        ),
    ],
  ));
}
