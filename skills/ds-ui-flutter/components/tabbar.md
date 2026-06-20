# TabBar

Top navigation tabs in the Material style — a sliding bottom indicator with a subtle glow — that switch a `DSTabBarView`. Use `DSTabBar` for screen-level navigation between sections; for the pill/segmented style that owns its own content, use [Tabs](tabs.md) (`DSTabs`).

It needs a `TabController` (via `controller`) or an ancestor `DSDefaultTabBarController`.

The DSTabBar family:

| Widget | Wraps | Purpose |
|---|---|---|
| `DSTabBar` | `TabBar` | The tab strip with the DS glow indicator. |
| `DSTabBarItem` | `Tab` | A single tab — takes just a `text` (and optional `icon`). |
| `DSTabBarView` | `TabBarView` | The content area that switches with the selection. |
| `DSDefaultTabBarController` | `DefaultTabController` | Provides the controller to the descendants. |

```dart
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DSDefaultTabBarController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DSTabBar(
              tabs: [
                DSTabBarItem('First'),
                DSTabBarItem('Second'),
              ],
            ),
            const Expanded(
              child: DSTabBarView(
                children: [
                  Center(child: Text('First tab content')),
                  Center(child: Text('Second tab content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Defaults & styling

`DSTabBar` ships the design-system look out of the box: no divider, no tap ripple, left-aligned scrollable tabs, the `dsTextTheme.titleSmall` label and the `primary` color. The indicator is a rounded underline with a **subtle glow** that slides between tabs as the selection animates.

| Property | Default | Notes |
|---|---|---|
| `tabs` | — | List of `DSTabBarItem` — each takes a `text` and optional `icon`. |
| `controller` | `null` | Falls back to the ancestor `DSDefaultTabBarController`. |
| `onTap` | `null` | Called with the tapped index. |
| `isScrollable` | `true` | Required to honor `tabAlignment`. |
| `tabAlignment` | `TabAlignment.start` | Left-aligns the tabs. |
| `indicatorColor` | `ring` | Color of the indicator and glow. |
| `labelColor` / `labelStyle` | `foreground` / `titleSmall` | Selected label color/style. |
| `labelPadding` / `padding` | `EdgeInsets.only(right: 21)` | Spacing per label / around the bar. |
| `indicatorPadding` | `EdgeInsets.symmetric(vertical: 4)` | Insets the indicator line. |
| `indicatorWeight` | `2.3` | Line thickness. |
| `indicatorRadius` | `4` | Rounded ends of the indicator. |
| `glow` | `true` | Subtle glow under the indicator. Set `false` for a flat underline. |
| `height` | `kTextTabBarHeight` | Preferred height for use as `AppBar.bottom`. |

## Example

```dart
import 'package:example/common/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: "TabBar",
      wrapChildrenInScrollable: false,
      wrapSingleChildInColumn: false,
      children: [
        DSDefaultTabBarController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DSTabBar(
                onTap: (index) => print(index),
                tabs: const [
                  DSTabBarItem('Overview'),
                  DSTabBarItem('History'),
                  DSTabBarItem('Settings'),
                ],
              ),
              const Expanded(
                child: DSTabBarView(
                  children: [
                    Center(child: Text('Overview')),
                    Center(child: Text('History')),
                    Center(child: Text('Settings')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
```
