# IconButton

Displays an icon button or a component that looks like a button with an icon.

## Primary



```dart
DSIconButton(
  onPressed: () => print('Primary'),
  icon: const Icon(LucideIcons.rocket),
)
```



## Secondary



```dart
DSIconButton.secondary(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Secondary'),
)
```



## Destructive



```dart
DSIconButton.destructive(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Destructive'),
)
```



## Outline



```dart
DSIconButton.outline(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Outline'),
)
```



## Ghost



```dart
DSIconButton.ghost(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Ghost'),
)
```



## Loading



```dart
DSIconButton(
  icon: SizedBox.square(
    dimension: 16,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: DSColors.theme(context).primaryForeground,
    ),
  ),
)
```



## Gradient and DSow



```dart
DSIconButton(
  gradient: const LinearGradient(colors: [
    Colors.cyan,
    Colors.indigo,
  ]),
  shadows: [
    BoxDSow(
      color: Colors.blue.withValues(alpha: .4),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ],
  icon: const Icon(LucideIcons.rocket),
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class IconButtonPage extends StatefulWidget {
  const IconButtonPage({super.key});

  @override
  State<IconButtonPage> createState() => _IconButtonPageState();
}

class _IconButtonPageState extends State<IconButtonPage> {
  var enabled = true;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: BaseScaffold(
        appBarTitle: 'IconButton',
        editable: [
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
        ],
        children: [
          DSIconButton(
            enabled: enabled,
            onPressed: () => print('Primary'),
            icon: const Icon(LucideIcons.rocket),
          ),
          DSIconButton.secondary(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Secondary'),
          ),
          DSIconButton.destructive(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Destructive'),
          ),
          DSIconButton.outline(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Outline'),
          ),
          DSIconButton.ghost(
            enabled: enabled,
            icon: const Icon(LucideIcons.rocket),
            onPressed: () => print('Ghost'),
          ),
          DSIconButton(
            enabled: enabled,
            gradient: const LinearGradient(
              colors: [
                Colors.cyan,
                Colors.indigo,
              ],
            ),
            shadows: [
              BoxDSow(
                color: Colors.blue.withValues(alpha: .4),
                spreadRadius: 4,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            icon: const Icon(LucideIcons.rocket),
          ),
          DSIconButton(
            enabled: enabled,
            icon: SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: DSColors.theme(context).primaryForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```
