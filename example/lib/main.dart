import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatefulWidget {
  const WidgetbookApp({super.key});

  @override
  State<WidgetbookApp> createState() => _WidgetbookAppState();
}

class _WidgetbookAppState extends State<WidgetbookApp> {
  @override
  Widget build(BuildContext context) {
    return DSApp(
      theme: DSThemeData(colorScheme: const DSPaipColorScheme.light(), brightness: Brightness.light),
      darkTheme: DSThemeData(colorScheme: const DSPaipColorScheme.dark(), brightness: Brightness.dark),
      builder: (context, child) => Widgetbook.cupertino(
        directories: directories,
        addons: [
          DeviceFrameAddon(
            initialDevice: Devices.ios.iPhone13Mini,
            devices: [
              Devices.ios.iPhone13Mini,
              Devices.android.samsungGalaxyA50,
              Devices.ios.iPadPro11Inches,
            ],
          ),
          ThemeAddon<DSThemeData>(
            themes: [
              WidgetbookTheme(name: 'Paip Light', data: DSThemeData(colorScheme: const DSPaipColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Paip Dark', data: DSThemeData(colorScheme: const DSPaipColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Zinc Light', data: DSThemeData(colorScheme: const DSZincColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Zinc Dark', data: DSThemeData(colorScheme: const DSZincColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Blue Light', data: DSThemeData(colorScheme: const DSBlueColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Blue Dark', data: DSThemeData(colorScheme: const DSBlueColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Gray Light', data: DSThemeData(colorScheme: const DSBlueColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Gray Dark', data: DSThemeData(colorScheme: const DSBlueColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Green Light', data: DSThemeData(colorScheme: const DSGreenColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Green Dark', data: DSThemeData(colorScheme: const DSGreenColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(
                  name: 'Neutral Light', data: DSThemeData(colorScheme: const DSNeutralColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Neutral Dark', data: DSThemeData(colorScheme: const DSNeutralColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Orange Light', data: DSThemeData(colorScheme: const DSOrangeColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Orange Dark', data: DSThemeData(colorScheme: const DSOrangeColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Red Light', data: DSThemeData(colorScheme: const DSRedColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Red Dark', data: DSThemeData(colorScheme: const DSRedColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Rose Light', data: DSThemeData(colorScheme: const DSRoseColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Rose Dark', data: DSThemeData(colorScheme: const DSRoseColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Stone Light', data: DSThemeData(colorScheme: const DSStoneColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Stone Dark', data: DSThemeData(colorScheme: const DSStoneColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Slate Light', data: DSThemeData(colorScheme: const DSSlateColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Slate Dark', data: DSThemeData(colorScheme: const DSSlateColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Violet Light', data: DSThemeData(colorScheme: const DSVioletColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Violet Dark', data: DSThemeData(colorScheme: const DSVioletColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Yellow Light', data: DSThemeData(colorScheme: const DSYellowColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Yellow Dark', data: DSThemeData(colorScheme: const DSYellowColorScheme.dark(), brightness: Brightness.dark)),
              WidgetbookTheme(name: 'Zinc Light', data: DSThemeData(colorScheme: const DSZincColorScheme.light(), brightness: Brightness.light)),
              WidgetbookTheme(name: 'Zinc Dark', data: DSThemeData(colorScheme: const DSZincColorScheme.dark(), brightness: Brightness.dark)),
            ],
            themeBuilder: (context, theme, child) => DSApp(
              theme: theme,
              darkTheme: theme,
              themeMode: theme.brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
              home: child,
            ),
          )
        ],
      ),
    );
  }
}
