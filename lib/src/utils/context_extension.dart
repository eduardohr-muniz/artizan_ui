import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

extension AertContextExtension on BuildContext {
  DSTextTheme get dsTextTheme => DSTextTheme(DSTheme.of(this).textTheme);
  DSColorScheme get dsColors => DSColorScheme.resolve(DSTheme.of(this).colorScheme);
  bool get isDarkTheme => DSTheme.of(this).brightness == Brightness.dark;
  bool get isLightTheme => !isDarkTheme;
}
