In *shadcn_ui* the responsiveness is an important part of the library.

The `DSTheme` supports a customizable set of breakpoints.

## Default

```dart
DSThemeData(
  breakpoints: DSBreakpoints(
    tn: 0, // tiny
    sm: 640, // small
    md: 768, // medium
    lg: 1024, // large
    xl: 1280, // extra large
    xxl: 1536, // extra extra large
  ),
);
```

## Current breakpoint

To get the current breakpoint you can use `DSResponsiveBuilder` or `context.breakpoint`, eg:

```dart

DSResponsiveBuilder(
  builder: (context, breakpoint) {
    final sm = breakpoint >= DSTheme.of(context).breakpoints.sm;
    ...
  },
),
```

which is equivalent to:

```dart
final sm = context.breakpoint >= DSTheme.of(context).breakpoints.sm;

```

In Tailwind CSS, it's common to say that *sm* is not for small screens, but will target also the largest sizes if you don't provide a larger breakpoint.

That's why I'm using the `>=` operator.

If you just want to check if you're in a specific breakpoint, use the `==` operator.

## Sealed class

The breakpoint returned is a sealed class so you can switch any size.

```dart

DSResponsiveBuilder(
  builder: (context, breakpoint) {
    return switch (breakpoint) {
      DSBreakpointTN() => const Text('Tiny'),
      DSBreakpointSM() => const Text('Small'),
      DSBreakpointMD() => const Text('Medium'),
      DSBreakpointLG() => const Text('Large'),
      DSBreakpointXL() => const Text('Extra Large'),
      DSBreakpointXXL() => const Text('Extra Extra Large'),
    };
  },
),
```