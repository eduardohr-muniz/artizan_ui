import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

extension AertContextExtension on BuildContext {
  DSTextTheme get artTextTheme => DSTheme.of(this).textTheme;
  DSColorScheme get artColorScheme => DSTheme.of(this).colorScheme;
  bool get isDarkTheme => DSTheme.of(this).brightness == Brightness.dark;
  bool get isLightTheme => !isDarkTheme;
}
