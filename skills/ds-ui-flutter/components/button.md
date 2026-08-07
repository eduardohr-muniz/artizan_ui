# Button

Displays a button or a component that looks like a button.

## Primary



```dart
DSButton(
  child: const Text('Primary'),
  onPressed: () {},
)
```



## Secondary



```dart
DSButton.secondary(
  child: const Text('Secondary'),
  onPressed: () {},
)
```



## Destructive



```dart
DSButton.destructive(
  child: const Text('Destructive'),
  onPressed: () {},
)
```



## Outline



```dart
DSButton.outline(
  child: const Text('Outline'),
  onPressed: () {},
)
```



## Ghost



```dart
DSButton.ghost(
  child: const Text('Ghost'),
  onPressed: () {},
)
```



## Link



```dart
DSButton.link(
  child: const Text('Link'),
  onPressed: () {},
)
```



## Darken

High-contrast variant: black background in light mode, white background in dark mode. Ideal for prominent CTAs.

```dart
DSButton.darken(
  child: const Text('Darken'),
  onPressed: () {},
)
```



## Text and Icon



```dart
DSButton(
  onPressed: () {},
  leading: const Icon(LucideIcons.mail),
  child: const Text('Login with Email'),
)
```



## Loading



```dart
DSButton(
  onPressed: () {},
  leading: SizedBox.square(
    dimension: 16,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: DSColors.theme(context).primaryForeground,
    ),
  ),
  child: const Text('Please wait'),
)
```



## Gradient and DSow



```dart
DSButton(
  onPressed: () {},
  gradient: const LinearGradient(colors: [
    Colors.cyan,
    Colors.indigo,
  ]),
  shadows: [
    BoxDSow(
      color: Colors.blue.withOpacity(.4),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ],
  child: const Text('Gradient with DSow'),
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  var size = DSButtonSize.regular;
  var enabled = true;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: BaseScaffold(
        appBarTitle: 'Button',
        editable: [
          MyEnumProperty(
            label: 'Size',
            value: size,
            values: DSButtonSize.values,
            onChanged: (value) {
              if (value != null) {
                setState(() => size = value);
              }
            },
          ),
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
        ],
        children: [
          DSButton(
            size: size,
            enabled: enabled,
            child: const Text('Primary'),
            onPressed: () => print('Primary'),
          ),
          DSButton.secondary(
            size: size,
            enabled: enabled,
            child: const Text('Secondary'),
            onPressed: () => print('Secondary'),
          ),
          DSButton.destructive(
            size: size,
            enabled: enabled,
            child: const Text('Destructive'),
          ),
          DSButton.outline(
            size: size,
            enabled: enabled,
            child: const Text('Outline'),
          ),
          DSButton.ghost(
            size: size,
            enabled: enabled,
            child: const Text('Ghost'),
          ),
          DSButton.link(
            size: size,
            enabled: enabled,
            child: const Text('Link'),
          ),
          DSButton.darken(
            size: size,
            enabled: enabled,
            child: const Text('Darken'),
            onPressed: () => print('Darken'),
          ),
          DSButton(
            size: size,
            enabled: enabled,
            leading: const Icon(LucideIcons.mail),
            child: const Text('Login with Email'),
          ),
          DSButton(
            size: size,
            enabled: enabled,
            leading: SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: DSColors.theme(context).primaryForeground,
              ),
            ),
            child: const Text('Please wait'),
          ),
          DSButton(
            size: size,
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
            child: const Text('Gradient with DSow'),
          ),
        ],
      ),
    );
  }
}

```
