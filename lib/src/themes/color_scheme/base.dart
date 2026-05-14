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
}
