import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Widget principal do ArtInputOtp
class ArtInputOtp extends StatelessWidget {
  const ArtInputOtp({
    super.key,
    required this.maxLength,
    required this.children,
    this.gap,
    this.jumpToNextWhenFilled = true,
    this.inputFormatters,
    this.keyboardType,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.label,
    this.error,
    this.description,
    this.id,
    this.onSaved,
    this.valueTransformer,
    this.onReset,
    this.autovalidateMode,
    this.restorationId,
  });

  /// Número máximo de caracteres
  final int maxLength;

  /// Lista de widgets filhos (geralmente slots para os caracteres)
  final List<Widget> children;

  /// Espaçamento entre os caracteres
  final double? gap;

  /// Se deve pular para o próximo campo quando preenchido
  final bool jumpToNextWhenFilled;

  /// Formatadores de entrada
  final List<TextInputFormatter>? inputFormatters;

  /// Tipo de teclado
  final TextInputType? keyboardType;

  /// Valor inicial
  final String? initialValue;

  /// Se o campo está habilitado
  final bool enabled;

  /// Se o campo é somente leitura
  final bool readOnly;

  /// Função de validação
  final String? Function(String)? validator;

  /// Callback chamado quando o valor muda
  final void Function(String)? onChanged;

  /// Label do campo
  final Widget? label;

  /// Mensagem de erro
  final Widget? error;

  /// Descrição do campo
  final Widget? description;

  /// ID do campo
  final String? id;

  /// Callback para salvar
  final FormFieldSetter<String>? onSaved;

  /// Transformador de valor
  final ValueTransformer<String?>? valueTransformer;

  /// Callback para reset
  final VoidCallback? onReset;

  /// Modo de auto validação
  final AutovalidateMode? autovalidateMode;

  /// ID de restauração
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return ShadInputOTPFormField(
      id: id,
      key: key,
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      restorationId: restorationId,
      label: label,
      description: description,
      onChanged: onChanged,
      valueTransformer: valueTransformer,
      onReset: onReset,
      readOnly: readOnly,
      maxLength: maxLength,
      gap: gap,
      jumpToNextWhenFilled: jumpToNextWhenFilled,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      children: children,
    );
  }
}

/// Widget para agrupar slots do Input OTP
class ArtInputOtpGroup extends StatelessWidget {
  const ArtInputOtpGroup({
    super.key,
    required this.children,
  });

  /// Lista de widgets filhos (slots do OTP)
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ShadInputOTPGroup(
      children: children,
    );
  }
}

/// Widget para um slot individual do Input OTP
class ArtInputOtpSlot extends StatelessWidget {
  const ArtInputOtpSlot({
    super.key,
    this.focusNode,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.style,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.firstRadius,
    this.lastRadius,
    this.singleRadius,
    this.middleRadius,
    this.initialValue,
    this.textInputAction,
  });

  /// Nó de foco para o input do slot
  final FocusNode? focusNode;

  /// Controlador para o input do slot
  final ShadTextEditingController? controller;

  /// Formatadores de entrada para o input do slot
  final List<TextInputFormatter>? inputFormatters;

  /// Tipo de teclado para o input do slot
  final TextInputType? keyboardType;

  /// Estilo do texto do slot
  final TextStyle? style;

  /// Largura do slot
  final double? width;

  /// Altura do slot
  final double? height;

  /// Padding do slot
  final EdgeInsets? padding;

  /// Decoração do slot
  final ArtDecoration? decoration;

  /// Raio aplicado ao primeiro slot de cada grupo
  final BorderRadius? firstRadius;

  /// Raio aplicado ao último slot de cada grupo
  final BorderRadius? lastRadius;

  /// Raio aplicado ao slot único de cada grupo
  final BorderRadius? singleRadius;

  /// Raio aplicado aos slots do meio de cada grupo
  final BorderRadius? middleRadius;

  /// Valor inicial do slot
  final String? initialValue;

  /// Ação do input de texto para o slot
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return ShadInputOTPSlot(
      focusNode: focusNode,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: style,
      width: width,
      height: height,
      padding: padding,
      decoration: decoration,
      firstRadius: firstRadius,
      lastRadius: lastRadius,
      singleRadius: singleRadius,
      middleRadius: middleRadius,
      initialValue: initialValue,
      textInputAction: textInputAction,
    );
  }
}
