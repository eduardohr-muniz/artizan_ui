import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsEmptyState extends StatelessWidget {
  const DsEmptyState({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Default', type: DsEmptyState)
Widget emptyStateDefault(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'No results found');
  final subtitle = context.knobs
      .string(label: 'Subtitle', initialValue: 'Try adjusting your search or filters.');
  final showAction = context.knobs.boolean(label: 'Show action', initialValue: true);

  return ScaffoldBase(
    code: '''
DSEmptyState(
  icon: Icon(LucideIcons.searchX),
  title: 'No results found',
  subtitle: 'Try adjusting your search or filters.',
  action: DSButton(onPressed: () async {}, child: Text('Clear filters')),
)''',
    child: DSEmptyState(
      icon: const Icon(LucideIcons.searchX),
      title: title,
      subtitle: subtitle,
      action: showAction
          ? DSButton(onPressed: () async {}, child: const Text('Clear filters'))
          : null,
    ),
  );
}

@widgetbook.UseCase(name: 'In Table', type: DsEmptyState)
Widget emptyStateInTable(BuildContext context) => ScaffoldBase(
      code: '''
DSEmptyState.intable(
  icon: Icon(LucideIcons.inbox),
  title: 'No orders yet',
  subtitle: 'Orders will appear here once created.',
)''',
      child: DSEmptyState.intable(
        icon: const Icon(LucideIcons.inbox),
        title: 'No orders yet',
        subtitle: 'Orders will appear here once created.',
      ),
    );

@widgetbook.UseCase(name: 'Minimal', type: DsEmptyState)
Widget emptyStateMinimal(BuildContext context) => ScaffoldBase(
      code: '''
DSEmptyState.minimal(
  icon: Icon(LucideIcons.folderOpen),
  title: 'Nothing here',
)''',
      child: DSEmptyState.minimal(
        icon: const Icon(LucideIcons.folderOpen),
        title: 'Nothing here',
      ),
    );

@widgetbook.UseCase(name: 'Small', type: DsEmptyState)
Widget emptyStateSmall(BuildContext context) => ScaffoldBase(
      code: '''
DSEmptyState.small(
  icon: Icon(LucideIcons.fileX),
  title: 'No files',
  subtitle: 'Upload a file to get started.',
)''',
      child: DSEmptyState.small(
        icon: const Icon(LucideIcons.fileX),
        title: 'No files',
        subtitle: 'Upload a file to get started.',
      ),
    );
