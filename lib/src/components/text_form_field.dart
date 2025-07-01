import 'package:artizan_ui/artizan_ui.dart';
import 'package:auto_form_validate/form_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'dart:ui' as ui;

enum ArtTextFieldVariant {
  primary,
  underline;
}

class ArtTextFormField extends StatefulWidget {
  final Object? id;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
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
  final FormController? formController;

  // Propriedades adicionais para o variant underline

  final String? helperText;
  final String? counterText;
  final String? prefixText;
  final String? suffixText;
  final String? placeHolderText;

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
    this.formController,
  })  : variant = ArtTextFieldVariant.primary,
        helperText = null,
        counterText = null,
        prefixText = null,
        suffixText = null,
        placeHolderText = null;

  const ArtTextFormField.underline({
    super.key,
    this.id,
    this.onSaved,
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
    this.validator,
    this.helperText,
    this.counterText,
    this.prefixText,
    this.suffixText,
    this.placeHolderText,
    this.formController,
  }) : variant = ArtTextFieldVariant.underline;

  @override
  State<ArtTextFormField> createState() => _ArtTextFormFieldState();
}

class _ArtTextFormFieldState extends State<ArtTextFormField> {
  late final FocusNode? _focusNode;

  @override
  void initState() {
    _validate();
    _focusNode = widget.formController?.helper.prepareFocusNode(widget.focusNode);
    if (widget.controller != null) _handleInitalValueController();
    super.initState();
  }

  _validate() {
    assert(!(widget.formController != null && widget.formController!.formaters.length >= 2 && widget.controller == null), 'To use two masks it is necessary to provide a controller');
    assert(!(widget.initialValue != null && widget.controller != null), 'When you have a controller, you do not need to provide an initialValue');
  }

  _handleInitalValueController() {
    if (widget.controller!.text.isNotEmpty) {
      widget.controller!.text = widget.formController!.helper.formatValue(value: widget.controller!.text);
    }
  }

  String? _initialValue() {
    if (widget.controller != null) return null;
    if (widget.formController != null && widget.formController!.formaters.isNotEmpty) {
      return widget.formController!.helper.formatValue(value: widget.initialValue ?? '');
    }

    return widget.initialValue;
  }

  TextInputType? _keyboardType() {
    return widget.keyboardType ?? widget.formController?.textInputType;
  }

  void Function(String v)? _onChanged(String v) {
    if (widget.formController != null && widget.formController!.formaters.length > 1) {
      widget.formController!.helper.updateMask(value: v, controller: widget.controller!, regexFilter: widget.formController!.regexFilter, textInputType: widget.formController!.textInputType);
    }
    widget.onChanged == null ? null : widget.onChanged!(v);
    return null;
  }

  String? Function(String? v)? _validator() {
    return widget.validator ?? (v) => widget.formController?.helper.validate(v);
  }

