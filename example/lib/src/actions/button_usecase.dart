import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsButton extends StatelessWidget {
  const DsButton({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

// ─── Use cases ────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'All Variants', type: DsButton)
Widget buttonAllVariants(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Button');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  final variants = [
    ('Primary', DSButton(onPressed: enabled ? () async {} : null, child: Text(label))),
    ('Secondary', DSButton.secondary(onPressed: enabled ? () async {} : null, child: Text(label))),
    ('Outline', DSButton.outline(onPressed: enabled ? () async {} : null, child: Text(label))),
    ('Ghost', DSButton.ghost(onPressed: enabled ? () async {} : null, child: Text(label))),
    ('Destructive', DSButton.destructive(onPressed: enabled ? () async {} : null, child: Text(label))),
    ('Link', DSButton.link(onPressed: enabled ? () async {} : null, child: Text(label))),
    ('Darken', DSButton.darken(onPressed: enabled ? () async {} : null, child: Text(label))),
  ];

  return ScaffoldBase(
    code: '''
DSButton(onPressed: () async {}, child: Text('Button'))
DSButton.secondary(onPressed: () async {}, child: Text('Button'))
DSButton.outline(onPressed: () async {}, child: Text('Button'))
DSButton.ghost(onPressed: () async {}, child: Text('Button'))
DSButton.destructive(onPressed: () async {}, child: Text('Button'))
DSButton.link(onPressed: () async {}, child: Text('Button'))
DSButton.darken(onPressed: () async {}, child: Text('Button'))''',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final v in variants) ...[
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(v.$1, style: TextStyle(fontSize: 12, color: context.dsColors.mutedForeground)),
              ),
              v.$2,
            ],
          ),
          const SizedBox(height: 12),
        ],
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Primary', type: DsButton)
Widget buttonPrimary(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Continue');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final hasLeading = context.knobs.boolean(label: 'Leading icon', initialValue: false);
  final hasTrailing = context.knobs.boolean(label: 'Trailing icon', initialValue: false);

  return ScaffoldBase(
    code: '''
DSButton(
  onPressed: () async {},
  leading: Icon(LucideIcons.arrowRight, size: 16),
  child: Text('Continue'),
)''',
    child: DSButton(
      onPressed: enabled ? () async {} : null,
      leading: hasLeading ? const Icon(LucideIcons.arrowRight, size: 16) : null,
      trailing: hasTrailing ? const Icon(LucideIcons.arrowRight, size: 16) : null,
      child: Text(label),
    ),
  );
}

@widgetbook.UseCase(name: 'Loading', type: DsButton)
Widget buttonLoading(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Saving...');
  final isLoading = context.knobs.boolean(label: 'Loading', initialValue: true);

  return ScaffoldBase(
    code: '''
DSButton(
  isLoading: true,
  onPressed: () async {},
  child: Text('Saving...'),
)''',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DSButton(
          isLoading: isLoading,
          onPressed: () async {},
          child: Text(label),
        ),
        const SizedBox(height: 16),
        DSButton.outline(
          isLoading: isLoading,
          onPressed: () async {},
          child: Text(label),
        ),
        const SizedBox(height: 16),
        DSButton.secondary(
          isLoading: isLoading,
          onPressed: () async {},
          child: Text(label),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Darken', type: DsButton)
Widget buttonDarken(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Continue');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final hasLeading = context.knobs.boolean(label: 'Leading icon', initialValue: false);
  final hasTrailing = context.knobs.boolean(label: 'Trailing icon', initialValue: false);

  return ScaffoldBase(
    code: '''
DSButton.darken(
  onPressed: () async {},
  child: Text('Continue'),
)''',
    child: DSButton.darken(
      onPressed: enabled ? () async {} : null,
      leading: hasLeading ? const Icon(LucideIcons.arrowRight, size: 16) : null,
      trailing: hasTrailing ? const Icon(LucideIcons.arrowRight, size: 16) : null,
      child: Text(label),
    ),
  );
}

@widgetbook.UseCase(name: 'Async', type: DsButton)
Widget buttonAsync(BuildContext context) {
  return ScaffoldBase(
    code: '''
DSButton(
  onPressed: () async {
    await Future.delayed(Duration(seconds: 2));
  },
  child: Text('Submit'),
)''',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DSButton(
          onPressed: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: const Text('Submit (auto-loader)'),
        ),
        const SizedBox(height: 8),
        Text(
          'Tap to see the auto loading state managed by DSButton.',
          style: TextStyle(fontSize: 12, color: context.dsColors.mutedForeground),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
