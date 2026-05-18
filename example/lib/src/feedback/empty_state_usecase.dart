import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsEmptyState extends StatelessWidget {
  const DsEmptyState({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) => Scaffold(
      backgroundColor: context.dsColors.background,
      body: child,
    );

@widgetbook.UseCase(name: 'Default', type: DsEmptyState)
Widget emptyStateDefault(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'No results found');
  final subtitle = context.knobs.string(label: 'Subtitle', initialValue: 'Try adjusting your search or filters.');
  final showAction = context.knobs.boolean(label: 'Show action', initialValue: true);

  return _page(context, Center(
    child: DSEmptyState(
      icon: const Icon(LucideIcons.searchX),
      title: title,
      subtitle: subtitle,
      action: showAction
          ? DSButton(onPressed: () async {}, child: const Text('Clear filters'))
          : null,
    ),
  ));
}

@widgetbook.UseCase(name: 'In Table', type: DsEmptyState)
Widget emptyStateInTable(BuildContext context) => _page(
      context,
      DSEmptyState.intable(
        icon: const Icon(LucideIcons.inbox),
        title: 'No orders yet',
        subtitle: 'Orders will appear here once created.',
      ),
    );

@widgetbook.UseCase(name: 'Minimal', type: DsEmptyState)
Widget emptyStateMinimal(BuildContext context) => _page(
      context,
      Center(
        child: DSEmptyState.minimal(
          icon: const Icon(LucideIcons.folderOpen),
          title: 'Nothing here',
        ),
      ),
    );

@widgetbook.UseCase(name: 'Small', type: DsEmptyState)
Widget emptyStateSmall(BuildContext context) => _page(
      context,
      Center(
        child: DSEmptyState.small(
          icon: const Icon(LucideIcons.fileX),
          title: 'No files',
          subtitle: 'Upload a file to get started.',
        ),
      ),
    );
