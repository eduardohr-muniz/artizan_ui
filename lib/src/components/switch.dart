import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ArtSwitch extends StatelessWidget {
  final void Function(bool?)? onSaved;
  final Widget? label;
  final Widget Function(String)? error;
  final Widget? description;
  final void Function(bool)? onChanged;
  final dynamic Function(bool?)? valueTransformer;
  final void Function()? onReset;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final String? restorationId;
  final bool initialValue;
  final ShadDecoration? decoration;
  final FocusNode? focusNode;
  final String? Function(bool)? validator;
  final Color? thumbColor;
  final Color? uncheckedTrackColor;
  final Color? checkedTrackColor;
  final double? width;
  final double? margin;
  final Duration? duration;
  final Widget? inputLabel;
  final Widget? inputSublabel;
  final EdgeInsets? padding;
  final TextDirection? direction;

  const ArtSwitch({
    super.key,
    this.onSaved,
    this.label,
    this.error,
    this.description,
    this.onChanged,
    this.valueTransformer,
    this.onReset,
    this.enabled = true,
    this.autovalidateMode,
    this.restorationId,
    required this.initialValue,
    this.decoration,
    this.focusNode,
    this.validator,
    this.thumbColor,
    this.uncheckedTrackColor,
    this.checkedTrackColor,
    this.width,
    this.margin,
    this.duration,
    this.inputLabel,
    this.inputSublabel,
    this.padding,
    this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return ShadSwitchFormField(
      initialValue: initialValue,
      decoration: decoration,
      focusNode: focusNode,
      validator: validator,
      thumbColor: thumbColor,
      uncheckedTrackColor: uncheckedTrackColor,
      checkedTrackColor: checkedTrackColor,
      width: width,
      margin: margin,
      duration: duration,
      inputLabel: inputLabel,
      inputSublabel: inputSublabel,
      padding: padding,
      direction: direction,
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      onReset: onReset,
      onChanged: onChanged,
      onSaved: onSaved,
      valueTransformer: valueTransformer,
      label: label,
      description: description,
      restorationId: restorationId,
      error: error,
    );
  }
}
