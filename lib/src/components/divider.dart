import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum DSDividerVariant { vertical, horizontal }

class DSDivider extends StatelessWidget {
  final EdgeInsets? margin;

  final double? thickness;

  final Color? color;

  final DSDividerVariant variant;

  final BorderRadiusGeometry? radius;

  const DSDivider.vertical({this.margin, this.thickness, this.color, this.radius, super.key}) : variant = DSDividerVariant.vertical;

  const DSDivider.horizontal({this.margin, this.thickness, this.color, this.radius, super.key}) : variant = DSDividerVariant.horizontal;

  @override
  Widget build(BuildContext context) {
    return ShadSeparator.raw(
      variant: _buildShadSeparatorVariantFromDSDividerVariant(variant),
      color: color,
      thickness: thickness,
      margin: margin,
      radius: radius,
    );
  }

  ShadSeparatorVariant _buildShadSeparatorVariantFromDSDividerVariant(DSDividerVariant variant) {
    switch (variant) {
      case DSDividerVariant.vertical:
        return ShadSeparatorVariant.vertical;
      case DSDividerVariant.horizontal:
        return ShadSeparatorVariant.horizontal;
    }
  }
}
