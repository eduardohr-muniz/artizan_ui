import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsBreadcrumb extends StatelessWidget {
  const DsBreadcrumb({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Default', type: DsBreadcrumb)
Widget breadcrumbDefault(BuildContext context) {
  return ScaffoldBase(
    scrollable: true,
    code: '''
DSBreadcrumb(children: [
  DSBreadcrumbLink(onPressed: () {}, child: Text('Home')),
  DSBreadcrumbLink(onPressed: () {}, child: Text('Components')),
  Text('Breadcrumb'),
])''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSBreadcrumb(
          children: [
            DSBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
            DSBreadcrumbLink(onPressed: () {}, child: const Text('Components')),
            const Text('Breadcrumb'),
          ],
        ),
        const SizedBox(height: 24),
        DSBreadcrumb(
          separator: const Icon(LucideIcons.chevronRight, size: 14),
          children: [
            DSBreadcrumbLink(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(LucideIcons.house, size: 14),
                  SizedBox(width: 4),
                  Text('Home')
                ],
              ),
            ),
            DSBreadcrumbLink(onPressed: () {}, child: const Text('Settings')),
            const Text('Profile'),
          ],
        ),
      ],
    ),
  );
}
