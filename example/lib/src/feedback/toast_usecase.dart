import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsToast extends StatelessWidget {
  const DsToast({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class DsSonner extends StatelessWidget {
  const DsSonner({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

// ─── DSToaster ────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Default', type: DsToast)
Widget toastDefault(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Event created');
  final desc = context.knobs
      .string(label: 'Description', initialValue: 'Monday, Jan 3, 2025 at 6:00 PM');

  return ScaffoldBase(
    code: '''
DSToaster(
  child: Builder(builder: (ctx) =>
    DSButton(
      onPressed: () async {
        DSToaster.show(ctx, DSToast(
          title: Text('Event created'),
          description: Text('Monday, Jan 3, 2025 at 6:00 PM'),
        ));
      },
      child: Text('Show Toast'),
    ),
  ),
)''',
    child: DSToaster(
      child: Builder(
        builder: (ctx) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DSButton(
                onPressed: () async {
                  DSToaster.show(
                    ctx,
                    DSToast(
                      title: Text(title),
                      description: Text(desc),
                      action: TextButton(
                        onPressed: () {},
                        child: const Text('Undo'),
                      ),
                    ),
                  );
                },
                child: const Text('Show Toast'),
              ),
              const SizedBox(height: 12),
              DSButton.destructive(
                onPressed: () async {
                  DSToaster.show(
                    ctx,
                    DSToast.destructive(
                      title: const Text('Error'),
                      description: const Text('Something went wrong. Please try again.'),
                    ),
                  );
                },
                child: const Text('Show Destructive'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// ─── DSSonner ─────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'Default', type: DsSonner)
Widget sonnerDefault(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Event created');
  final desc = context.knobs
      .string(label: 'Description', initialValue: 'Monday, Jan 3, 2025 at 6:00 PM');

  return ScaffoldBase(
    code: '''
DSSonner(
  child: Builder(builder: (ctx) =>
    DSButton(
      onPressed: () async {
        DSSonner.show(ctx, DSToast(
          title: Text('Event created'),
          description: Text('Monday, Jan 3, 2025 at 6:00 PM'),
        ));
      },
      child: Text('Show Sonner'),
    ),
  ),
)''',
    child: DSSonner(
      child: Builder(
        builder: (ctx) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DSButton(
                onPressed: () async {
                  DSSonner.show(
                    ctx,
                    DSToast(
                      title: Text(title),
                      description: Text(desc),
                    ),
                  );
                },
                child: const Text('Show Sonner'),
              ),
              const SizedBox(height: 12),
              DSButton.destructive(
                onPressed: () async {
                  DSSonner.show(
                    ctx,
                    DSToast.destructive(
                      title: const Text('Error'),
                      description: const Text('Something went wrong. Please try again.'),
                    ),
                  );
                },
                child: const Text('Show Destructive'),
              ),
              const SizedBox(height: 12),
              DSButton.secondary(
                onPressed: () async {
                  DSSonner.show(
                    ctx,
                    DSToast(
                      title: const Text('Stacked'),
                      description: const Text('Multiple toasts stacked.'),
                    ),
                  );
                  DSSonner.show(
                    ctx,
                    DSToast(
                      title: const Text('Second'),
                      description: const Text('Sonner empilha automaticamente.'),
                    ),
                  );
                },
                child: const Text('Show Stacked'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
