import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsTabs extends StatelessWidget {
  const DsTabs({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) => Scaffold(
      backgroundColor: context.dsColors.background,
      body: Padding(padding: const EdgeInsets.all(24), child: child),
    );

@widgetbook.UseCase(name: 'Default', type: DsTabs)
Widget tabsDefault(BuildContext context) {
  final scrollable = context.knobs.boolean(label: 'Scrollable', initialValue: false);
  final cs = context.dsColors;

  return _page(context, DSTabs<String>(
    scrollable: scrollable,
    tabs: [
      DSTab(
        value: 'account',
        content: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Account settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
            const SizedBox(height: 8),
            Text('Manage your account preferences and profile details.', style: TextStyle(fontSize: 14, color: cs.mutedForeground)),
          ]),
        ),
        child: const Text('Account'),
      ),
      DSTab(
        value: 'password',
        content: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Change password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
            const SizedBox(height: 8),
            Text('Update your password to keep your account secure.', style: TextStyle(fontSize: 14, color: cs.mutedForeground)),
          ]),
        ),
        child: const Text('Password'),
      ),
      DSTab(
        value: 'billing',
        content: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Billing details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
            const SizedBox(height: 8),
            Text('View invoices and update your payment method.', style: TextStyle(fontSize: 14, color: cs.mutedForeground)),
          ]),
        ),
        child: const Text('Billing'),
      ),
    ],
  ));
}
