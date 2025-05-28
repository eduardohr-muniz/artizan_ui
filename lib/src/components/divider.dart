import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ArtDividerVariant {
  vertical,
  horizontal;
}

class ArtDivider extends StatelessWidget {
  final EdgeInsets? margin;

  final double? thickness;

  final Color? color;

  final ArtDividerVariant variant;

  final BorderRadiusGeometry? radius;

  const ArtDivider.vertical({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ArtDividerVariant.vertical;

  const ArtDivider.horizontal({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ArtDividerVariant.horizontal;

  @override
  Widget build(BuildContext context) {
    return ShadSeparator.raw(
      variant: _buildShadSeparatorVariantFromArtDividerVariant(variant),
      color: color,
      thickness: thickness,
      margin: margin,
      radius: radius,
    );
  }

  ShadSeparatorVariant _buildShadSeparatorVariantFromArtDividerVariant(ArtDividerVariant variant) {
    switch (variant) {
      case ArtDividerVariant.vertical:
        return ShadSeparatorVariant.vertical;
      case ArtDividerVariant.horizontal:
        return ShadSeparatorVariant.horizontal;
    }
  }
}
