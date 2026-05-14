# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

`artizan_ui` is a Flutter design-system package. It wraps [`shadcn_ui`](https://pub.dev/packages/shadcn_ui) and re-exports everything under a `DS*` namespace (Design System). Consumer apps import only `artizan_ui` and use `DS*` widgets/types exclusively.

## Commands

Run from the **package root** (`/Volumes/External/projects/artizan/artizan_ui`):

```bash
flutter pub get          # install dependencies
flutter analyze          # static analysis
dart format .            # format all Dart files
flutter test             # run tests
flutter test test/artizan_ui_test.dart  # run a single test file
```

Run the **Widgetbook** component explorer (from `example/`):

```bash
cd example
flutter pub get
dart run build_runner build --delete-conflicting-outputs  # regenerate main.directories.g.dart
flutter run              # launch Widgetbook on a connected device/simulator
```

Regenerate Widgetbook after adding a new `@widgetbook.UseCase` annotation:

```bash
cd example && dart run build_runner build --delete-conflicting-outputs
```

## Architecture

### Package layout

```
lib/
  artizan_ui.dart          # single barrel export (the only file consumers import)
  src/
    app.dart               # DSApp = ShadApp
    type_defs.dart         # DSBorder = ShadBorder
    components/            # DS* widgets (one file per component)
    themes/                # DSTheme*, DSColorScheme*, DSTextTheme, color palettes
    utils/                 # BuildContext extensions
example/                   # Widgetbook component explorer (not published)
test/                      # package tests
skills/ds-ui-flutter/      # Claude skill with component docs + usage examples
```

### The DS* = Shad* pattern

Every `DS*` symbol is either a **typedef alias** of its `Shad*` counterpart, or a **StatefulWidget wrapper** that delegates to `Shad*` and adds Artizan-specific behaviour. Examples:

| DS type | Underlying Shad type |
|---|---|
| `DSApp` | `ShadApp` |
| `DSTheme` | `ShadTheme` |
| `DSThemeData` | `ShadThemeData` |
| `DSColorScheme` | `ShadColorScheme` |
| `DSTextTheme` | `ShadTextTheme` |
| `DSDecoration` | `ShadDecoration` |

`DSButton` and `DSTextFormField` are full widget wrappers with additional logic (e.g. `DSButton` auto-manages loading state when `onPressed` returns a `Future`).

### Theming

Apps configure theming with `DSApp` + `DSThemeData` + a `DSColorScheme`:

```dart
DSApp(
  theme: DSThemeData(colorScheme: const DSZincColorScheme.light(), brightness: Brightness.light),
  darkTheme: DSThemeData(colorScheme: const DSZincColorScheme.dark(), brightness: Brightness.dark),
  themeMode: ThemeMode.system,
  home: const MyPage(),
)
```

Available built-in color schemes (all have `.light()` and `.dark()` constructors):
`DSZincColorScheme`, `DSBlueColorScheme`, `DSGrayColorScheme`, `DSGreenColorScheme`, `DSNeutralColorScheme`, `DSOrangeColorScheme`, `DSRedColorScheme`, `DSRoseColorScheme`, `DSSlateColorScheme`, `DSStoneColorScheme`, `DSVioletColorScheme`, `DSYellowColorScheme`, `DSPaipColorScheme`.

For a fully custom palette, extend `DSZincCustomColorScheme` (see `lib/src/themes/color_scheme/zinc_custom.dart`).

### Semantic color tokens (`lib/src/themes/color_scheme/base.dart`)

`DSColorScheme` is an abstract class (not a typedef) that extends `ShadColorScheme` and adds typed fields for status colors. All built-in color schemes extend it:

| Field | Default |
|---|---|
| `success` / `successForeground` | `#22c55e` / `#fafafa` |
| `warning` / `warningForeground` | `#f59e0b` / `#fafafa` |
| `info` / `infoForeground` | `#3b82f6` / `#fafafa` |

Access via `context.dsColors.success`, `context.dsColors.warning`, etc.

To create a custom color scheme with different semantic token values, extend `DSColorScheme` and pass the token overrides to `super()`:

```dart
class MyColorScheme extends DSColorScheme {
  const MyColorScheme.light({
    super.primary = const Color(0xff6366f1),
    // ... other Shad tokens
    super.success = const Color(0xff10b981), // override default
  });
}
```

### Context extensions (`lib/src/utils/context_extension.dart`)

```dart
context.dsTextTheme    // DSTextTheme      — typography styles
context.dsColors  // ShadColorScheme  — base Shad tokens (primary, muted, border…)
context.dsColors        // DSColorScheme    — base tokens + DS semantic tokens (typed cast)
context.isDarkTheme     // bool
context.isLightTheme    // bool
```

Use `context.dsColors` when you need the DS-specific semantic tokens. It will throw at runtime if the app is using a plain `ShadColorScheme` instead of a `DSColorScheme`.

### Adding a new component

1. Create `lib/src/components/<name>.dart` with a `DS<Name>` widget.
2. Export it from `lib/src/components/z_components_export.dart`.
3. Add a Widgetbook use-case in `example/lib/src/<name>/`.
4. Run `dart run build_runner build` from `example/`.

### Re-exported packages

Consumers of `artizan_ui` get these without adding them to their own `pubspec.yaml`:
- `auto_form_validate` — `FormController` for form state management
- `flutter_breakpoints` — responsive breakpoint utilities
- `flutter_animate` — animation effects
- `lucide_icons_flutter` — icons via `LucideIcons.<name>`
