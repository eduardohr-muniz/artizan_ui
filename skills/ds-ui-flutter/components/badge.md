# Badge

Displays a badge or a component that looks like a badge.

## Primary



```dart
DSBadge(
  child: const Text('Primary'),
)
```



## Secondary



```dart
DSBadge.secondary(
  child: const Text('Secondary'),
)
```



## Destructive



```dart
DSBadge.destructive(
  child: const Text('Destructive'),
)
```



## Outline



```dart
DSBadge.outline(
  child: const Text('Outline'),
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBarTitle: 'Badge',
      children: [
        DSBadge(child: Text('Primary')),
        DSBadge.secondary(child: Text('Secondary')),
        DSBadge.destructive(child: Text('Destructive')),
        DSBadge.outline(child: Text('Outline')),
      ],
    );
  }
}

```
