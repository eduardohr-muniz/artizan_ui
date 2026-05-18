import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsProgress extends StatelessWidget {
  const DsProgress({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Determinate', type: DsProgress)
Widget progressDeterminate(BuildContext context) {
  final value = context.knobs.double.slider(
    label: 'Value', initialValue: 0.6, min: 0, max: 1,
  );
  final cs = context.dsColors;

  return Scaffold(
    backgroundColor: cs.background,
    body: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${(value * 100).toInt()}%',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: cs.foreground)),
          const SizedBox(height: 8),
          DSProgress(value: value),
          const SizedBox(height: 32),
          Text('With custom color',
              style: TextStyle(fontSize: 12, color: cs.mutedForeground)),
          const SizedBox(height: 8),
          DSProgress(value: value, color: cs.success),
          const SizedBox(height: 16),
          DSProgress(value: value, color: cs.warning),
          const SizedBox(height: 16),
          DSProgress(value: value, color: cs.destructive),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Indeterminate', type: DsProgress)
Widget progressIndeterminate(BuildContext context) {
  final cs = context.dsColors;
  return Scaffold(
    backgroundColor: cs.background,
    body: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Indeterminate (value: null)',
              style: TextStyle(fontSize: 12, color: cs.mutedForeground)),
          const SizedBox(height: 8),
          const DSProgress(),
        ],
      ),
    ),
  );
}
