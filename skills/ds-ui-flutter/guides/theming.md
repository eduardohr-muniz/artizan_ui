# Theming

DS UI provides a theming system built on top of `shadcn_ui`. Configure themes via `DSApp` + `DSThemeData` + a `DSColorScheme`.

---

## Available Color Schemes

All schemes have `.light()` and `.dark()` constructors:

| Scheme | Class |
|---|---|
| Zinc (default) | `DSZincColorScheme` |
| Blue | `DSBlueColorScheme` |
| Gray | `DSGrayColorScheme` |
| Green | `DSGreenColorScheme` |
| Neutral | `DSNeutralColorScheme` |
| Orange | `DSOrangeColorScheme` |
| Red | `DSRedColorScheme` |
| Rose | `DSRoseColorScheme` |
| Slate | `DSSlateColorScheme` |
| Stone | `DSStoneColorScheme` |
| Violet | `DSVioletColorScheme` |
| Yellow | `DSYellowColorScheme` |
| Paip | `DSPaipColorScheme` |

---

## Basic Setup

```dart
DSApp(
  theme: DSThemeData(
    brightness: Brightness.light,
    colorScheme: const DSZincColorScheme.light(),
  ),
  darkTheme: DSThemeData(
    brightness: Brightness.dark,
    colorScheme: const DSZincColorScheme.dark(),
  ),
  themeMode: ThemeMode.system,
  home: const MyPage(),
)
```

You can override specific tokens of the scheme or the theme:

```dart
DSThemeData(
  brightness: Brightness.dark,
  colorScheme: const DSSlateColorScheme.dark(
    background: Color(0xff0a0a0a),
  ),
  primaryButtonTheme: const DSButtonTheme(
    backgroundColor: Colors.cyan,
  ),
)
```

---

## Semantic Color Tokens (DSColorScheme)

`DSColorScheme` extends `ShadColorScheme` and adds typed status tokens. All built-in schemes include them with these defaults:

| Token | Default (hex) | Usage |
|---|---|---|
| `success` | `#22c55e` | Confirmations, success state |
| `successForeground` | `#fafafa` | Text/icon on top of `success` |
| `warning` | `#f59e0b` | Warnings, caution state |
| `warningForeground` | `#fafafa` | Text/icon on top of `warning` |
| `info` | `#3b82f6` | Informational messages, hints |
| `infoForeground` | `#fafafa` | Text/icon on top of `info` |

### Accessing via context

```dart
final colors = context.dsColors;

Container(color: colors.primary)
Container(color: colors.success)
Container(color: colors.warning)
Container(color: colors.info)
Text('Ok', style: TextStyle(color: colors.successForeground))
```

### Context accessors

```dart
context.dsTextTheme   // DSTextTheme — full type scale
context.dsColors      // DSColorScheme — Shad base tokens + DS semantic tokens
context.isDarkTheme   // bool
context.isLightTheme  // bool
```

> `context.dsColors` uses `DSColorScheme.resolve()` internally. It works even when the app uses a plain `ShadColorScheme` (without DS tokens), returning the semantic token defaults.

---

## Custom Color Scheme

To use different semantic token values, extend `DSColorScheme`:

```dart
class MyColorScheme extends DSColorScheme {
  const MyColorScheme.light({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff09090b),
    super.primary = const Color(0xff6366f1),
    super.primaryForeground = const Color(0xfffafafa),
    // … other required Shad tokens …
    super.success = const Color(0xff10b981),  // override default
    super.warning = const Color(0xfff97316),  // override default
  });
}
```

For a fully custom palette based on Zinc, extend `DSZincCustomColorScheme` (see `lib/src/themes/color_scheme/zinc_custom.dart`).

---

## Extra Custom Colors

Use the `custom` map to add color tokens beyond the semantic ones:

```dart
DSThemeData(
  colorScheme: const DSZincColorScheme.light(
    custom: {
      'brand': Color(0xff6366f1),
    },
  ),
)
```

Access via `context.dsColors.custom['brand']!`, or create an extension:

```dart
extension MyColorTokens on DSColorScheme {
  Color get brand => custom['brand']!;
}

// usage
Container(color: context.dsColors.brand)
```

---

## Dynamic Scheme Selection

To let users switch color schemes at runtime, use `DSColorScheme.fromName`:

```dart
final schemes = ['blue', 'gray', 'green', 'neutral', 'orange',
                  'red', 'rose', 'slate', 'stone', 'violet', 'yellow', 'zinc'];

final lightScheme = DSColorScheme.fromName('blue');
final darkScheme  = DSColorScheme.fromName('slate', brightness: Brightness.dark);
```

Example with `DSSelect` for interactive switching:

```dart
DSSelect<String>(
  initialValue: 'slate',
  maxHeight: 200,
  options: schemes.map((s) => DSOption(value: s, child: Text(s))).toList(),
  selectedOptionBuilder: (context, value) => Text(value),
  onChanged: (value) {
    // rebuild the app via your state management solution
  },
)
```
