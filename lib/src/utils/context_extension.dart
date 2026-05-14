import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

extension AertContextExtension on BuildContext {
  DSTextTheme get dsTextTheme => DSTheme.of(this).textTheme;
  DSColorScheme get dsColors => DSTheme.of(this).colorScheme as DSColorScheme;
  bool get isDarkTheme => DSTheme.of(this).brightness == Brightness.dark;
  bool get isLightTheme => !isDarkTheme;
}
