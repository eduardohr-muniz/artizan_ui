# Responsive

Responsiveness in `artizan_ui` uses the [`flutter_breakpoints`](https://pub.dev/packages/flutter_breakpoints) package, which is re-exported by the library — no separate import needed.

## Setup

Wrap your app's `builder` with `FlutterBreakpointProvider.builder`. This must be done once, high in the tree.

```dart
DSApp(
  builder: (context, child) => FlutterBreakpointProvider.builder(
    context: context,
    child: child,
  ),
  home: const MyPage(),
)
```

## Built-in breakpoints

```
Breakpoints.mobile       minWidth: 0
Breakpoints.tablet       minWidth: 600
Breakpoints.desktop      minWidth: 1024
Breakpoints.largeDesktop minWidth: 1440
```

## Checking the current breakpoint

Use `.isBreakpoint(context)` on any `FlutterBreakpoint` to check if it is the **active** breakpoint (exact match — the largest threshold that fits the current width):

```dart
final isMobile  = Breakpoints.mobile.isBreakpoint(context);
final isTablet  = Breakpoints.tablet.isBreakpoint(context);
final isDesktop = Breakpoints.desktop.isBreakpoint(context);
```

Or access the current breakpoint directly via the context extension:

```dart
final bp = context.responsive.breakpoint; // FlutterBreakpoint
```

## Adaptive layouts

```dart
Widget build(BuildContext context) {
  final isMobile  = Breakpoints.mobile.isBreakpoint(context);
  final isTablet  = Breakpoints.tablet.isBreakpoint(context);
  final isDesktop = Breakpoints.desktop.isBreakpoint(context) ||
                    Breakpoints.largeDesktop.isBreakpoint(context);

  if (isMobile)  return const MobileLayout();
  if (isTablet)  return const TabletLayout();
  if (isDesktop) return const DesktopLayout();
  return const SizedBox.shrink();
}
```

## Custom breakpoints

Define your own breakpoints and pass them to the provider:

```dart
class AppBreakpoints {
  static const FlutterBreakpoint compact  = FlutterBreakpoint(name: 'compact',  minWidth: 0);
  static const FlutterBreakpoint medium   = FlutterBreakpoint(name: 'medium',   minWidth: 480);
  static const FlutterBreakpoint expanded = FlutterBreakpoint(name: 'expanded', minWidth: 840);

  static List<FlutterBreakpoint> get all => [compact, medium, expanded];
}

// In DSApp builder:
FlutterBreakpointProvider.builder(
  context: context,
  child: child,
  breakpoints: AppBreakpoints.all,
)
```

Then check them the same way:

```dart
final isExpanded = AppBreakpoints.expanded.isBreakpoint(context);
```

## Full example

```dart
import 'package:flutter/material.dart';
import 'package:ds_ui/ds_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DSApp(
      theme: DSThemeData(
        brightness: Brightness.light,
        colorScheme: const DSZincColorScheme.light(),
      ),
      builder: (context, child) => FlutterBreakpointProvider.builder(
        context: context,
        child: child,
      ),
      home: const ResponsivePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile  = Breakpoints.mobile.isBreakpoint(context);
    final isTablet  = Breakpoints.tablet.isBreakpoint(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isMobile
            ? const Column(children: [PrimaryPanel(), SecondaryPanel()])
            : isTablet
                ? const Row(children: [
                    Expanded(child: PrimaryPanel()),
                    SizedBox(width: 16),
                    SizedBox(width: 300, child: SecondaryPanel()),
                  ])
                : const Row(children: [
                    Expanded(child: PrimaryPanel()),
                    SizedBox(width: 16),
                    Expanded(child: SecondaryPanel()),
                  ]),
      ),
    );
  }
}
```
