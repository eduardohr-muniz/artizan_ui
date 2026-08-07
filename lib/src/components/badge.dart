import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum DSBadgeVariant { primary, secondary, outline, destructive }

class DSBadge extends StatelessWidget {
  final Widget child;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final void Function()? onPressed;
  final DSBadgeVariant variant;

  const DSBadge({
    required this.child,
    super.key,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
    this.variant = DSBadgeVariant.primary,
  });

  const DSBadge.secondary({
    required this.child,
    super.key,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
  }) : variant = DSBadgeVariant.secondary;

  const DSBadge.outline({
    required this.child,
    super.key,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
  }) : variant = DSBadgeVariant.outline;

  const DSBadge.destructive({
    required this.child,
    super.key,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
  }) : variant = DSBadgeVariant.destructive;

  const DSBadge.raw({
    required this.variant,
    required this.child,
    super.key,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveHoverBg =
        hoverBackgroundColor ??
        (backgroundColor != null
            ? Color.lerp(backgroundColor, Colors.black, 0.12)
            : null);

    return ShadBadge.raw(
      variant: _toShadBadgeVariant(variant),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      hoverBackgroundColor: effectiveHoverBg,
      padding: padding,
      onPressed: onPressed,
      child: child,
    );
  }

  ShadBadgeVariant _toShadBadgeVariant(DSBadgeVariant variant) {
    switch (variant) {
      case DSBadgeVariant.primary:
        return ShadBadgeVariant.primary;
      case DSBadgeVariant.secondary:
        return ShadBadgeVariant.secondary;
      case DSBadgeVariant.outline:
        return ShadBadgeVariant.outline;
      case DSBadgeVariant.destructive:
        return ShadBadgeVariant.destructive;
    }
  }
}
