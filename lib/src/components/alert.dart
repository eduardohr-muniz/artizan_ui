import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ArtAlertVariant {
  primary,
  destructive,
}

class ArtAlert extends StatelessWidget {
  const ArtAlert({
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
  }) : variant = ArtAlertVariant.primary;

  const ArtAlert.destructive({
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
  }) : variant = ArtAlertVariant.destructive;

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

  ShadAlertVariant get _shadVariant => switch (variant) {
        ArtAlertVariant.primary => ShadAlertVariant.primary,
        ArtAlertVariant.destructive => ShadAlertVariant.destructive,
      };

  @override
  Widget build(BuildContext context) {
    return ShadAlert.raw(
      variant: _shadVariant,
      icon: icon,
      iconData: iconData,
      title: title,
      description: description,
      textDirection: textDirection,
      decoration: decoration,
      iconPadding: iconPadding,
      iconColor: iconColor,
      titleStyle: titleStyle,
      descriptionStyle: descriptionStyle,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
    );
  }
}
