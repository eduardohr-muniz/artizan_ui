# SegmentedBadge

A pill-shaped toggle control built from `DSBadge` items. Used for compact inline selections — e.g. switching between filter values, view modes, or status options. The selected item is rendered as a primary badge; unselected items use a secondary/background style.

## Basic usage

```dart
DSSegmentedBadge<String>(
  value: _selected,
  options: const ['All', 'Active', 'Archived'],
  onChanged: (v) => setState(() => _selected = v),
  childBuilder: (v) => Text(v),
)
```

## With a label

```dart
DSSegmentedBadge<String>(
  label: const Text('Status'),
  value: _status,
  options: const ['Draft', 'Published', 'Archived'],
  onChanged: (v) => setState(() => _status = v),
  childBuilder: (v) => Text(v),
)
```

## With enum values

```dart
enum ViewMode { list, grid, board }

DSSegmentedBadge<ViewMode>(
  value: _mode,
  options: ViewMode.values,
  onChanged: (v) => setState(() => _mode = v),
  childBuilder: (v) => Icon(switch (v) {
    ViewMode.list  => LucideIcons.list,
    ViewMode.grid  => LucideIcons.layoutGrid,
    ViewMode.board => LucideIcons.kanban,
  }, size: 14),
)
```

## API

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `value` | `T` | Currently selected option |
| `options` | `List<T>` | All available options |
| `onChanged` | `Function(T)` | Called when the user taps a different option |
| `childBuilder` | `Widget Function(T)` | Builds the content of each badge |
| `label` | `Widget?` | Optional label displayed above the control |

## Example

```dart
import 'package:flutter/material.dart';
import 'package:ds_ui/ds_ui.dart';

class SegmentedBadgePage extends StatefulWidget {
  const SegmentedBadgePage({super.key});

  @override
  State<SegmentedBadgePage> createState() => _SegmentedBadgePageState();
}

class _SegmentedBadgePageState extends State<SegmentedBadgePage> {
  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DSSegmentedBadge<String>(
          label: const Text('Filter'),
          value: _filter,
          options: const ['All', 'Active', 'Archived'],
          onChanged: (v) => setState(() => _filter = v),
          childBuilder: (v) => Text(v),
        ),
      ),
    );
  }
}
```
