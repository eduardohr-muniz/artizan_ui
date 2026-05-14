# EmptyState

Displays a placeholder when there is no content to show — e.g. an empty list, a zero-result search, or a permissions wall. Comes in four layout variants suited to different contexts.

## Variants

### `minimal` (default)

Centered icon + optional title/subtitle. No action button.

```dart
DSEmptyState.minimal(
  icon: const Icon(LucideIcons.inbox),
  title: 'No items yet',
  subtitle: 'Items you create will appear here.',
)
```

### `small`

Same as minimal but accepts an optional action widget below the text.

```dart
DSEmptyState.small(
  icon: const Icon(LucideIcons.folderOpen),
  title: 'No results',
  subtitle: 'Try adjusting your filters.',
  action: DSButton(
    onPressed: () {},
    child: const Text('Clear filters'),
  ),
)
```

### `inTable` / `nonTable`

Horizontal layout — icon on the left, text on the right. Designed to be placed inside a table cell or a content area that already provides its own padding. `nonTable` is identical in structure.

```dart
DSEmptyState.intable(
  icon: const Icon(LucideIcons.fileX),
  title: 'No records found',
  subtitle: 'Add a record to get started.',
  action: DSButton.outline(
    onPressed: () {},
    child: const Text('Add record'),
  ),
)
```

## API

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `icon` | `Widget` | required | Icon widget (sized/colored by the component) |
| `title` | `String?` | — | Bold short label |
| `subtitle` | `String?` | — | Muted description text |
| `action` | `Widget?` | — | CTA button (not available on `minimal`) |
| `color` | `Color?` | theme foreground | Icon and avatar background tint |
| `backgroundColor` | `Color?` | primary @ 20% opacity | Avatar circle fill |
| `showAvatar` | `bool` | `true` | Wrap the icon in a `CircleAvatar` |
| `textAlignment` | `TextAlign?` | — | Alignment for title and subtitle text |

## Example

```dart
import 'package:flutter/material.dart';
import 'package:artizan_ui/artizan_ui.dart';

class EmptyStatePage extends StatelessWidget {
  const EmptyStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DSEmptyState.small(
          icon: const Icon(LucideIcons.inbox),
          title: 'Your inbox is empty',
          subtitle: 'New messages will appear here.',
          action: DSButton(
            onPressed: () {},
            child: const Text('Compose'),
          ),
        ),
      ),
    );
  }
}
```
