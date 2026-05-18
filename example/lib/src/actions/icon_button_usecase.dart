import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsIconButton extends StatelessWidget {
  const DsIconButton({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'All Variants', type: DsIconButton)
Widget iconButtonAllVariants(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final cs = context.dsColors;

  final variants = [
    ('Primary', DSIconButton(icon: const Icon(LucideIcons.plus), onPressed: enabled ? () async {} : null)),
    ('Secondary', DSIconButton.secondary(icon: const Icon(LucideIcons.plus), onPressed: enabled ? () async {} : null)),
    ('Outline', DSIconButton.outline(icon: const Icon(LucideIcons.plus), onPressed: enabled ? () async {} : null)),
    ('Ghost', DSIconButton.ghost(icon: const Icon(LucideIcons.plus), onPressed: enabled ? () async {} : null)),
    ('Destructive', DSIconButton.destructive(icon: const Icon(LucideIcons.trash2), onPressed: enabled ? () async {} : null)),
  ];

  return Scaffold(
    backgroundColor: cs.background,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final v in variants) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(v.$1,
                        style: TextStyle(fontSize: 12, color: cs.mutedForeground)),
                  ),
                  v.$2,
                ],
              ),
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Loading', type: DsIconButton)
Widget iconButtonLoading(BuildContext context) {
  final isLoading = context.knobs.boolean(label: 'Loading', initialValue: true);
  final cs = context.dsColors;

  return Scaffold(
    backgroundColor: cs.background,
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DSIconButton(
            icon: const Icon(LucideIcons.save),
            isLoading: isLoading,
            onPressed: () async {},
          ),
          const SizedBox(width: 12),
          DSIconButton.outline(
            icon: const Icon(LucideIcons.save),
            isLoading: isLoading,
            onPressed: () async {},
          ),
          const SizedBox(width: 12),
          DSIconButton.secondary(
            icon: const Icon(LucideIcons.save),
            isLoading: isLoading,
            onPressed: () async {},
          ),
        ],
      ),
    ),
  );
}
