import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Slider de faixa (dois pontos) com a aparência do [DSSlider]/`ShadSlider`.
///
/// O `shadcn_ui` não oferece um slider de faixa, então este componente embrulha
/// o [RangeSlider] do Material e o estiliza com os tokens do tema Shad: trilho
/// de 8px (ativo = `primary`, inativo = `secondary`) e thumbs de 20px com miolo
/// `background` e anel de 2px na cor `primary`.
///
/// É controlado: receba [values] e atualize-os em [onChanged] (como o
/// [RangeSlider]). Para passos discretos, informe [divisions].
class DSRangeSlider extends StatelessWidget {
  const DSRangeSlider({
    required this.values,
    required this.onChanged,
    super.key,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.labels,
    this.onChangeStart,
    this.onChangeEnd,
    this.enabled = true,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.thumbBorderColor,
    this.overlayColor,
    this.trackHeight = 8,
    this.thumbRadius = 10,
    this.thumbBorderWidth = 2,
  });

  /// Valores atuais (início/fim) da faixa.
  final RangeValues values;

  /// Chamado a cada mudança da faixa. Se `null` (ou [enabled] `false`), desabilita.
  final ValueChanged<RangeValues>? onChanged;

  /// Valor mínimo do slider.
  final double min;

  /// Valor máximo do slider.
  final double max;

  /// Número de divisões discretas. `null` = contínuo.
  final int? divisions;

  /// Rótulos exibidos sobre cada thumb durante o arraste.
  final RangeLabels? labels;

  /// Chamado quando o usuário começa a arrastar.
  final ValueChanged<RangeValues>? onChangeStart;

  /// Chamado quando o usuário termina de arrastar.
  final ValueChanged<RangeValues>? onChangeEnd;

  /// Quando `false`, o slider fica inativo e não responde a gestos.
  final bool enabled;

  /// Cor do trecho ativo do trilho. Default: `colorScheme.primary`.
  final Color? activeTrackColor;

  /// Cor do trecho inativo do trilho. Default: `colorScheme.secondary`.
  final Color? inactiveTrackColor;

  /// Cor do miolo do thumb. Default: `colorScheme.background`.
  final Color? thumbColor;

  /// Cor do anel do thumb. Default: `colorScheme.primary`.
  final Color? thumbBorderColor;

  /// Cor do halo ao pressionar/focar. Default: `activeTrackColor` com 12% de alpha.
  final Color? overlayColor;

  /// Altura do trilho.
  final double trackHeight;

  /// Raio do thumb (metade do diâmetro).
  final double thumbRadius;

  /// Espessura do anel do thumb.
  final double thumbBorderWidth;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colors = theme.colorScheme;

    final effectiveActive = activeTrackColor ?? colors.primary;
    final effectiveInactive = inactiveTrackColor ?? colors.secondary;
    final effectiveThumb = thumbColor ?? colors.background;
    final effectiveThumbBorder = thumbBorderColor ?? colors.primary;
    final effectiveOverlay = overlayColor ?? effectiveActive.withValues(alpha: 0.12);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: trackHeight,
        activeTrackColor: effectiveActive,
        inactiveTrackColor: effectiveInactive,
        disabledActiveTrackColor: effectiveActive.withValues(alpha: 0.5),
        disabledInactiveTrackColor: effectiveInactive.withValues(alpha: 0.5),
        overlayColor: effectiveOverlay,
        valueIndicatorColor: effectiveActive,
        valueIndicatorTextStyle: theme.textTheme.small.copyWith(color: colors.primaryForeground),
        rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
        rangeThumbShape: _DSRangeThumbShape(
          fillColor: effectiveThumb,
          borderColor: effectiveThumbBorder,
          disabledBorderColor: effectiveThumbBorder.withValues(alpha: 0.5),
          radius: thumbRadius,
          borderWidth: thumbBorderWidth,
        ),
      ),
      child: RangeSlider(
        values: values,
        min: min,
        max: max,
        divisions: divisions,
        labels: labels,
        onChanged: enabled ? onChanged : null,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
      ),
    );
  }
}

/// Thumb circular com miolo preenchido e anel — replica o thumb do `ShadSlider`.
class _DSRangeThumbShape extends RangeSliderThumbShape {
  const _DSRangeThumbShape({
    required this.fillColor,
    required this.borderColor,
    required this.disabledBorderColor,
    required this.radius,
    required this.borderWidth,
  });

  final Color fillColor;
  final Color borderColor;
  final Color disabledBorderColor;
  final double radius;
  final double borderWidth;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.fromRadius(radius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop = false,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    context.canvas
      ..drawCircle(center, radius, Paint()..color = fillColor)
      ..drawCircle(
        center,
        radius - borderWidth / 2,
        Paint()
          ..color = isEnabled ? borderColor : disabledBorderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth,
      );
  }
}
