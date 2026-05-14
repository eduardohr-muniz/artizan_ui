Defines the theme and color scheme for the app.

The supported color schemes are:

- blue
- gray
- green
- neutral
- orange
- red
- rose
- slate
- stone
- violet
- yellow
- zinc

## Usage

```diff lang="dart"


@override
Widget build(BuildContext context) {
  return DSApp(
+    darkTheme: DSThemeData(
+      brightness: Brightness.dark,
+      colorScheme: const DSSlateColorScheme.dark(),
+    ),
    child: ...
  );
}
```

You can override specific properties of the selected theme/color scheme:

```diff lang="dart"


@override
Widget build(BuildContext context) {
  return DSApp(
    darkTheme: DSThemeData(
        brightness: Brightness.dark,
        colorScheme: const DSSlateColorScheme.dark(
+          background: Colors.blue,
        ),
+        primaryButtonTheme: const DSButtonTheme(
+          backgroundColor: Colors.cyan,
+        ),
      ),
    ),
    child: ...
  );
}
```

You can also create your custom color scheme, just extend the `DSColorScheme` class and pass all the properties.


## DSColorScheme.fromName

If you want to allow the user to change the default shadcn themes, I suggest using `DSColorScheme.fromName`.

```dart
// available color scheme names
final shadThemeColors = [
  'blue',
  'gray',
  'green',
  'neutral',
  'orange',
  'red',
  'rose',
  'slate',
  'stone',
  'violet',
  'yellow',
  'zinc',
];

final lightColorScheme = DSColorScheme.fromName('blue');
final darkColorScheme = DSColorScheme.fromName('slate', brightness: Brightness.dark);
```

In this way you can easily create a select to change the color scheme, for example:

```dart



// Somewhere in your app
DSSelect<String>(
  initialValue: 'slate',
  maxHeight: 200,
  options: shadThemeColors.map(
    (option) => DSOption(
      value: option,
      child: Text(
        option.capitalizeFirst(),
      ),
    ),
  ),
  selectedOptionBuilder: (context, value) {
    return Text(value.capitalizeFirst());
  },
  onChanged: (value) {
    // rebuild the app using your state management solution
  },
),
```

For example I'm using solidart as state management, here it is the example code used to rebuild the app widget when the user changes the theme mode. Check the "Toggle Theme" example at <https://solidart.mariuti.com/examples>

The same can be done for the color scheme, using a `Signal<String>()`

## Extend with custom colors

You can extend the `DSColorScheme` with your own custom colors by using the `custom` parameter.
```diff lang="dart"
return DSApp(
  theme: DSThemeData(
+    colorScheme: const DSZincColorScheme.light(
+      custom: {
+        'myCustomColor': Color.fromARGB(255, 177, 4, 196),
+      },
+    ),
  ),
);
```

Then you can access it like this `DSTheme.of(context).colorScheme.custom['myCustomColor']!`.

Or you can create an extension on `DSColorScheme` to make it easier to access:
```dart
extension CustomColorExtension on DSColorScheme {
  Color get myCustomColor => custom['myCustomColor']!;
}
```

In this way you can access it like other colors `DSTheme.of(context).colorScheme.myCustomColor`.