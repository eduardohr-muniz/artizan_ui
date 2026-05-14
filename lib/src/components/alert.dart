import 'package:ds_ui/src/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum DSAlertVariant { success, info, warning, destructive, custom }

class DSAlert extends StatelessWidget {
  /// Success variant - green
  const DSAlert.success({
    super.key,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : variant = DSAlertVariant.success;

  /// Info variant - blue
  const DSAlert.info({
    super.key,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : variant = DSAlertVariant.info;

  /// Warning variant - orange
  const DSAlert.warning({
    super.key,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : variant = DSAlertVariant.warning;

  /// Destructive variant - red
  const DSAlert.destructive({
    super.key,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : variant = DSAlertVariant.destructive;

  /// Raw constructor - all parameters customizable
  const DSAlert.raw({
    super.key,
    this.icon,
    this.iconData,
    this.title,
    this.description,
    this.textDirection,
    this.decoration,
    this.iconPadding,
    this.iconColor,
    this.titleStyle,
    this.descriptionStyle,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : variant = DSAlertVariant.custom;

  final DSAlertVariant variant;

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
      DSAlertVariant.success => ShadDecoration(color: Colors.green.withValues(alpha: 0.1), border: DSBorder.all(color: Colors.green.shade300)),
      DSAlertVariant.info => ShadDecoration(color: Colors.blue.withValues(alpha: 0.1), border: DSBorder.all(color: Colors.blue.shade300)),
      DSAlertVariant.warning => ShadDecoration(color: Colors.orange.withValues(alpha: 0.1), border: DSBorder.all(color: Colors.orange.shade300)),
      DSAlertVariant.destructive => ShadDecoration(color: Colors.red.withValues(alpha: 0.1), border: DSBorder.all(color: Colors.red.shade300)),
      DSAlertVariant.custom => const ShadDecoration(),
    };
  }

  Color? _getIconColor() {
    if (iconColor != null) return iconColor;

    return switch (variant) {
      DSAlertVariant.success => Colors.green,
      DSAlertVariant.info => Colors.blue,
      DSAlertVariant.warning => Colors.orange,
      DSAlertVariant.destructive => Colors.red,
      DSAlertVariant.custom => null,
    };
  }

  IconData? _getDefaultIconData() {
    if (iconData != null || icon != null) return iconData;

    return switch (variant) {
      DSAlertVariant.success => Icons.check_circle,
      DSAlertVariant.info => Icons.info,
      DSAlertVariant.warning => Icons.warning,
      DSAlertVariant.destructive => Icons.error,
      DSAlertVariant.custom => null,
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
