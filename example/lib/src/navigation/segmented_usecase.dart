import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsSegmented extends StatelessWidget {
  const DsSegmented({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class DsSegmentedBadge extends StatelessWidget {
  const DsSegmentedBadge({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

enum _View { list, grid, table }

enum _Status { all, active, archived }

@widgetbook.UseCase(name: 'Default', type: DsSegmented)
Widget segmentedDefault(BuildContext context) {
  final cs = context.dsColors;

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSSegmented<_View>(
  selected: {_View.list},
  segments: _View.values,
  segmentBuilder: (v) => DSSegmentedItem(
    value: v,
    label: Text(v.name),
  ),
  onSelectionChanged: (selected) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('View',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: cs.foreground)),
        const SizedBox(height: 8),
        DSSegmented<_View>(
          selected: {_View.list},
          segments: _View.values,
          segmentBuilder: (v) => DSSegmentedItem(
            value: v,
            label: Text(v.name[0].toUpperCase() + v.name.substring(1)),
          ),
          onSelectionChanged: (_) {},
        ),
        const SizedBox(height: 24),
        Text('With icons',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: cs.foreground)),
        const SizedBox(height: 8),
        DSSegmented<_View>(
          selected: {_View.grid},
          segments: _View.values,
          segmentBuilder: (v) => DSSegmentedItem(
            value: v,
            icon: Icon(_viewIcon(v), size: 14),
            label: Text(v.name[0].toUpperCase() + v.name.substring(1)),
          ),
          onSelectionChanged: (_) {},
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Badge', type: DsSegmentedBadge)
Widget segmentedBadge(BuildContext context) {
  return ScaffoldBase(
    scrollable: true,
    code: '''
DSSegmentedBadge<_Status>(
  value: _Status.all,
  options: _Status.values,
  label: Text('Status'),
  childBuilder: (s) => Text(s.name),
  onChanged: (value) {},
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSSegmentedBadge<_Status>(
          value: _Status.all,
          options: _Status.values,
          label: const Text('Status'),
          childBuilder: (s) => Text(s.name[0].toUpperCase() + s.name.substring(1)),
          onChanged: (_) {},
        ),
      ],
    ),
  );
}

IconData _viewIcon(_View v) => switch (v) {
      _View.list => LucideIcons.list,
      _View.grid => LucideIcons.layoutGrid,
      _View.table => LucideIcons.table,
    };
