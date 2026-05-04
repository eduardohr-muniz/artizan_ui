# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Package
flutter pub get          # Install dependencies
flutter analyze          # Run linter (extends flutter_lints)
flutter test             # Run tests

# Example app (Widgetbook showcase)
cd example
flutter pub get
flutter run              # Launch Widgetbook on a connected device/simulator

# Regenerate Widgetbook navigation after adding/removing use cases
cd example
dart run build_runner build --delete-conflicting-outputs
```

## Architecture

`artizan_ui` is a Flutter component library that wraps [`shadcn_ui`](https://pub.dev/packages/shadcn_ui) and adds Artizan-specific variants, patterns, and 13 color schemes.

**Layer model:**
- `lib/src/components/` — 30+ `Art*` widgets, each wrapping their `Shad*` counterpart
- `lib/src/themes/` — `ArtTheme`/`ArtThemeData` typedefs over `ShadTheme`/`ShadThemeData`, plus `color_scheme/` with `.light()` / `.dark()` factories
- `lib/src/utils/context_extension.dart` — `BuildContext` extension: `context.artTextTheme`, `context.artColorScheme`, `context.isDarkTheme`
- `lib/src/type_defs.dart` — typedef aliases mapping Artizan types → shadcn_ui types

**Component naming convention:** All public widgets are prefixed `Art` (e.g. `ArtButton`, `ArtSelect<T>`).

**Variant pattern:** Components expose multiple named constructors instead of an enum parameter:
```dart
ArtButton()              // primary (default)
ArtButton.destructive()
ArtButton.outline()
ArtButton.secondary()
ArtButton.ghost()
ArtButton.link()
ArtButton.raw()          // full customization
```

**Theme integration:** Wrap any app (or the Widgetbook story) in `ShadApp` / `ShadApp.material` and supply an `ArtThemeData` (which is just `ShadThemeData`). Color schemes live in `lib/src/themes/color_scheme/` — each file exports a class with static `.light()` and `.dark()` methods returning `ShadColorScheme`.

## Example App

`example/` is a [Widgetbook](https://pub.dev/packages/widgetbook) app that serves as the living component gallery. Device-frame presets (iPhone 13 Mini, Galaxy A50, iPad Pro) and a theme/color-scheme switcher are pre-configured. Navigation is auto-generated into `example/lib/main.directories.g.dart` by `widgetbook_generator` — do not edit that file manually.

## Key Dependencies

| Package | Role |
|---|---|
| `shadcn_ui ^0.46.1` | Base UI primitives wrapped by every `Art*` component |
| `lucide_icons_flutter ^3.1.10` | Icon set used across components |
| `flutter_animate` | Animation helpers |
| `auto_form_validate` | Form field validation utilities |
| `flutter_breakpoints` | Responsive layout helpers |
| `boxy` | Advanced layout widgets |
