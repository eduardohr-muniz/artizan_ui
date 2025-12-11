import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:artizan_ui/artizan_ui.dart';

class ArtCheckBox extends StatelessWidget {
  final String? id;

  final FormFieldSetter<bool>? onSaved;

  final Widget? label;

  final Widget Function(String)? error;

  final Widget? description;

  final ValueChanged<bool>? onChanged;

  final ValueTransformer<bool?>? valueTransformer;

  final VoidCallback? onReset;

  final bool enabled;

  final AutovalidateMode? autovalidateMode;

  final String? restorationId;

  final bool initialValue;

  final FocusNode? focusNode;

  final ArtDecoration? decoration;

  final String? Function(bool)? validator;

  final double? size;

  final Duration? duration;

  final Widget? icon;

  final Color? color;

  final Widget? inputLabel;

  final Widget? inputSublabel;

  final EdgeInsets? padding;

  final TextDirection? direction;

  final CrossAxisAlignment? crossAxisAlignment;

  final EdgeInsets? checkboxPadding;

  final String? forceErrorText;
  const ArtCheckBox({
    required this.initialValue,
    super.key,
    this.id,
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
    this.focusNode,
    this.decoration,
    this.validator,
    this.size,
    this.duration,
    this.icon,
    this.color,
    this.inputLabel,
    this.inputSublabel,
    this.padding,
    this.direction,
    this.crossAxisAlignment,
    this.checkboxPadding,
    this.forceErrorText,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCheckboxFormField(
      id: id,
      key: key,
      onSaved: onSaved,
      label: label,
      error: error,
      description: description,
      onChanged: onChanged,
      valueTransformer: valueTransformer,
      onReset: onReset,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      restorationId: restorationId,
      initialValue: initialValue,
      focusNode: focusNode,
      decoration: decoration,
      validator: validator,
      size: size,
      duration: duration,
      icon: icon,
      color: color,
      inputLabel: inputLabel,
      inputSublabel: inputSublabel,
      padding: padding,
      direction: direction,
      crossAxisAlignment: crossAxisAlignment,
      checkboxPadding: checkboxPadding,
      forceErrorText: forceErrorText,
    );
  }
}
