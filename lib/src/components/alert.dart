import 'package:artizan_ui/src/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ArtAlertVariant { success, info, warning, destructive, custom }

class ArtAlert extends StatelessWidget {
  /// Success variant - green
  const ArtAlert.success({super.key, this.icon, this.iconData, this.title, this.description, this.textDirection, this.decoration, this.iconPadding, this.iconColor, this.titleStyle, this.descriptionStyle, this.mainAxisAlignment, this.crossAxisAlignment})
    : variant = ArtAlertVariant.success;

  /// Info variant - blue
  const ArtAlert.info({super.key, this.icon, this.iconData, this.title, this.description, this.textDirection, this.decoration, this.iconPadding, this.iconColor, this.titleStyle, this.descriptionStyle, this.mainAxisAlignment, this.crossAxisAlignment})
    : variant = ArtAlertVariant.info;

  /// Warning variant - orange
  const ArtAlert.warning({super.key, this.icon, this.iconData, this.title, this.description, this.textDirection, this.decoration, this.iconPadding, this.iconColor, this.titleStyle, this.descriptionStyle, this.mainAxisAlignment, this.crossAxisAlignment})
    : variant = ArtAlertVariant.warning;

  /// Destructive variant - red
  const ArtAlert.destructive({super.key, this.icon, this.iconData, this.title, this.description, this.textDirection, this.decoration, this.iconPadding, this.iconColor, this.titleStyle, this.descriptionStyle, this.mainAxisAlignment, this.crossAxisAlignment})
    : variant = ArtAlertVariant.destructive;

  /// Raw constructor - all parameters customizable
  const ArtAlert.raw({super.key, this.icon, this.iconData, this.title, this.description, this.textDirection, this.decoration, this.iconPadding, this.iconColor, this.titleStyle, this.descriptionStyle, this.mainAxisAlignment, this.crossAxisAlignment})
    : variant = ArtAlertVariant.custom;

  final ArtAlertVariant variant;

  final Widget? icon;

  final IconData? iconData;

  final Widget? title;

  final Widget? description;

  final TextDirection? textDirection;

  final ShadDecoration? decoration;

  final EdgeInsets? iconPadding;

  final Color? iconColor;

  final TextStyle? titleStyle;

  final TextStyle? descriptionStyle;

  final MainAxisAlignment? mainAxisAlignment;

  final CrossAxisAlignment? crossAxisAlignment;

  ShadDecoration _getDecoration(BuildContext context) {
    if (decoration != null) return decoration!;

    return switch (variant) {
      ArtAlertVariant.success => ShadDecoration(color: Colors.green.withValues(alpha: 0.1), border: ArtBorder.all(color: Colors.green.shade300)),
      ArtAlertVariant.info => ShadDecoration(color: Colors.blue.withValues(alpha: 0.1), border: ArtBorder.all(color: Colors.blue.shade300)),
      ArtAlertVariant.warning => ShadDecoration(color: Colors.orange.withValues(alpha: 0.1), border: ArtBorder.all(color: Colors.orange.shade300)),
      ArtAlertVariant.destructive => ShadDecoration(color: Colors.red.withValues(alpha: 0.1), border: ArtBorder.all(color: Colors.red.shade300)),
      ArtAlertVariant.custom => const ShadDecoration(),
    };
  }

  Color? _getIconColor() {
    if (iconColor != null) return iconColor;

    return switch (variant) {
      ArtAlertVariant.success => Colors.green,
      ArtAlertVariant.info => Colors.blue,
      ArtAlertVariant.warning => Colors.orange,
      ArtAlertVariant.destructive => Colors.red,
      ArtAlertVariant.custom => null,
    };
  }

  IconData? _getDefaultIconData() {
    if (iconData != null || icon != null) return iconData;

    return switch (variant) {
      ArtAlertVariant.success => Icons.check_circle,
      ArtAlertVariant.info => Icons.info,
      ArtAlertVariant.warning => Icons.warning,
      ArtAlertVariant.destructive => Icons.error,
      ArtAlertVariant.custom => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ShadAlert(
      icon: icon ?? Icon(_getDefaultIconData()),
      title: title,
      description: description,
      textDirection: textDirection,
      decoration: _getDecoration(context),
      iconPadding: iconPadding,
      iconColor: _getIconColor(),
      titleStyle: titleStyle,
      descriptionStyle: descriptionStyle,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
    );
  }
}
