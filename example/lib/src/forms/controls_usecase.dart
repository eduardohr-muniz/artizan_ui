import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsControls extends StatelessWidget {
  const DsControls({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) => Scaffold(
      backgroundColor: context.dsColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: child,
      ),
    );

// ─── Switch ───────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Switch', type: DsControls)
Widget controlSwitch(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final cs = context.dsColors;

  return _page(context, Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Switch', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
      const SizedBox(height: 16),
      DSSwitch(
        initialValue: true,
        enabled: enabled,
        label: const Text('Push notifications'),
        description: const Text('Receive alerts for new orders and updates.'),
        onChanged: (_) {},
      ),
      const SizedBox(height: 16),
      DSSwitch(
        initialValue: false,
        enabled: enabled,
        label: const Text('Email digest'),
        description: const Text('Get a daily summary of your activity.'),
        onChanged: (_) {},
      ),
      const SizedBox(height: 16),
      DSSwitch(
        initialValue: true,
        enabled: enabled,
        label: const Text('Dark mode'),
        onChanged: (_) {},
      ),
    ],
  ));
}

// ─── Checkbox ─────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Checkbox', type: DsControls)
Widget controlCheckbox(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final cs = context.dsColors;

  return _page(context, Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Checkbox', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
      const SizedBox(height: 16),
      DSCheckBox(
        initialValue: true,
        enabled: enabled,
        label: const Text('Accept terms and conditions'),
        description: const Text('By checking this you agree to our terms of service.'),
        onChanged: (_) {},
      ),
      const SizedBox(height: 16),
      DSCheckBox(
        initialValue: false,
        enabled: enabled,
        label: const Text('Subscribe to newsletter'),
        onChanged: (_) {},
      ),
      const SizedBox(height: 16),
      DSCheckBox(
        initialValue: false,
        enabled: enabled,
        label: const Text('Remember me'),
        onChanged: (_) {},
      ),
    ],
  ));
}

// ─── Slider ───────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Slider', type: DsControls)
Widget controlSlider(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final min = context.knobs.double.slider(label: 'Min', initialValue: 0, min: 0, max: 50);
  final max = context.knobs.double.slider(label: 'Max', initialValue: 100, min: 50, max: 200);
  final cs = context.dsColors;

  return _page(context, Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Slider', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
      const SizedBox(height: 16),
      DSSlider(initialValue: 40, min: min, max: max, enabled: enabled, onChanged: (_) {}),
      const SizedBox(height: 24),
      Text('With divisions', style: TextStyle(fontSize: 13, color: cs.mutedForeground)),
      const SizedBox(height: 8),
      DSSlider(initialValue: 3, min: 1, max: 5, divisions: 4, enabled: enabled, onChanged: (_) {}),
    ],
  ));
}
