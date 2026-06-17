# Toast

A succinct message that is displayed temporarily.

> **Widgetbook:** `DSToaster`/`DSSonner` fills the entire screen (stack overlay). Place `Center` **inside** the `DSToaster` child, not outside it:
>
> ```dart
> DSToaster(
>   child: Builder(builder: (ctx) => Center(
>     child: Column(mainAxisSize: MainAxisSize.min, children: [...]),
>   )),
> )
> ```



```dart
DSButton.outline(
  child: const Text('Add to calendar'),
  onPressed: () {
    DSToaster.of(context).show(
      DSToast(
        title: const Text('Scheduled: Catch up'),
        description:
            const Text('Friday, February 10, 2023 at 5:57 PM'),
        action: DSButton.outline(
          child: const Text('Undo'),
          onPressed: () => DSToaster.of(context).hide(),
        ),
      ),
    );
  },
),
```



## Simple



```dart
DSButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    DSToaster.of(context).show(
      const DSToast(
        description: Text('Your message has been sent.'),
      ),
    );
  },
),
```



## With Title



```dart
DSButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    DSToaster.of(context).show(
      const DSToast(
        title: Text('Uh oh! Something went wrong'),
        description:
            Text('There was a problem with your request'),
      ),
    );
  },
),
```



## With Action



```dart
DSButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    DSToaster.of(context).show(
      DSToast(
        title: const Text('Uh oh! Something went wrong'),
        description:
            const Text('There was a problem with your request'),
        action: DSButton.outline(
          child: const Text('Try again'),
          onPressed: () => DSToaster.of(context).hide(),
        ),
      ),
    );
  },
),
```



## Destructive



```dart
DSButton.outline(
  child: const Text('Show Toast'),
  onPressed: () {
    DSToaster.of(context).show(
      DSToast.destructive(
        title: const Text('Uh oh! Something went wrong'),
        description:
            const Text('There was a problem with your request'),
        action: DSButton.destructive(
          child: const Text('Try again'),
          decoration: DSDecoration(
            border: DSBorder.all(
              color: DSColors.theme(context).destructiveForeground,
              width: 1,
            ),
          ),
          onPressed: () => DSToaster.of(context).hide(),
        ),
      ),
    );
  },
),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dependencies/dependencies.dart';

enum Alignm {
  topRight,
  topLeft,
  bottomRight,
  bottomLeft,
  centerRight,
  centerLeft,
  center,
  topCenter,
  bottomCenter;

  Alignment toAlignment() {
    return switch (this) {
      topRight => Alignment.topRight,
      topLeft => Alignment.topLeft,
      bottomRight => Alignment.bottomRight,
      bottomLeft => Alignment.bottomLeft,
      centerRight => Alignment.centerRight,
      centerLeft => Alignment.centerLeft,
      center => Alignment.center,
      topCenter => Alignment.topCenter,
      bottomCenter => Alignment.bottomCenter,
    };
  }
}

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  var alignment = Alignm.bottomRight;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Toast',
      editable: [
        MyEnumProperty<Alignm>(
          label: 'Alignment',
          value: alignment,
          values: Alignm.values,
          onChanged: (v) {
            if (v != null) {
              setState(() {
                alignment = v;
              });
            }
          },
        ),
      ],
      children: [
        DSButton.outline(
          child: const Text('Add to calendar'),
          onPressed: () {
            final toaster = DSToaster.of(context);
            toaster.show(
              DSToast(
                alignment: alignment.toAlignment(),
                title: const Text('Scheduled: Catch up'),
                description: const Text('Friday, February 10, 2023 at 5:57 PM'),
                action: DSButton.outline(
                  child: const Text('Undo'),
                  onPressed: () => toaster.hide(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

```
