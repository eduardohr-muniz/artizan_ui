import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsDialog extends StatelessWidget {
  const DsDialog({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Default', type: DsDialog)
Widget dialogDefault(BuildContext context) {
  return ScaffoldBase(
    code: '''
await showDSDialog(
  context: context,
  builder: (_) => DSDialog(
    title: Text('Edit profile'),
    description: Text('Make changes to your profile here.'),
    actions: [
      DSButton.outline(onPressed: () async {}, child: Text('Cancel')),
      DSButton(onPressed: () async {}, child: Text('Save changes')),
    ],
    child: DSTextFormField(label: Text('Name'), placeholder: Text('João Silva')),
  ),
)''',
    child: DSButton(
      onPressed: () async {
        await showDSDialog(
          context: context,
          builder: (_) => DSDialog(
            title: const Text('Edit profile'),
            description:
                const Text('Make changes to your profile here. Click save when done.'),
            actions: [
              DSButton.outline(onPressed: () async {}, child: const Text('Cancel')),
              DSButton(onPressed: () async {}, child: const Text('Save changes')),
            ],
            child: const Column(
              children: [
                DSTextFormField(label: Text('Name'), placeholder: Text('João Silva')),
                SizedBox(height: 12),
                DSTextFormField(
                    label: Text('Email'), placeholder: Text('joao@email.com'),),
              ],
            ),
          ),
        );
      },
      child: const Text('Open Dialog'),
    ),
  );
}

@widgetbook.UseCase(name: 'Alert', type: DsDialog)
Widget dialogAlert(BuildContext context) {
  return ScaffoldBase(
    code: '''
await showDSDialog(
  context: context,
  builder: (_) => DSDialog.alert(
    title: Text('Delete account'),
    description: Text('This action cannot be undone.'),
    actions: [
      DSButton.outline(onPressed: () async {}, child: Text('Cancel')),
      DSButton.destructive(onPressed: () async {}, child: Text('Delete')),
    ],
  ),
)''',
    child: DSButton.destructive(
      onPressed: () async {
        await showDSDialog(
          context: context,
          builder: (_) => DSDialog.alert(
            title: const Text('Delete account'),
            description: const Text(
              'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
            ),
            actions: [
              DSButton.outline(onPressed: () async {}, child: const Text('Cancel')),
              DSButton.destructive(onPressed: () async {}, child: const Text('Delete')),
            ],
          ),
        );
      },
      child: const Text('Delete Account'),
    ),
  );
}
