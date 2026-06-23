import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsControls extends StatelessWidget {
  const DsControls({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

// ─── Switch ───────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Switch', type: DsControls)
Widget controlSwitch(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final cs = context.dsColors;

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSSwitch(
  initialValue: true,
  label: Text('Push notifications'),
  description: Text('Receive alerts for new orders and updates.'),
  onChanged: (value) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Switch',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
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
    ),
  );
}

// ─── Checkbox ─────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Checkbox', type: DsControls)
Widget controlCheckbox(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final cs = context.dsColors;

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSCheckBox(
  initialValue: false,
  label: Text('Accept terms and conditions'),
  description: Text('By checking this you agree to our terms of service.'),
  onChanged: (value) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Checkbox',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
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
    ),
  );
}

// ─── Slider ───────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Slider', type: DsControls)
Widget controlSlider(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final min = context.knobs.double.slider(label: 'Min', max: 50);
  final max =
      context.knobs.double.slider(label: 'Max', initialValue: 100, min: 50, max: 200);
  final cs = context.dsColors;

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSSlider(
  initialValue: 40,
  min: 0,
  max: 100,
  onChanged: (value) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Slider',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
        const SizedBox(height: 16),
        DSSlider(
            initialValue: 40, min: min, max: max, enabled: enabled, onChanged: (_) {}),
        const SizedBox(height: 24),
        Text('With divisions', style: TextStyle(fontSize: 13, color: cs.mutedForeground)),
        const SizedBox(height: 8),
        DSSlider(
            initialValue: 3,
            min: 1,
            max: 5,
            divisions: 4,
            enabled: enabled,
            onChanged: (_) {}),
      ],
    ),
  );
}

// ─── Range Slider ───────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Range Slider', type: DsControls)
Widget controlRangeSlider(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final divisions = context.knobs.boolean(label: 'Divisions');
  final cs = context.dsColors;

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSRangeSlider(
  values: RangeValues(20, 70),
  min: 0,
  max: 100,
  onChanged: (value) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Range Slider',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: cs.foreground)),
        const SizedBox(height: 16),
        _RangeSliderDemo(
          initial: const RangeValues(20, 70),
          min: 0,
          max: 100,
          divisions: divisions ? 10 : null,
          enabled: enabled,
        ),
      ],
    ),
  );
}

/// Holder de estado local — o [DSRangeSlider] é controlado (values + onChanged).
class _RangeSliderDemo extends StatefulWidget {
  const _RangeSliderDemo({
    required this.initial,
    required this.min,
    required this.max,
    required this.enabled,
    this.divisions,
  });

  final RangeValues initial;
  final double min;
  final double max;
  final bool enabled;
  final int? divisions;

  @override
  State<_RangeSliderDemo> createState() => _RangeSliderDemoState();
}

class _RangeSliderDemoState extends State<_RangeSliderDemo> {
  late RangeValues _values = widget.initial;

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_values.start.round()} – ${_values.end.round()}',
          style: TextStyle(fontSize: 13, color: cs.mutedForeground),
        ),
        const SizedBox(height: 8),
        DSRangeSlider(
          values: _values,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          enabled: widget.enabled,
          labels: RangeLabels('${_values.start.round()}', '${_values.end.round()}'),
          onChanged: (value) => setState(() => _values = value),
        ),
      ],
    );
  }
}
