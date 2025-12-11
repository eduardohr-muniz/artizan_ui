import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef ArtSliderController = ShadSliderController;

typedef ArtSliderInteraction = ShadSliderInteraction;

class ArtSlider extends StatelessWidget {
  /// {@macro ShadSlider.initialValue}
  final double? initialValue;

  /// {@macro ShadSlider.onChanged}
  final ValueChanged<double>? onChanged;

  /// {@macro ShadSlider.enabled}
  final bool enabled;

  /// {@macro ShadSlider.min}
  final double? min;

  /// {@macro ShadSlider.max}
  final double? max;

  /// {@macro ShadSlider.focusNode}
  final FocusNode? focusNode;

  /// {@macro ShadSlider.autofocus}
  final bool autofocus;

  /// {@macro ShadSlider.mouseCursor}
  final MouseCursor? mouseCursor;

  /// {@macro ShadSlider.disabledMouseCursor}
  final MouseCursor? disabledMouseCursor;

  /// {@macro ShadSlider.thumbColor}
  final Color? thumbColor;

  /// {@macro ShadSlider.disabledThumbColor}
  final Color? disabledThumbColor;

  /// {@macro ShadSlider.thumbBorderColor}
  final Color? thumbBorderColor;

  /// {@macro ShadSlider.disabledThumbBorderColor}
  final Color? disabledThumbBorderColor;

  /// {@macro ShadSlider.activeTrackColor}
  final Color? activeTrackColor;

  /// {@macro ShadSlider.inactiveTrackColor}
  final Color? inactiveTrackColor;

  /// {@macro ShadSlider.disabledActiveTrackColor}
  final Color? disabledActiveTrackColor;

  /// {@macro ShadSlider.disabledInactiveTrackColor}
  final Color? disabledInactiveTrackColor;

  /// {@macro ShadSlider.trackHeight}
  final double? trackHeight;

  /// {@macro ShadSlider.thumbRadius}
  final double? thumbRadius;

  /// {@macro ShadSlider.onChangeStart}
  final ValueChanged<double>? onChangeStart;

  /// {@macro ShadSlider.onChangeEnd}
  final ValueChanged<double>? onChangeEnd;

  /// {@macro ShadSlider.divisions}
  final int? divisions;

  /// {@macro ShadSlider.label}
  final String? label;

  /// {@macro ShadSlider.semanticFormatterCallback}
  final SemanticFormatterCallback? semanticFormatterCallback;

  /// {@macro ShadSlider.allowedInteraction}
  final ArtSliderInteraction? allowedInteraction;

  /// {@macro ShadSliderController}
  final ArtSliderController? controller;

  const ArtSlider({
    super.key,
    this.initialValue,
    this.onChanged,
    this.enabled = true,
    this.min,
    this.max,
    this.focusNode,
    this.autofocus = false,
    this.mouseCursor,
    this.disabledMouseCursor,
    this.thumbColor,
    this.disabledThumbColor,
    this.thumbBorderColor,
    this.disabledThumbBorderColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.disabledActiveTrackColor,
    this.disabledInactiveTrackColor,
    this.trackHeight,
    this.thumbRadius,
    this.onChangeStart,
    this.onChangeEnd,
    this.divisions,
    this.label,
    this.semanticFormatterCallback,
    this.allowedInteraction,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ShadSlider(
      initialValue: initialValue,
      onChanged: onChanged,
      enabled: enabled,
      min: min,
      max: max,
      focusNode: focusNode,
      autofocus: autofocus,
      mouseCursor: mouseCursor,
      disabledMouseCursor: disabledMouseCursor,
      thumbColor: thumbColor,
      disabledThumbColor: disabledThumbColor,
      thumbBorderColor: thumbBorderColor,
      disabledThumbBorderColor: disabledThumbBorderColor,
      activeTrackColor: activeTrackColor,
      inactiveTrackColor: inactiveTrackColor,
      disabledActiveTrackColor: disabledActiveTrackColor,
      disabledInactiveTrackColor: disabledInactiveTrackColor,
      trackHeight: trackHeight,
      thumbRadius: thumbRadius,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
      divisions: divisions,
      label: label,
      semanticFormatterCallback: semanticFormatterCallback,
      allowedInteraction: allowedInteraction,
      controller: controller,
    );
  }
}
