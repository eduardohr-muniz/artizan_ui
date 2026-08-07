Decorates most of the components of the library using a `DSDecoration` handled by the `DSDecorator` component.

## Default

```dart
DSDecoration(
  secondaryBorder: DSBorder.all(
    padding: const EdgeInsets.all(4),
    width: 0,
  ),
  secondaryFocusedBorder: DSBorder.all(
    width: 2,
    color: DSColors.theme(context).ring,
    radius: radius.add(radius / 2),
    padding: const EdgeInsets.all(2),
  ),
  labelStyle: context.dsTextTheme.bodySmall.copyWith(
    fontWeight: FontWeight.w500,
    color: DSColors.theme(context).foreground,
  ),
  errorStyle: context.dsTextTheme.bodySmall.copyWith(
    fontWeight: FontWeight.w500,
    color: DSColors.theme(context).destructive,
  ),
  labelPadding: const EdgeInsets.only(bottom: 8),
  descriptionStyle: context.dsTextTheme.bodySmall,
  descriptionPadding: const EdgeInsets.only(top: 8),
  errorPadding: const EdgeInsets.only(top: 8),
  errorLabelStyle: context.dsTextTheme.bodySmall.copyWith(
    fontWeight: FontWeight.w500,
    color: DSColors.theme(context).destructive,
  ),
);
```

## Secondary Border

By default, a secondary border is drawn around the focusable components.
If you want to disable it and instead make bolder the primary border, you just need to add the `disableSecondaryBorder` property to the theme.

```dart
DSThemeData(
  // Disables the secondary border
  disableSecondaryBorder: true,
),
```

Be aware, this change is not recommended, as it may lead to accessibility issues.
The secondary border is there to help users understand which component is focused.