  List<TextInputFormatter>? _inputFormatters() {
    return widget.inputFormatters ?? widget.formController?.helper.buildFormatters();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ArtTextTheme textTheme = ArtTheme.of(context).textTheme;
    ArtColorScheme colors = ArtTheme.of(context).colorScheme;
    switch (widget.variant) {
      case ArtTextFieldVariant.primary:
        return ShadInputFormField(
          id: widget.id,
          onSaved: widget.onSaved,
          validator: _validator(),
          initialValue: _initialValue(),
          enabled: widget.enabled,
          autovalidateMode: widget.autovalidateMode,
          restorationId: widget.restorationId,
          controller: widget.controller,
          label: widget.label,
          error: widget.error,
          description: widget.description,
          onChanged: (v) => _onChanged(v),
          valueTransformer: widget.valueTransformer,
          onReset: widget.onReset,
          focusNode: _focusNode,
          decoration: widget.decoration,
          placeholder: widget.placeholder,
          magnifierConfiguration: widget.magnifierConfiguration,
          keyboardType: _keyboardType(),
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          autofocus: widget.autofocus,
          obscuringCharacter: widget.obscuringCharacter,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          enableSuggestions: widget.enableSuggestions,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          readOnly: widget.readOnly,
          showCursor: widget.showCursor,
          maxLength: widget.maxLength,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
          onAppPrivateCommand: widget.onAppPrivateCommand,
          inputFormatters: _inputFormatters(),
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorOpacityAnimates: widget.cursorOpacityAnimates,
          cursorColor: widget.cursorColor,
          selectionHeightStyle: widget.selectionHeightStyle,
          selectionWidthStyle: widget.selectionWidthStyle,
          keyboardAppearance: widget.keyboardAppearance,
          scrollPadding: widget.scrollPadding,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          dragStartBehavior: widget.dragStartBehavior,
          onPressed: widget.onPressed,
          onPressedAlwaysCalled: widget.onPressedAlwaysCalled,
          onPressedOutside: widget.onPressedOutside,
          mouseCursor: widget.mouseCursor,
          scrollPhysics: widget.scrollPhysics,
          scrollController: widget.scrollController,
          autofillHints: widget.autofillHints,
          clipBehavior: widget.clipBehavior,
          scribbleEnabled: widget.scribbleEnabled,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
          contentInsertionConfiguration: widget.contentInsertionConfiguration,
          contextMenuBuilder: widget.contextMenuBuilder,
          undoController: widget.undoController,
          spellCheckConfiguration: widget.spellCheckConfiguration,
          selectionColor: widget.selectionColor,
          padding: widget.padding,
          leading: widget.leading,
          trailing: widget.trailing,
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          placeholderStyle: widget.placeholderStyle,
          placeholderAlignment: widget.placeholderAlignment,
          inputPadding: widget.inputPadding,
          gap: widget.gap,
          constraints: widget.constraints,
          groupId: widget.groupId,
        );
      case ArtTextFieldVariant.underline:
        return TextFormField(
          onSaved: widget.onSaved,
          initialValue: _initialValue(),
          enabled: widget.enabled,
          autovalidateMode: widget.autovalidateMode,
          restorationId: widget.restorationId,
          controller: widget.controller,
          onChanged: (v) => _onChanged(v),
          focusNode: _focusNode,
          magnifierConfiguration: widget.magnifierConfiguration,
          keyboardType: _keyboardType(),
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          autofocus: widget.autofocus,
          obscuringCharacter: widget.obscuringCharacter,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          enableSuggestions: widget.enableSuggestions,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          decoration: InputDecoration(
            filled: false,
            constraints: widget.constraints,
            enabled: widget.enabled,
            errorMaxLines: 10,
            helperText: widget.helperText,
            counterText: widget.counterText,
            prefixIconColor: colors.primary,
            prefixText: widget.prefixText,
            hintStyle: widget.placeholderStyle?.copyWith(color: colors.mutedForeground) ?? textTheme.muted,
            suffixText: widget.suffixText,
            label: widget.label,
            hintText: widget.placeHolderText,
            alignLabelWithHint: true,
            isDense: true,
          ),
          readOnly: widget.readOnly,
          showCursor: widget.showCursor,
          maxLength: widget.maxLength,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          onEditingComplete: widget.onEditingComplete,
          onAppPrivateCommand: widget.onAppPrivateCommand,
          inputFormatters: _inputFormatters(),
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorOpacityAnimates: widget.cursorOpacityAnimates,
          cursorColor: widget.cursorColor,
          selectionHeightStyle: widget.selectionHeightStyle,
          selectionWidthStyle: widget.selectionWidthStyle,
          keyboardAppearance: widget.keyboardAppearance,
          scrollPadding: widget.scrollPadding,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          dragStartBehavior: widget.dragStartBehavior,
          mouseCursor: widget.mouseCursor,
          scrollPhysics: widget.scrollPhysics,
          scrollController: widget.scrollController,
          autofillHints: widget.autofillHints,
          clipBehavior: widget.clipBehavior,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
          contentInsertionConfiguration: widget.contentInsertionConfiguration,
          contextMenuBuilder: widget.contextMenuBuilder,
          undoController: widget.undoController,
          spellCheckConfiguration: widget.spellCheckConfiguration,
          onTap: widget.onPressed,
          validator: _validator(),
        );
    }
  }
}
