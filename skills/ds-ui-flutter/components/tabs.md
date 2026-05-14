# Tabs

A set of layered sections of content—known as tab panels—that are displayed one at a time.



```dart
class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DSTabs<String>(
      value: 'account',
      tabBarConstraints: const BoxConstraints(maxWidth: 400),
      contentConstraints: const BoxConstraints(maxWidth: 400),
      tabs: [
        DSTab(
          value: 'account',
          content: DSCard(
            title: const Text('Account'),
            description: const Text(
                "Make changes to your account here. Click save when you're done."),
            footer: const DSButton(child: Text('Save changes')),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                DSInputFormField(
                  label: const Text('Name'),
                  initialValue: 'Ale',
                ),
                const SizedBox(height: 8),
                DSInputFormField(
                  label: const Text('Username'),
                  initialValue: 'nank1ro',
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          child: const Text('Account'),
        ),
        DSTab(
          value: 'password',
          content: DSCard(
            title: const Text('Password'),
            description: const Text(
                "Change your password here. After saving, you'll be logged out."),
            footer: const DSButton(child: Text('Save password')),
            child: Column(
              children: [
                const SizedBox(height: 16),
                DSInputFormField(
                  label: const Text('Current password'),
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                DSInputFormField(
                  label: const Text('New password'),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          child: const Text('Password'),
        ),
      ],
    );
  }
}
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: "Tabs",
      wrapChildrenInScrollable: false,
      wrapSingleChildInColumn: false,
      alignment: Alignment.topCenter,
      children: [
        DSTabs(
          value: 'account',
          tabBarConstraints: const BoxConstraints(maxWidth: 400),
          contentConstraints: const BoxConstraints(maxWidth: 400),
          onChanged: (value) => print(value),
          tabs: [
            DSTab(
              value: 'account',
              content: DSCard(
                title: const Text('Account'),
                description: const Text(
                  "Make changes to your account here. Click save when you're done.",
                ),
                footer: const DSButton(child: Text('Save changes')),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    DSInputFormField(
                      label: const Text('Name'),
                      initialValue: 'Ale',
                    ),
                    const SizedBox(height: 8),
                    DSInputFormField(
                      label: const Text('Username'),
                      initialValue: 'nank1ro',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              child: const Text('Account'),
            ),
            DSTab(
              value: 'password',
              content: DSCard(
                title: const Text('Password'),
                description: const Text(
                  "Change your password here. After saving, you'll be logged out.",
                ),
                footer: const DSButton(child: Text('Save password')),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    DSInputFormField(
                      label: const Text('Current password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    DSInputFormField(
                      label: const Text('New password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              child: const Text('Password'),
            ),
          ],
        ),
      ],
    );
  }
}

```
