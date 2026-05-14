Styles for headings, paragraphs, lists...etc

## h1Large


 ```dart
Text(
  'Taxing Laughter: The Joke Tax Chronicles',
  style: context.dsTextTheme.h1Large,
)
```


## h1


 ```dart
Text(
  'Taxing Laughter: The Joke Tax Chronicles',
  style: context.dsTextTheme.h1,
)
```


## h2


 ```dart
Text(
  'The People of the Kingdom',
  style: context.dsTextTheme.h2,
)
```


## h3


 ```dart
Text(
  'The Joke Tax',
  style: context.dsTextTheme.h3,
)
```


## h4


 ```dart
Text(
  'The king, seeing how much happier his subjects were, realized the error of his ways and repealed the joke tax.',
  style: context.dsTextTheme.h4,
)
```


## p


 ```dart
Text(
  'The king, seeing how much happier his subjects were, realized the error of his ways and repealed the joke tax.',
  style: context.dsTextTheme.p,
)
```


## Blockquote


 ```dart
Text(
  '"After all," he said, "everyone enjoys a good joke, so it\'s only fair that they should pay for the privilege."',
  style: context.dsTextTheme.blockquote,
)
```


## Table


 ```dart
Text(
  "King's Treasury",
  style: context.dsTextTheme.table,
)
```


## List


 ```dart
Text(
  '1st level of puns: 5 gold coins',
  style: context.dsTextTheme.list,
)
```


## Lead


 ```dart
Text(
  'A modal dialog that interrupts the user with important content and expects a response.',
  style: context.dsTextTheme.lead,
)
```


## Large


 ```dart
Text(
  'Are you absolutely sure?',
  style: context.dsTextTheme.large,
)
```


## Small


 ```dart
Text(
  'Email address',
  style: context.dsTextTheme.small,
)
```


## Muted


 ```dart
Text(
  'Enter your email address.',
  style: context.dsTextTheme.muted,
)
```


## Custom font family

By default DS UI uses [Geist](https://vercel.com/font) as default font family.
To change it, add the local font to your project, for example in the `/fonts` directory.
Then update your `pubspec.yaml` with something like this:

```diff lang="yaml"
flutter:
+  fonts:
+    - family: UbuntuMono
+      fonts:
+        - asset: fonts/UbuntuMono-Regular.ttf
+        - asset: fonts/UbuntuMono-Italic.ttf
+          style: italic
+        - asset: fonts/UbuntuMono-Bold.ttf
+          weight: 700
+        - asset: fonts/UbuntuMono-BoldItalic.ttf
+          weight: 700
+          style: italic
```

Then in your `DSApp` update the `DSTextTheme`:
```diff lang="dart"
return DSApp(
  debugShowCheckedModeBanner: false,
  themeMode: themeMode,
  routes: routes,
  theme: DSThemeData(
    brightness: Brightness.light,
    colorScheme: const DSZincColorScheme.light(),
+    textTheme: DSTextTheme(
+      colorScheme: const DSZincColorScheme.light(),
+      family: 'UbuntuMono',
+    ),
  ),
  ...
);
```

## Google font

Install the [google_fonts](https://pub.dev/packages/google_fonts) package.
Then add the google font to your `DSApp`:
```diff lang="dart"
return DSApp(
  debugShowCheckedModeBanner: false,
  themeMode: themeMode,
  routes: routes,
  theme: DSThemeData(
    brightness: Brightness.light,
    colorScheme: const DSZincColorScheme.light(),
+    textTheme: DSTextTheme.fromGoogleFont(GoogleFonts.poppins),
  ),
  ...
);
```

## Extend with custom styles

You can extend the `DSTextTheme` with your own custom styles by using the `custom` parameter.
```diff lang="dart"
return DSApp(
  theme: DSThemeData(
+    textTheme: DSTextTheme(
+      custom: {
+        'myCustomStyle': const TextStyle(
+          fontSize: 16,
+          fontWeight: FontWeight.w400,
+          color: Colors.blue,
+        ),
+      },
+    ),
  ),
);
```

Then you can access it like this `context.dsTextTheme.custom['myCustomStyle']!`.

Or you can create an extension on `DSTextTheme` to make it easier to access:
```dart
extension CustomStyleExtension on DSTextTheme {
  TextStyle get myCustomStyle => custom['myCustomStyle']!;
}
```

In this way you can access it like other styles `context.dsTextTheme.myCustomStyle`.