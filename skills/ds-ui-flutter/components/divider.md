# Divider

Visually divides content with a horizontal or vertical line. A thin wrapper around `ShadSeparator` that follows the DS naming convention.

## Horizontal

```dart
const DSDivider.horizontal()
```

## Vertical

```dart
const DSDivider.vertical()
```

## With customization

```dart
DSDivider.horizontal(
  thickness: 2,
  color: Colors.grey,
  margin: EdgeInsets.symmetric(vertical: 8),
  radius: BorderRadius.circular(2),
)
```

## API

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `margin` | `EdgeInsets?` | Space around the divider |
| `thickness` | `double?` | Line thickness |
| `color` | `Color?` | Line color (defaults to theme border color) |
| `radius` | `BorderRadiusGeometry?` | Rounded corners on the line ends |

## Example

```dart
import 'package:flutter/material.dart';
import 'package:ds_ui/ds_ui.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Above'),
          const DSDivider.horizontal(
            margin: EdgeInsets.symmetric(vertical: 8),
          ),
          const Text('Below'),
          const SizedBox(height: 16),
          IntrinsicHeight(
            child: Row(
              children: [
                const Text('Left'),
                const DSDivider.vertical(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
                const Text('Right'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```
