# Segmented

A segmented button control — a row of choices where one (or more) can be selected at a time. Wraps Flutter's `SegmentedButton` with DS theme styling.

## Single selection

```dart
DSSegmented<String>(
  segments: const ['Day', 'Week', 'Month'],
  selected: {_selected},
  segmentBuilder: (value) => DSSegmentedItem(
    value: value,
    label: Text(value),
  ),
  onSelectionChanged: (set) => setState(() => _selected = set.first),
)
```

## Multi-selection

```dart
DSSegmented<String>(
  segments: const ['Bold', 'Italic', 'Underline'],
  selected: _selectedFormats,
  multiSelectionEnabled: true,
  emptySelectionAllowed: true,
  segmentBuilder: (value) => DSSegmentedItem(
    value: value,
    label: Text(value),
  ),
  onSelectionChanged: (set) => setState(() => _selectedFormats = set),
)
```

## With icons

```dart
DSSegmented<String>(
  segments: const ['list', 'grid'],
  selected: {_view},
  segmentBuilder: (value) => DSSegmentedItem(
    value: value,
    icon: Icon(value == 'list' ? LucideIcons.list : LucideIcons.layoutGrid),
  ),
  onSelectionChanged: (set) => setState(() => _view = set.first),
)
```

## API

### `DSSegmented<T>`

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `segments` | `List<T>` | required | All available segment values |
| `selected` | `Set<T>` | required | Currently selected value(s) |
| `segmentBuilder` | `DSSegmentedItem<T> Function(T)` | required | Builds each segment widget |
| `onSelectionChanged` | `Function(Set<T>)?` | — | Called when selection changes |
| `multiSelectionEnabled` | `bool` | `false` | Allow more than one selected at a time |
| `emptySelectionAllowed` | `bool` | `false` | Allow deselecting all segments |

### `DSSegmentedItem<T>`

Extends `ButtonSegment<T>`. Accepts `value`, `icon`, `label`, `tooltip`, `enabled`.

## Example

```dart
import 'package:flutter/material.dart';
import 'package:artizan_ui/artizan_ui.dart';

class SegmentedPage extends StatefulWidget {
  const SegmentedPage({super.key});

  @override
  State<SegmentedPage> createState() => _SegmentedPageState();
}

class _SegmentedPageState extends State<SegmentedPage> {
  String _period = 'Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DSSegmented<String>(
          segments: const ['Day', 'Week', 'Month'],
          selected: {_period},
          segmentBuilder: (value) => DSSegmentedItem(
            value: value,
            label: Text(value),
          ),
          onSelectionChanged: (set) => setState(() => _period = set.first),
        ),
      ),
    );
  }
}
```
