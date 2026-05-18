import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsSheet extends StatelessWidget {
  const DsSheet({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) => Scaffold(
      backgroundColor: context.dsColors.background,
      body: Center(child: child),
    );

@widgetbook.UseCase(name: 'Default', type: DsSheet)
Widget sheetDefault(BuildContext context) {
  return _page(context, DSButton.outline(
    onPressed: () async {
      await showDSSheet(
        context: context,
        builder: (_) => DSSheet(
          title: const Text('Filters'),
          description: const Text('Adjust your search filters below.'),
          actions: [
            DSButton.outline(onPressed: () async {}, child: const Text('Clear')),
            DSButton(onPressed: () async {}, child: const Text('Apply')),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DSSwitch(initialValue: true, label: const Text('In stock only'), onChanged: (_) {}),
              const SizedBox(height: 12),
              DSSwitch(initialValue: false, label: const Text('On sale'), onChanged: (_) {}),
              const SizedBox(height: 12),
              DSSlider(initialValue: 100, min: 0, max: 500, onChanged: (_) {}),
            ],
          ),
        ),
      );
    },
    child: const Text('Open Sheet'),
  ));
}
