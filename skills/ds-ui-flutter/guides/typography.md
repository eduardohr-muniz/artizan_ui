# Typography

DS UI defines two levels of type scale accessible via `context.dsTextTheme`:

- **Shad base tokens** (`h1`, `h2`, `h3`, `h4`, `p`, `small`, `muted` …) — inherited from shadcn_ui.
- **DS semantic tokens** (`displayLarge`, `titleLarge`, `bodyMedium` …) — added by DS UI via extension.

Always use `createDSTextTheme()` when configuring the theme to ensure all semantic tokens are populated.

---

## DS Semantic Tokens

### Display

#### displayLarge
30px / w700 / ls -0.3 — hero text, splash screens, empty states.

```dart
Text('Hero Text', style: context.dsTextTheme.displayLarge)
```

#### displaySmall
24px / w700 / ls -0.24 — large modal titles, prominent page headers.

```dart
Text('Modal Title', style: context.dsTextTheme.displaySmall)
```

---

### Title

#### titleLarge
20px / w700 / ls -0.2 — screen titles, top-level section headers.

```dart
Text('Page Title', style: context.dsTextTheme.titleLarge)
```

#### titleMedium
18px / w600 — panel headings, card titles, dialog titles.

```dart
Text('Card Title', style: context.dsTextTheme.titleMedium)
```

#### titleSmall
16px / w600 — sub-section headings, list group headers.

```dart
Text('Section Header', style: context.dsTextTheme.titleSmall)
```

---

### Body

#### bodyLarge
16px / w400 — primary readable text, descriptions.

```dart
Text('Primary body text.', style: context.dsTextTheme.bodyLarge)
```

#### bodyMedium
14px / w400 — default body text, list items, inputs.

```dart
Text('Default body text.', style: context.dsTextTheme.bodyMedium)
```

#### bodySmall
12px / w400 — secondary text, captions, helper copy, timestamps.

```dart
Text('Helper text', style: context.dsTextTheme.bodySmall)
```

---

### Label

#### labelLarge
14px / w600 — button labels, tabs, navigation items, form labels.

```dart
Text('Submit', style: context.dsTextTheme.labelLarge)
```

#### labelMedium
12px / w600 / ls 0.1 — chip labels, badge text, compact buttons.

```dart
Text('New', style: context.dsTextTheme.labelMedium)
```

#### labelSmall
11px / w500 / ls 0.4 — status tags, compact badges, micro-labels. Use `.toUpperCase()` when displaying as an uppercase label.

```dart
Text('draft'.toUpperCase(), style: context.dsTextTheme.labelSmall)
```

---

## Shad Base Tokens

The original Shad tokens remain available and follow a compact scale suited for mobile/app contexts:

| Token | Size | Weight | Usage |
|---|---|---|---|
| `h1Large` | 30px | w700 | Equivalent to `displayLarge` |
| `h1` | 24px | w700 | Equivalent to `displaySmall` |
| `h2` | 20px | w700 | Equivalent to `titleLarge` |
| `h3` | 18px | w600 | Equivalent to `titleMedium` |
| `h4` | 16px | w600 | Equivalent to `titleSmall` |
| `lead` | 18px | w400 | Subtitle / intro text |
| `large` | 16px | w600 | Prominent large text |
| `p` | 14px | w400 | Default paragraph |
| `blockquote` | 14px | w400 | Quotation (italic) |
| `table` | 14px | w700 | Table header |
| `list` | 14px | w400 | List item |
| `small` | 12px | w500 | Small text |
| `muted` | 12px | w400 | Secondary / muted text |

```dart
Text('Heading', style: context.dsTextTheme.h2)
Text('Body paragraph.', style: context.dsTextTheme.p)
Text('Helper text', style: context.dsTextTheme.muted)
```

---

## Theme Configuration

Use `createDSTextTheme()` to ensure all semantic tokens are pre-populated. Individual tokens can be overridden:

```dart
DSThemeData(
  textTheme: createDSTextTheme(
    family: 'Inter',
    // override DS semantic tokens
    titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
    // override Shad base tokens
    muted: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
  ),
)
```

---

## Custom Font Family

By default DS UI uses [Geist](https://vercel.com/font). To change it, add the font to your `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: UbuntuMono
      fonts:
        - asset: fonts/UbuntuMono-Regular.ttf
        - asset: fonts/UbuntuMono-Bold.ttf
          weight: 700
```

Then pass the `family` to `createDSTextTheme`:

```dart
DSThemeData(
  textTheme: createDSTextTheme(family: 'UbuntuMono'),
)
```

---

## Google Font

Install the [google_fonts](https://pub.dev/packages/google_fonts) package and use the `googleFontBuilder` parameter:

```dart
DSThemeData(
  textTheme: createDSTextTheme(
    googleFontBuilder: GoogleFonts.poppins,
  ),
)
```

---

## Extra Custom Styles

Use `extraCustom` in `createDSTextTheme` to add your own tokens:

```dart
DSThemeData(
  textTheme: createDSTextTheme(
    extraCustom: {
      'myCaption': const TextStyle(fontSize: 10, letterSpacing: 1.2),
    },
  ),
)
```

Access via `context.dsTextTheme.custom['myCaption']!`, or create an extension for convenience:

```dart
extension MyTextTokens on DSTextTheme {
  TextStyle get myCaption => custom['myCaption']!;
}

// usage
Text('caption', style: context.dsTextTheme.myCaption)
```
