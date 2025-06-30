import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

extension AertContextExtension on BuildContext {
  ArtTextTheme get artTextTheme => ArtTheme.of(this).textTheme;
  ArtColorScheme get artColorScheme => ArtTheme.of(this).colorScheme;
}
