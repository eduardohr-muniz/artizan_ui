import 'package:dotted_border/dotted_border.dart';
import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

/// Card com borda **tracejada** (dotted), no mesmo espírito do [DsDividerDotted]:
/// usa o pacote `dotted_border` para desenhar um retângulo arredondado pontilhado
/// ao redor do conteúdo, em vez de uma borda sólida como o [DSCard].
///
/// Layout do conteúdo espelha o [DSCard]: `leading` à esquerda, coluna com
/// `title` (h3) + `description` (muted) + `child` no centro, e `trailing` à
/// direita. Quando [onPressed] é informado, o card inteiro vira tappável (com
/// ripple respeitando o raio arredondado).
class DSCardDotted extends StatelessWidget {
  const DSCardDotted({
    super.key,
    this.title,
    this.description,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.radius,
    this.strokeWidth = 1.2,
    this.dashPattern = const [5, 4],
    this.width,
    this.rowCrossAxisAlignment,
    this.columnCrossAxisAlignment,
  });

  /// Título exibido no topo da coluna central (estilo `h3`).
  final Widget? title;

  /// Descrição abaixo do título (estilo `muted`).
  final Widget? description;

  /// Conteúdo principal, abaixo da descrição.
  final Widget? child;

  /// Widget no início da linha (tipicamente um ícone).
  final Widget? leading;

  /// Widget no fim da linha (tipicamente um chevron).
  final Widget? trailing;

  /// Quando informado, o card inteiro fica tappável.
  final VoidCallback? onPressed;

  /// Espaçamento interno do conteúdo. Default: `DSSize.s16` em volta.
  final EdgeInsets? padding;

  /// Cor de fundo do card. Default: cor de card do tema.
  final Color? backgroundColor;

  /// Cor da borda tracejada. Default: `context.dsColors.border`.
  final Color? borderColor;

  /// Raio dos cantos arredondados. Default: raio do tema.
  final BorderRadius? radius;

  /// Espessura da borda tracejada.
  final double strokeWidth;

  /// Padrão do tracejado `[traço, espaço]`.
  final List<double> dashPattern;

  /// Largura explícita. Default: preenche a largura disponível.
  final double? width;

  /// Alinhamento vertical da linha (leading/coluna/trailing).
  final CrossAxisAlignment? rowCrossAxisAlignment;

  /// Alinhamento horizontal da coluna central.
  final CrossAxisAlignment? columnCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    final resolvedRadius = radius ?? theme.radius;
    final resolvedBorderColor = borderColor ?? context.dsColors.border;
    final resolvedBackground = backgroundColor ?? theme.colorScheme.card;
    final resolvedPadding = padding ?? const EdgeInsets.all(16);

    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: resolvedRadius.topLeft,
        color: resolvedBorderColor,
        strokeWidth: strokeWidth,
        dashPattern: dashPattern,
        // Sem folga entre a borda e o filho — a borda encosta no fundo arredondado.
        padding: EdgeInsets.zero,
      ),
      child: Material(
        color: resolvedBackground,
        borderRadius: resolvedRadius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          borderRadius: resolvedRadius,
          child: Padding(
            padding: resolvedPadding,
            child: _buildContent(theme),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(DSThemeData theme) {
    return Row(
      crossAxisAlignment: rowCrossAxisAlignment ?? CrossAxisAlignment.center,
      spacing: 12,
      children: [
        if (leading != null) leading!,
        Expanded(child: _buildColumn(theme)),
        if (trailing != null) trailing!,
      ],
    );
  }

  Widget _buildColumn(DSThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: columnCrossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        if (title != null)
          DefaultTextStyle(
            style: theme.textTheme.h3.copyWith(color: theme.colorScheme.cardForeground),
            child: title!,
          ),
        if (description != null)
          DefaultTextStyle(
            style: theme.textTheme.muted.copyWith(
              color: theme.colorScheme.mutedForeground,
            ),
            child: description!,
          ),
        if (child != null) child!,
      ],
    );
  }
}
