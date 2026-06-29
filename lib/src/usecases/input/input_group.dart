import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

enum DSInputGorupSide { right, left }

class DSInputGroup extends StatelessWidget {
  final DSInputGorupSide side;
  final Widget child;
  final EdgeInsets? padding;

  const DSInputGroup.left({required this.child, this.padding, super.key})
    : side = DSInputGorupSide.left;
  const DSInputGroup.right({required this.child, this.padding, super.key})
    : side = DSInputGorupSide.right;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DSInputConstants.contentHeight,
      decoration: BoxDecoration(
        border: Border(
          right:
              side == DSInputGorupSide.left
                  ? BorderSide(color: context.dsColors.border)
                  : BorderSide.none,
          left:
              side == DSInputGorupSide.right
                  ? BorderSide(color: context.dsColors.border)
                  : BorderSide.none,
        ),
        color: context.dsColors.muted,
      ),
      child: Padding(
        padding:
            padding ??
            EdgeInsets.symmetric(horizontal: DSInputConstants.horizontalPaddingValue),
        child: Center(child: child),
      ),
    );
  }
}
