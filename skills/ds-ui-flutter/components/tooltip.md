# Tooltip

A popup that displays information related to an element when the element receives keyboard focus or the mouse hovers over it.


```dart
DSTooltip(
  builder: (context) => const Text('Add to library'),
  child: DSButton.outline(
    child: const Text('Hover/Focus'),
    onPressed: () {},
  ),
),
```


The tooltip works on hover only if the child uses a `DSGestureDetector`. If you don't use a `DSButton` or something similar that implements `DSGestureDetector` hover will not work.
If, for example, you want to just show an image as child, wrap it with `DSGestureDetector` to make it working.

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:dependencies/dependencies.dart';

class TooltipPage extends StatefulWidget {
  const TooltipPage({super.key});

  @override
  State<TooltipPage> createState() => _TooltipPageState();
}

class _TooltipPageState extends State<TooltipPage> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Tooltip',
      children: [
        DSTooltip(
          focusNode: focusNode,
          builder: (context) => const Text('Add to library'),
          child: DSButton.outline(
            focusNode: focusNode,
            child: const Text('Hover/Focus'),
          ),
        ),
      ],
    );
  }
}

```
