import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ArtBadgeVariant {
  primary,
  secondary,
  outline,
  destructive;
}

class ArtBadge extends StatelessWidget {
  final Widget child;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final void Function()? onPressed;
  final ArtBadgeVariant variant;

  const ArtBadge({super.key, required this.child, this.shape, this.backgroundColor, this.hoverBackgroundColor, this.foregroundColor, this.padding, this.onPressed, this.variant = ArtBadgeVariant.primary});

  const ArtBadge.secondary({
    super.key,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
  }) : variant = ArtBadgeVariant.secondary;

  const ArtBadge.outline({
    super.key,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
  }) : variant = ArtBadgeVariant.outline;

  const ArtBadge.destructive({
    super.key,
    required this.child,
    this.shape,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.padding,
    this.onPressed,
  }) : variant = ArtBadgeVariant.destructive;

  @override
  Widget build(BuildContext context) {
    return ShadBadge.raw(
      variant: _toShadBadgeVariant(variant),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      hoverBackgroundColor: hoverBackgroundColor,
      padding: padding,
      onPressed: onPressed,
      child: child,
    );
  }

  ShadBadgeVariant _toShadBadgeVariant(ArtBadgeVariant variant) {
    switch (variant) {
      case ArtBadgeVariant.primary:
        return ShadBadgeVariant.primary;
      case ArtBadgeVariant.secondary:
        return ShadBadgeVariant.secondary;
      case ArtBadgeVariant.outline:
        return ShadBadgeVariant.outline;
      case ArtBadgeVariant.destructive:
        return ShadBadgeVariant.destructive;
    }
  }
}
