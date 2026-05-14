# Resizable

Resizable panel groups and layouts.



```dart
class BasicResizable extends StatelessWidget {
  const BasicResizable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: theme.radius,
          border: Border.all(
            color: theme.colorScheme.border,
          ),
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: DSResizablePanelGroup(
            children: [
              DSResizablePanel(
                id: 0,
                defaultSize: .5,
                minSize: .2,
                maxSize: .8,
                child: Center(
                  child: Text('One', style: theme.textTheme.large),
                ),
              ),
              DSResizablePanel(
                id: 1,
                defaultSize: .5,
                child: DSResizablePanelGroup(
                  axis: Axis.vertical,
                  children: [
                    DSResizablePanel(
                      id: 0,
                      defaultSize: .3,
                      child: Center(
                          child: Text('Two', style: theme.textTheme.large)),
                    ),
                    DSResizablePanel(
                      id: 1,
                      defaultSize: .7,
                      child: Align(
                          child: Text('Three', style: theme.textTheme.large)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```



Try resizing a panel, then double-click on the handle to reset to the default size.


## Vertical

Use the `axis` property to change the direction of the resizable panels.



```dart
class VerticalResizable extends StatelessWidget {
  const VerticalResizable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: theme.radius,
          border: Border.all(
            color: theme.colorScheme.border,
          ),
        ),
        child: ClipRRect(
          borderRadius: theme.radius,
          child: DSResizablePanelGroup(
            axis: Axis.vertical,
            children: [
              DSResizablePanel(
                id: 0,
                defaultSize: 0.3,
                minSize: 0.1,
                child: Center(
                  child: Text('Header', style: theme.textTheme.large),
                ),
              ),
              DSResizablePanel(
                id: 1,
                defaultSize: 0.7,
                minSize: 0.1,
                child: Center(
                  child: Text('Footer', style: theme.textTheme.large),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```



## Handle

You can show the handle by using the `showHandle` property.

You can customize it using the `handleIcon` or `handleIconSrc` properties.



```dart
class HandleResizable extends StatelessWidget {
  const HandleResizable({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: theme.radius,
            border: Border.all(
              color: theme.colorScheme.border,
            ),
          ),
          child: ClipRRect(
          borderRadius: theme.radius,
          child: DSResizablePanelGroup(
            showHandle: true,
            children: [
              DSResizablePanel(
                id: 0,
                defaultSize: .5,
                minSize: .2,
                child: Center(
                  child: Text('Sidebar', style: theme.textTheme.large),
                ),
              ),
              DSResizablePanel(
                id: 1,
                defaultSize: .5,
                minSize: .2,
                child: Center(
                  child: Text('Content', style: theme.textTheme.large),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class ResizablePage extends StatefulWidget {
  const ResizablePage({super.key});

  @override
  State<ResizablePage> createState() => _ResizablePageState();
}

class _ResizablePageState extends State<ResizablePage> {
  var visible = true;

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    return BaseScaffold(
      appBarTitle: 'Resizable',
      editable: [
        MyBoolProperty(
          value: visible,
          onChanged: (v) => setState(() => visible = v),
          label: 'One Visible',
        ),
      ],
      children: [
        SizedBox(
          width: 300,
          height: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: theme.radius,
              border: Border.all(
                color: theme.colorScheme.border,
              ),
            ),
            child: ClipRRect(
              borderRadius: theme.radius,
              child: DSResizablePanelGroup(
                mainAxisSize: MainAxisSize.min,
                showHandle: true,
                children: [
                  if (visible)
                    DSResizablePanel(
                      id: 0,
                      defaultSize: .5,
                      minSize: 0.1,
                      maxSize: 0.8,
                      child: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: Text(
                          'One',
                          style: theme.textTheme.large,
                        ),
                      ),
                    ),
                  DSResizablePanel(
                    defaultSize: 0.5,
                    id: 1,
                    child: DSResizablePanelGroup(
                      axis: Axis.vertical,
                      showHandle: true,
                      children: [
                        DSResizablePanel(
                          id: 0,
                          defaultSize: 0.4,
                          child: Container(
                            color: Colors.blue,
                            alignment: Alignment.center,
                            child: Text(
                              'Two',
                              style: theme.textTheme.large,
                            ),
                          ),
                        ),
                        DSResizablePanel(
                          id: 1,
                          defaultSize: 0.6,
                          child: Container(
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Text(
                              'Three',
                              style: theme.textTheme.large,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

```
