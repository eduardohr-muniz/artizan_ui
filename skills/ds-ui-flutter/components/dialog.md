# Dialog

A modal dialog that interrupts the user.



```dart


final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DSButton.outline(
      child: const Text('Edit Profile'),
      onPressed: () {
        showDSDialog(
          context: context,
          builder: (context) => DSDialog(
            title: const Text('Edit Profile'),
            description: const Text(
                "Make changes to your profile here. Click save when you're done"),
            actions: const [DSButton(child: Text('Save changes'))],
            child: Container(
              width: 375,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
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
                            flex: 3,
                            child: DSInput(initialValue: p.value),
                          ),
                        ],
                      ),
                    ).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
```



## Alert



```dart
class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DSButton.outline(
      child: const Text('Show Dialog'),
      onPressed: () {
        showDSDialog(
          context: context,
          builder: (context) => DSDialog.alert(
            title: const Text('Are you absolutely sure?'),
            description: const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
              ),
            ),
            actions: [
              DSButton.outline(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              DSButton(
                child: const Text('Continue'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
      },
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

final profile = [
  (title: 'Name', value: 'Alexandru'),
  (title: 'Username', value: 'nank1ro'),
];

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  var titlePinned = false;
  var descriptionPinned = false;
  var actionsPinned = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Dialog',
      editable: [
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
          child: const Text('Edit Profile'),
          onPressed: () {
            showDSDialog(
              context: context,
              builder: (context) => DSDialog(
                title: const Text('Edit Profile'),
                description: const Text(
                  "Make changes to your profile here. Click save when you're done",
                ),
                actions: const [DSButton(child: Text('Save changes'))],
                titlePinned: titlePinned,
                descriptionPinned: descriptionPinned,
                actionsPinned: actionsPinned,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                child: Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                flex: 3,
                                child: DSInput(initialValue: p.value),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            );
          },
        ),
        DSButton.outline(
          child: const Text('Show Dialog'),
          onPressed: () {
            showDSDialog(
              context: context,
              builder: (context) => DSDialog.alert(
                title: const Text('Are you absolutely sure?'),
                titlePinned: titlePinned,
                descriptionPinned: descriptionPinned,
                actionsPinned: actionsPinned,
                description: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
                  ),
                ),
                actions: [
                  DSButton.outline(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  DSButton(
                    child: const Text('Continue'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

```
