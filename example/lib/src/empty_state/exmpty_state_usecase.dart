import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'InTable', type: ArtEmptyState)
Widget emptyStateInTable(BuildContext context) {
  return _base(
    child: ArtEmptyState.intable(
        icon: const Icon(Icons.search),
        color: Colors.grey,
        title: 'No tracked events for this Source',
        subtitle: 'Events appear when the Source starts sending data to Segment about your users and their activity.',
        action: ArtButton.link(
          child: const Text('Learn more'),
          onPressed: () {},
        )),
  );
}

@UseCase(name: 'Non Table', type: ArtEmptyState)
Widget emptyStateInList(BuildContext context) {
  return _base(
    child: ArtEmptyState.nonTable(
      icon: const Icon(Icons.lock),
      color: Colors.orange,
      subtitle: 'You need permission for these sources',
      title: 'To see these sources, request access.',
      action: ArtButton(
        onPressed: () {},
        child: const Text('List Action'),
      ),
    ),
  );
}

@UseCase(name: 'Small', type: ArtEmptyState)
Widget emptyStateInCard(BuildContext context) {
  return _base(
    child: ArtEmptyState.small(
      icon: const Icon(Icons.lock),
      color: Colors.orange,
      subtitle: 'You need permission for these sources',
      title: 'To see these sources, request access.',
      action: ArtButton(
        onPressed: () {},
        child: const Text('Request Access'),
      ),
    ),
  );
}

@UseCase(name: 'Minimal', type: ArtEmptyState)
Widget emptyStateMinimal(BuildContext context) {
  return _base(
    child: const ArtEmptyState.minimal(
      icon: Icon(Icons.touch_app_rounded),
      color: Colors.grey,
      title: 'No event selected',
    ),
  );
}

Widget _base({required Widget child}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: child,
      ),
    ),
  );
}
