# Sheet

Extends the Dialog component to display content that complements the main content of the screen.



```dart
DSButton.outline(
  child: const Text('Open'),
  onPressed: () => showDSSheet(
    side: DSSheetSide.right,
    context: context,
    builder: (context) => const EditProfileSheet(),
  ),
),

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key, required this.side});

  final DSSheetSide side;

  @override
  Widget build(BuildContext context) {
    return DSSheet(
      constraints: side == DSSheetSide.left || side == DSSheetSide.right
          ? const BoxConstraints(maxWidth: 512)
          : null,
      title: const Text('Edit Profile'),
      description: const Text(
          "Make changes to your profile here. Click save when you're done"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: profile
              .map(
                (p) => Row(
                  children: [
                    Expanded(
                      child: Text(
                        p.title,
                        textAlign: TextAlign.end,
                        style: context.dsTextTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 5,
                      child: DSInput(initialValue: p.value),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      actions: const [
        DSButton(child: Text('Save changes')),
      ],
    );
  }
}
```



## Side

Use the `side` property to `showDSSheet` to indicate the edge of the screen where the component will appear. The values can be `top`, `right`, `bottom` or `left`.



```dart
Row(
  mainAxisSize: MainAxisSize.min,
  spacing: 16,
  children: [
    Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        DSButton.outline(
          width: 100,
          child: const Text('Top'),
          onPressed: () => showDSSheet(
            side: DSSheetSide.top,
            context: context,
            builder: (context) =>
                const EditProfileSheet(side: DSSheetSide.top),
          ),
        ),
        DSButton.outline(
          width: 100,
          child: const Text('Bottom'),
          onPressed: () => showDSSheet(
            side: DSSheetSide.bottom,
            context: context,
            builder: (context) => const EditProfileSheet(
                side: DSSheetSide.bottom),
          ),
        ),
      ],
    ),
    Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        DSButton.outline(
          width: 100,
          child: const Text('Right'),
          onPressed: () => showDSSheet(
            side: DSSheetSide.right,
            context: context,
            builder: (context) => const EditProfileSheet(
                side: DSSheetSide.right),
          ),
        ),
        DSButton.outline(
          width: 100,
          child: const Text('Left'),
          onPressed: () => showDSSheet(
            side: DSSheetSide.left,
            context: context,
            builder: (context) => const EditProfileSheet(
                side: DSSheetSide.left),
          ),
        ),
      ],
    ),
  ],
),

// See EditProfileSheet code in the previous code example
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/extensions.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  State<SheetPage> createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
  var side = DSSheetSide.bottom;
  var draggable = false;
  var titlePinned = false;
  var descriptionPinned = false;
  var actionsPinned = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Sheet',
      editable: [
        MyEnumProperty(
          label: 'Side',
          value: side,
          values: DSSheetSide.values,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                side = value;
              });
            }
          },
        ),
        MyBoolProperty(
          label: 'Draggable',
          value: draggable,
          onChanged: (value) => setState(() => draggable = value),
        ),
        MyBoolProperty(
          label: 'titlePinned',
          value: titlePinned,
          onChanged: (v) => setState(() => titlePinned = v),
        ),
        MyBoolProperty(
          label: 'descriptionPinned',
          value: descriptionPinned,
          onChanged: (v) => setState(() => descriptionPinned = v),
        ),
        MyBoolProperty(
          label: 'actionsPinned',
          value: actionsPinned,
          onChanged: (v) => setState(() => actionsPinned = v),
        ),
      ],
      children: [
        DSButton.outline(
          child: const Text('Open'),
          onPressed: () {
            showDSSheet(
              context: context,
              side: side,
              builder: (context) {
                return DSSheet(
                  draggable: draggable,
                  constraints:
                      side == DSSheetSide.left || side == DSSheetSide.right
                      ? const BoxConstraints(maxWidth: 512)
                      : null,
                  title: const Text('Edit Profile'),
                  description: const Text(
                    "Make changes to your profile here. Click save when you're done",
                  ),
                  actions: const [DSButton(child: Text('Save changes'))],
                  titlePinned: titlePinned,
                  descriptionPinned: descriptionPinned,
                  actionsPinned: actionsPinned,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16,
                      children:
                          (profile.map(
                                    (p) => Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            p.title,
                                            textAlign: TextAlign.end,
                                            style: context.dsTextTheme.bodySmall,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          flex: 5,
                                          child: DSInput(
                                            initialValue: p.value,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ) *
                                  20)
                              .toList(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

```
