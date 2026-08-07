import 'package:dotted_border/dotted_border.dart';
import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

class DsDividerDotted extends StatelessWidget {
  const DsDividerDotted.horizontal({this.margin, this.color, super.key})
    : _isHorizontal = true;

  const DsDividerDotted.vertical({this.margin, this.color, super.key})
    : _isHorizontal = false;

  final EdgeInsets? margin;

  final Color? color;
  final bool _isHorizontal;

  @override
  Widget build(BuildContext context) {
    final resolvedColor = color ?? context.dsColors.border;
    final resolvedThickness = 1.2;

    final Widget dotted = DottedBorder(
      options: CustomPathDottedBorderOptions(
        color: resolvedColor,
        strokeWidth: resolvedThickness,
        dashPattern: [5, 4],
        customPath:
            _isHorizontal
                ? (size) =>
                    Path()
                      ..moveTo(0, resolvedThickness / 2)
                      ..lineTo(size.width, resolvedThickness / 2)
                : (size) =>
                    Path()
                      ..moveTo(resolvedThickness / 2, 0)
                      ..lineTo(resolvedThickness / 2, size.height),
      ),
      // Horizontal preenche a largura disponível (greedy). Vertical é não-guloso
      // na altura (sem `double.infinity`) para não ter altura intrínseca infinita
      // — assim funciona dentro de `Row` com `CrossAxisAlignment.stretch` e de
      // `IntrinsicHeight` sem estourar o layout.
      child:
          _isHorizontal
              ? SizedBox(width: double.infinity, height: resolvedThickness)
              : SizedBox(width: resolvedThickness),
    );

    return Padding(
      padding:
          margin ??
          (_isHorizontal
              ? EdgeInsets.symmetric(vertical: 4)
              : EdgeInsets.symmetric(horizontal: 4)),
      child: dotted,
    );
  }
}
