# Typography

DS UI exposes a semantic type scale via **DS custom tokens**. These are the canonical way to apply typography — always prefer them over Shad base tokens (`h1`, `p`, `muted`, etc.).

Access the scale through `context.dsTextTheme` (returns `DSTextTheme`):

```dart
context.dsTextTheme.titleLarge
context.dsTextTheme.body
```

Always use `createDSTextTheme()` when configuring the theme to ensure all tokens are populated.

---

## DS Tokens Reference

### Display

| Token | Size | Weight | Letter Spacing | Usage |
|---|---|---|---|---|
| `displayLarge` | 30px | w700 | -0.3 | Hero text, splash screens, empty states |
| `displaySmall` | 24px | w700 | -0.24 | Large modal titles, prominent page headers |

```dart
Text('Hero Text', style: context.dsTextTheme.displayLarge)
Text('Modal Title', style: context.dsTextTheme.displaySmall)
```

---

### Title

| Token | Size | Weight | Usage |
|---|---|---|---|
| `titleLarge` | 20px | w700 | Screen titles, top-level section headers |
| `title` | 18px | w600 | Panel headings, card titles, dialog titles |
| `titleSmall` | 16px | w600 | Sub-section headings, list group headers |

```dart
Text('Page Title', style: context.dsTextTheme.titleLarge)
Text('Card Title', style: context.dsTextTheme.title)
Text('Section Header', style: context.dsTextTheme.titleSmall)
```

---

### Body

| Token | Size | Weight | Usage |
|---|---|---|---|
| `bodyLarge` | 16px | w400 | Primary readable text, descriptions |
| `body` | 14px | w400 | Default body text, list items, inputs |
| `bodySmall` | 12px | w400 | Secondary text, captions, helper copy, timestamps |

```dart
Text('Primary body text.', style: context.dsTextTheme.bodyLarge)
Text('Default body text.', style: context.dsTextTheme.body)
Text('Helper text', style: context.dsTextTheme.bodySmall)
```

#### Muted body variants

`body` and `bodySmall` carry only the typographic scale — apply the muted color via `.copyWith`:

| Token | Size | Weight | Usage |
|---|---|---|---|
| `body` | 14px | w400 | Secondary/subdued body text |
| `bodySmall` | 12px | w400 | Secondary/subdued small text |

```dart
Text(
  'Secondary info',
  style: context.dsTextTheme.body.copyWith(
    color: context.dsColors.mutedForeground,
  ),
)
Text(
  'Timestamp',
  style: context.dsTextTheme.bodySmall.copyWith(
    color: context.dsColors.mutedForeground,
  ),
)
```

Override the typography in `createDSTextTheme` if needed:

```dart
createDSTextTheme(
  body: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
  bodySmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
)
```

---

### Label

| Token | Size | Weight | Letter Spacing | Usage |
|---|---|---|---|---|
| `labelLarge` | 14px | w600 | 0 | Button labels, tabs, navigation items, form labels |
| `label` | 12px | w600 | 0.1 | Chip labels, badge text, compact buttons |
| `labelSmall` | 11px | w500 | 0.4 | Status tags, compact badges, micro-labels |
| `caption` | 10px | w400 | 0.2 | Fine print, footnotes, timestamps, metadata annotations |

```dart
Text('Submit', style: context.dsTextTheme.labelLarge)
Text('New', style: context.dsTextTheme.label)
Text('draft'.toUpperCase(), style: context.dsTextTheme.labelSmall)
Text('Last updated 3 min ago', style: context.dsTextTheme.caption)
```

> Use `.toUpperCase()` on the string when displaying `labelSmall` as an uppercase label.

---

## Theme Configuration

```dart
DSThemeData(
  textTheme: createDSTextTheme(
    family: 'Inter',
    // override DS tokens
    titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
    bodyMuted: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
  ),
)
```

---

## Custom Font Family

By default DS UI uses [Geist](https://vercel.com/font). To change it, add the font to `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: UbuntuMono
      fonts:
        - asset: fonts/UbuntuMono-Regular.ttf
        - asset: fonts/UbuntuMono-Bold.ttf
          weight: 700
```

Then pass `family` to `createDSTextTheme`:

```dart
DSThemeData(
  textTheme: createDSTextTheme(family: 'UbuntuMono'),
)
```

---

## Google Font

Install [google_fonts](https://pub.dev/packages/google_fonts) and use `googleFontBuilder`:

```dart
DSThemeData(
  textTheme: createDSTextTheme(
    googleFontBuilder: GoogleFonts.poppins,
  ),
)
```

---

## Extra Custom Tokens

Use `extraCustom` in `createDSTextTheme` to add project-specific tokens:

```dart
DSThemeData(
  textTheme: createDSTextTheme(
    extraCustom: {
      'myCaption': const TextStyle(fontSize: 10, letterSpacing: 1.2),
    },
  ),
)
```

Create an extension for convenient access:

```dart
extension MyTextTokens on DSTextTheme {
  TextStyle get myCaption => custom['myCaption']!;
}

Text('caption', style: context.dsTextTheme.myCaption)
```

---

## Shad Base Tokens (avoid in new code)

The Shad tokens (`h1`, `h2`, `p`, `muted`, etc.) remain available for compatibility but should not be used in new code — the DS tokens above cover all use cases with clearer semantics.

| Shad token | DS equivalent |
|---|---|
| `h1Large` | `displayLarge` |
| `h1` | `displaySmall` |
| `h2` | `titleLarge` |
| `h3` | `title` |
| `h4` | `titleSmall` |
| `p` | `body` |
| `small` | `bodySmall` |
| `muted` | `dsTextTheme.bodySmall + `.copyWith(color: context.dsColors.mutedForeground)` |
