import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
abstract class DSColorScheme extends ShadColorScheme {
  final Color success;
  final Color successForeground;
  final Color warning;
  final Color warningForeground;
  final Color info;
  final Color infoForeground;

  const DSColorScheme({
    required super.background,
    required super.foreground,
    required super.card,
    required super.cardForeground,
    required super.popover,
    required super.popoverForeground,
    required super.primary,
    required super.primaryForeground,
    required super.secondary,
    required super.secondaryForeground,
    required super.muted,
    required super.mutedForeground,
    required super.accent,
    required super.accentForeground,
    required super.destructive,
    required super.destructiveForeground,
    required super.border,
    required super.input,
    required super.ring,
    required super.selection,
    super.custom,
    this.success = const Color(0xff22c55e),
    this.successForeground = const Color(0xfffafafa),
    this.warning = const Color(0xfff59e0b),
    this.warningForeground = const Color(0xfffafafa),
    this.info = const Color(0xff3b82f6),
    this.infoForeground = const Color(0xfffafafa),
  });

  /// Garante um [DSColorScheme] mesmo quando o tema só fornece [ShadColorScheme]
  /// (por exemplo, esquemas nativos do shadcn sem as cores semânticas do DS).
  static DSColorScheme resolve(ShadColorScheme scheme) {
    if (scheme is DSColorScheme) return scheme;
    return _DSBridgedColorScheme._(scheme);
  }
}

class _DSBridgedColorScheme extends DSColorScheme {
  _DSBridgedColorScheme._(ShadColorScheme shad)
    : super(
        background: shad.background,
        foreground: shad.foreground,
        card: shad.card,
        cardForeground: shad.cardForeground,
        popover: shad.popover,
        popoverForeground: shad.popoverForeground,
        primary: shad.primary,
        primaryForeground: shad.primaryForeground,
        secondary: shad.secondary,
        secondaryForeground: shad.secondaryForeground,
        muted: shad.muted,
        mutedForeground: shad.mutedForeground,
        accent: shad.accent,
        accentForeground: shad.accentForeground,
        destructive: shad.destructive,
        destructiveForeground: shad.destructiveForeground,
        border: shad.border,
        input: shad.input,
        ring: shad.ring,
        selection: shad.selection,
        custom: shad.custom,
      );
}
