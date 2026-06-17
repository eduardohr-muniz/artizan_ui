# Context Menu

Displays a menu to the user — such as a set of actions or functions — triggered by a mouse right-click.



```dart



class ContextMenuPage extends StatelessWidget {
  const ContextMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DSContextMenuRegion(
          constraints: const BoxConstraints(minWidth: 300),
          items: [
            const DSContextMenuItem.inset(
              child: Text('Back'),
            ),
            const DSContextMenuItem.inset(
              enabled: false,
              child: Text('Forward'),
            ),
            const DSContextMenuItem.inset(
              child: Text('Reload'),
            ),
            const DSContextMenuItem.inset(
              trailing: Icon(LucideIcons.chevronRight),
              items: [
                DSContextMenuItem(
                  child: Text('Save Page As...'),
                ),
                DSContextMenuItem(
                  child: Text('Create Shortcut...'),
                ),
                DSContextMenuItem(
                  child: Text('Name Window...'),
                ),
                Divider(height: 8),
                DSContextMenuItem(
                  child: Text('Developer Tools'),
                ),
              ],
              child: Text('More Tools'),
            ),
            const Divider(height: 8),
            const DSContextMenuItem(
              leading: Icon(LucideIcons.check),
              child: Text('Show Bookmarks Bar'),
            ),
            const DSContextMenuItem.inset(child: Text('Show Full URLs')),
            const Divider(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 8, 8, 8),
              child: Text('People', style: context.dsTextTheme.bodySmall),
            ),
            const Divider(height: 8),
            DSContextMenuItem(
              leading: SizedBox.square(
                dimension: 16,
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: DSColors.theme(context).foreground,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              child: const Text('Pedro Duarte'),
            ),
            const DSContextMenuItem.inset(child: Text('Colm Tuite')),
          ],
          child: Container(
            width: 300,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: DSColors.theme(context).border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Right click here'),
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
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class ContextMenuPage extends StatelessWidget {
  const ContextMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = DSSeparator.horizontal(
      margin: EdgeInsets.symmetric(vertical: 4),
    );
    return BaseScaffold(
      appBarTitle: 'ContextMenu',
      children: [
        DSContextMenuRegion(
          constraints: const BoxConstraints(minWidth: 300),
          items: [
            const DSContextMenuItem.inset(
              child: Text('Back'),
            ),
            const DSContextMenuItem.inset(
              enabled: false,
              child: Text('Forward'),
            ),
            const DSContextMenuItem.inset(
              child: Text('Reload'),
            ),
            const DSContextMenuItem.inset(
              trailing: Icon(LucideIcons.chevronRight),
              items: [
                DSContextMenuItem(
                  child: Text('Save Page As...'),
                ),
                DSContextMenuItem(
                  child: Text('Create Shortcut...'),
                ),
                DSContextMenuItem(
                  child: Text('Name Window...'),
                ),
                divider,
                DSContextMenuItem(
                  child: Text('Developer Tools'),
                ),
              ],
              child: Text('More Tools'),
            ),
            divider,
            const DSContextMenuItem(
              leading: Icon(LucideIcons.check),
              child: Text('Show Bookmarks Bar'),
            ),
            const DSContextMenuItem.inset(child: Text('Show Full URLs')),
            divider,
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 8, 8, 8),
              child: Text('People', style: context.dsTextTheme.bodySmall),
            ),
            divider,
            DSContextMenuItem(
              leading: SizedBox.square(
                dimension: 16,
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: DSColors.theme(context).foreground,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              child: const Text('Pedro Duarte'),
            ),
            const DSContextMenuItem.inset(child: Text('Colm Tuite')),
          ],
          child: Container(
            width: 300,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: DSColors.theme(context).border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Right click here'),
          ),
        ),
      ],
    );
  }
}

```
