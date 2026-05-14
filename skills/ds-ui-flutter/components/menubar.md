# Menubar

A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands.



```dart
class MenubarExample extends StatelessWidget {
  const MenubarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    final square = SizedBox.square(
      dimension: 16,
      child: Center(
        child: SizedBox.square(
          dimension: 8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.foreground,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
    final divider = DSSeparator.horizontal(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: theme.colorScheme.muted,
    );
    return DSMenubar(
      items: [
        DSMenubarItem(
          items: [
            const DSContextMenuItem(child: Text('New Tab')),
            const DSContextMenuItem(child: Text('New Window')),
            const DSContextMenuItem(
              enabled: false,
              child: Text('New Incognito Window'),
            ),
            divider,
            const DSContextMenuItem(
              trailing: Icon(LucideIcons.chevronRight),
              items: [
                DSContextMenuItem(child: Text('Email Link')),
                DSContextMenuItem(child: Text('Messages')),
                DSContextMenuItem(child: Text('Notes')),
              ],
              child: Text('Share'),
            ),
            divider,
            const DSContextMenuItem(child: Text('Print...')),
          ],
          child: const Text('File'),
        ),
        DSMenubarItem(
          items: [
            const DSContextMenuItem(child: Text('Undo')),
            const DSContextMenuItem(child: Text('Redo')),
            divider,
            DSContextMenuItem(
              trailing: const Icon(LucideIcons.chevronRight),
              items: [
                const DSContextMenuItem(child: Text('Search the web')),
                divider,
                const DSContextMenuItem(child: Text('Find...')),
                const DSContextMenuItem(child: Text('Find Next')),
                const DSContextMenuItem(child: Text('Find Previous')),
              ],
              child: const Text('Find'),
            ),
            divider,
            const DSContextMenuItem(child: Text('Cut')),
            const DSContextMenuItem(child: Text('Copy')),
            const DSContextMenuItem(child: Text('Paste')),
          ],
          child: const Text('Edit'),
        ),
        DSMenubarItem(
          items: [
            const DSContextMenuItem.inset(
              child: Text('Always Show Bookmarks Bar'),
            ),
            const DSContextMenuItem(
              leading: Icon(LucideIcons.check),
              child: Text('Always Show Full URLs'),
            ),
            divider,
            const DSContextMenuItem.inset(child: Text('Reload')),
            const DSContextMenuItem.inset(
                enabled: false, child: Text('Force Reload')),
            divider,
            const DSContextMenuItem.inset(
              child: Text('Toggle Full Screen'),
            ),
            divider,
            const DSContextMenuItem.inset(child: Text('Hide Sidebar')),
          ],
          child: const Text('View'),
        ),
        DSMenubarItem(items: [
          const DSContextMenuItem.inset(child: Text('Andy')),
          DSContextMenuItem(leading: square, child: const Text('Benoit')),
          const DSContextMenuItem.inset(child: Text('Luis')),
          divider,
          const DSContextMenuItem.inset(child: Text('Edit...')),
          divider,
          const DSContextMenuItem.inset(child: Text('Add Profile...')),
        ], child: const Text('Profiles')),
      ],
    );
  }
}
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dependencies/dependencies.dart';

class MenubarPage extends StatefulWidget {
  const MenubarPage({super.key});

  @override
  State<MenubarPage> createState() => _MenubarPageState();
}

class _MenubarPageState extends State<MenubarPage> {
  var selectOnHover = true;

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    final square = SizedBox.square(
      dimension: 16,
      child: Center(
        child: SizedBox.square(
          dimension: 8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.foreground,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
    final divider = DSSeparator.horizontal(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: theme.colorScheme.muted,
    );

    return BaseScaffold(
      appBarTitle: 'Menubar',
      editable: [
        MyBoolProperty(
          label: 'Select on hover',
          value: selectOnHover,
          onChanged: (value) => setState(() => selectOnHover = value),
        ),
      ],
      children: [
        DSMenubar(
          selectOnHover: selectOnHover,
          items: [
            DSMenubarItem(
              items: [
                const DSContextMenuItem(child: Text('New Tab')),
                const DSContextMenuItem(child: Text('New Window')),
                const DSContextMenuItem(
                  enabled: false,
                  child: Text('New Incognito Window'),
                ),
                divider,
                const DSContextMenuItem(
                  trailing: Icon(LucideIcons.chevronRight),
                  items: [
                    DSContextMenuItem(child: Text('Email Link')),
                    DSContextMenuItem(child: Text('Messages')),
                    DSContextMenuItem(child: Text('Notes')),
                  ],
                  child: Text('Share'),
                ),
                divider,
                const DSContextMenuItem(child: Text('Print...')),
              ],
              child: const Text('File'),
            ),
            DSMenubarItem(
              items: [
                const DSContextMenuItem(child: Text('Undo')),
                const DSContextMenuItem(child: Text('Redo')),
                divider,
                DSContextMenuItem(
                  trailing: const Icon(LucideIcons.chevronRight),
                  items: [
                    const DSContextMenuItem(child: Text('Search the web')),
                    divider,
                    const DSContextMenuItem(child: Text('Find...')),
                    const DSContextMenuItem(child: Text('Find Next')),
                    const DSContextMenuItem(child: Text('Find Previous')),
                  ],
                  child: const Text('Find'),
                ),
                divider,
                const DSContextMenuItem(child: Text('Cut')),
                const DSContextMenuItem(child: Text('Copy')),
                const DSContextMenuItem(child: Text('Paste')),
              ],
              child: const Text('Edit'),
            ),
            DSMenubarItem(
              items: [
                const DSContextMenuItem.inset(
                  child: Text('Always Show Bookmarks Bar'),
                ),
                const DSContextMenuItem(
                  leading: Icon(LucideIcons.check),
                  child: Text('Always Show Full URLs'),
                ),
                divider,
                const DSContextMenuItem.inset(child: Text('Reload')),
                const DSContextMenuItem.inset(
                  enabled: false,
                  child: Text('Force Reload'),
                ),
                divider,
                const DSContextMenuItem.inset(
                  child: Text('Toggle Full Screen'),
                ),
                divider,
                const DSContextMenuItem.inset(child: Text('Hide Sidebar')),
              ],
              child: const Text('View'),
            ),
            DSMenubarItem(
              items: [
                const DSContextMenuItem.inset(child: Text('Andy')),
                DSContextMenuItem(
                  leading: square,
                  child: const Text('Benoit'),
                ),
                const DSContextMenuItem.inset(child: Text('Luis')),
                divider,
                const DSContextMenuItem.inset(child: Text('Edit...')),
                divider,
                const DSContextMenuItem.inset(child: Text('Add Profile...')),
              ],
              child: const Text('Profiles'),
            ),
          ],
        ),
      ],
    );
  }
}

```
