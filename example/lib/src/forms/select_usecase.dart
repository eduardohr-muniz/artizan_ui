import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsSelect extends StatelessWidget {
  const DsSelect({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

final _fruits = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape'];
final _roles = ['Admin', 'Editor', 'Viewer', 'Guest'];

@widgetbook.UseCase(name: 'Default', type: DsSelect)
Widget selectDefault(BuildContext context) {
  final placeholder =
      context.knobs.string(label: 'Placeholder', initialValue: 'Select a fruit...');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSSelect<String>(
  placeholder: Text('Select a fruit...'),
  selectedOptionBuilder: (ctx, val) => Text(val),
  options: [
    DSOption(value: 'Apple', child: Text('Apple')),
    DSOption(value: 'Banana', child: Text('Banana')),
  ],
  onChanged: (value) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSSelect<String>(
          enabled: enabled,
          placeholder: Text(placeholder),
          selectedOptionBuilder: (ctx, val) => Text(val),
          options: [
            for (final fruit in _fruits) DSOption(value: fruit, child: Text(fruit)),
          ],
          onChanged: (_) {},
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'With Search', type: DsSelect)
Widget selectWithSearch(BuildContext context) {
  return ScaffoldBase(
    scrollable: true,
    code: '''
DSSelectWithSearch<String>(
  placeholder: Text('Search roles...'),
  searchPlaceholder: Text('Search...'),
  selectedOptionBuilder: (ctx, val) => Text(val),
  onSearchChanged: (query) {},
  options: [
    DSOption(value: 'Admin', child: Text('Admin')),
    DSOption(value: 'Editor', child: Text('Editor')),
  ],
  onChanged: (value) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Role'),
        const SizedBox(height: 8),
        DSSelectWithSearch<String>(
          placeholder: const Text('Search roles...'),
          searchPlaceholder: const Text('Search...'),
          selectedOptionBuilder: (ctx, val) => Text(val),
          onSearchChanged: (_) {},
          options: [
            for (final role in _roles) DSOption(value: role, child: Text(role)),
          ],
          onChanged: (_) {},
        ),
      ],
    ),
  );
}
