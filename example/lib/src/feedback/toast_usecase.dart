import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsToast extends StatelessWidget {
  const DsToast({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Default', type: DsToast)
Widget toastDefault(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Event created');
  final desc = context.knobs.string(label: 'Description', initialValue: 'Monday, Jan 3, 2025 at 6:00 PM');
  final cs = context.dsColors;

  return Scaffold(
    backgroundColor: cs.background,
    body: DSSonner(
      child: Builder(builder: (ctx) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DSButton(
              onPressed: () async {
                DSToast(
                  title: Text(title),
                  description: Text(desc),
                ).show(ctx);
              },
              child: const Text('Show Toast'),
            ),
            const SizedBox(height: 12),
            DSButton.outline(
              onPressed: () async {
                DSToast.destructive(
                  title: const Text('Error'),
                  description: const Text('Something went wrong. Please try again.'),
                ).show(ctx);
              },
              child: const Text('Show Destructive Toast'),
            ),
          ],
        ),
      )),
    ),
  );
}
