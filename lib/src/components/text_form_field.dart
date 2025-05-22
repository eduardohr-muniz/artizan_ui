import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'dart:ui' as ui;

enum ArtTextFieldVariant {
  primary,
  underline;
}

class ArtTextFormField extends StatelessWidget {
  final Object? id;
  final void Function(String? value)? onSaved;
  final String? Function(String value)? validator;
  final String? initialValue;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;
  final String? restorationId;
  final TextEditingController? controller;
  final Widget? label;
  final Widget Function(String value)? error;
  final Widget? description;
  final void Function(String value)? onChanged;
  final dynamic Function(String? value)? valueTransformer;
  final void Function()? onReset;
  final FocusNode? focusNode;
  final ShadDecoration? decoration;
  final Widget? placeholder;
  final TextMagnifierConfiguration magnifierConfiguration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool readOnly;
  final bool? showCursor;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final VoidCallback? onEditingComplete;
  final void Function(String value)? onSubmitted;
  final void Function(String value, Map<String, dynamic> map)? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final bool? cursorOpacityAnimates;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  final void Function()? onPressed;
  final bool onPressedAlwaysCalled;
  final void Function(PointerDownEvent pointer)? onPressedOutside;
  final MouseCursor? mouseCursor;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final bool scribbleEnabled;
  final bool enableIMEPersonalizedLearning;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Widget Function(BuildContext context, EditableTextState state)? contextMenuBuilder;
  final UndoHistoryController? undoController;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final Color? selectionColor;
  final EdgeInsets? padding;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextStyle? placeholderStyle;
  final Alignment? placeholderAlignment;
  final EdgeInsets? inputPadding;
  final double? gap;
  final BoxConstraints? constraints;
  final Object? groupId;
  final ArtTextFieldVariant variant;

  const ArtTextFormField({
    super.key,
    this.id,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.enabled = true,
    this.autovalidateMode,
    this.restorationId,
    this.controller,
    this.label,
    this.error,
    this.description,
    this.onChanged,
    this.valueTransformer,
    this.onReset,
    this.focusNode,
    this.decoration,
    this.placeholder,
    this.magnifierConfiguration = TextMagnifierConfiguration.disabled,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines,
    this.minLines,
    this.expands = false,
    this.readOnly = false,
    this.showCursor,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.enableInteractiveSelection,
    this.selectionControls,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onPressed,
    this.onPressedAlwaysCalled = false,
    this.onPressedOutside,
    this.mouseCursor,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder,
    this.undoController,
    this.spellCheckConfiguration,
    this.selectionColor,
    this.padding,
    this.leading,
    this.trailing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.placeholderStyle,
    this.placeholderAlignment,
    this.inputPadding,
    this.gap,
    this.constraints,
    this.groupId,
  }) : variant = ArtTextFieldVariant.primary;

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      id: id,
      key: key,
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      restorationId: restorationId,
      controller: controller,
      label: label,
      error: error,
      description: description,
      onChanged: onChanged,
      valueTransformer: valueTransformer,
      onReset: onReset,
      // focusNode: focusNode,
      decoration: decoration,
      placeholder: placeholder,
      magnifierConfiguration: magnifierConfiguration,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      autofocus: autofocus,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      readOnly: readOnly,
      showCursor: showCursor,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onAppPrivateCommand: onAppPrivateCommand,
      inputFormatters: inputFormatters,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorOpacityAnimates: cursorOpacityAnimates,
      cursorColor: cursorColor,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
      dragStartBehavior: dragStartBehavior,
      onPressed: onPressed,
      onPressedAlwaysCalled: onPressedAlwaysCalled,
      onPressedOutside: onPressedOutside,
      mouseCursor: mouseCursor,
      scrollPhysics: scrollPhysics,
      scrollController: scrollController,
      autofillHints: autofillHints,
      clipBehavior: clipBehavior,
      scribbleEnabled: scribbleEnabled,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      contentInsertionConfiguration: contentInsertionConfiguration,
      contextMenuBuilder: contextMenuBuilder,
      undoController: undoController,
      spellCheckConfiguration: spellCheckConfiguration,
      selectionColor: selectionColor,
      padding: padding,
      leading: leading,
      trailing: trailing,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      placeholderStyle: placeholderStyle,
      placeholderAlignment: placeholderAlignment,
      inputPadding: inputPadding,
      gap: gap,
      // constraints: constraints,
      // groupId: groupId,
    );
  }
}
