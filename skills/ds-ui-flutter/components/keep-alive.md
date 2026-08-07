# KeepAlive (`DSKeepAlive`)

Keeps a child widget's **state** alive when it would otherwise be disposed by a parent that recycles off-screen children — `TabBarView`/`DSTabBarView`, `PageView`, lazy lists. It wraps the child with `AutomaticKeepAliveClientMixin` (`wantKeepAlive => true`), so you don't have to implement the mixin by hand.

**Use it when** switching tabs/pages should **not** reset state (scroll position, a form being filled, a local cubit/controller, an already-loaded request).

```dart
DSTabBarView(
  children: [
    DSKeepAlive(child: MyOrdersTab()),    // state preserved when leaving and coming back
    DSKeepAlive(child: MyReportsTab()),
  ],
)
```

Without `DSKeepAlive`, the `TabBarView`/`PageView` disposes the tab when you leave and rebuilds it from scratch when you return (losing scroll, form state, etc.). Exported by `artizan_ui` (`package:ds_ui/ds_ui.dart`).
