import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes do botão do menu bar
enum ArtMenuBarButtonVariant {
  primary(ShadButtonVariant.primary),
  destructive(ShadButtonVariant.destructive),
  outline(ShadButtonVariant.outline),
  secondary(ShadButtonVariant.secondary),
  ghost(ShadButtonVariant.ghost),
  link(ShadButtonVariant.link);

  final ShadButtonVariant shadVariant;

  const ArtMenuBarButtonVariant(this.shadVariant);
}

/// Tamanhos do botão do menu bar
enum ArtMenuBarButtonSize {
  regular(ShadButtonSize.regular),
  sm(ShadButtonSize.sm),
  lg(ShadButtonSize.lg);

  final ShadButtonSize shadSize;

  const ArtMenuBarButtonSize(this.shadSize);
}

/// Controlador do menu bar
typedef ArtMenuBarController = ShadMenubarController;

/// Widget que encapsula o ShadMenubar
class ArtMenuBar extends StatelessWidget {
  const ArtMenuBar({
    super.key,
    required this.items,
    this.radius,
    this.controller,
    this.padding,
    this.backgroundColor,
    this.border,
    this.selectOnHover,
  });

  /// Os itens do menu bar
  final Iterable<Widget> items;

  /// O raio do menu bar
  final BorderRadiusGeometry? radius;

  /// O controlador do menu bar
  final ArtMenuBarController? controller;

  /// O padding do menu bar
  final EdgeInsetsGeometry? padding;

  /// A cor de fundo do menu bar
  final Color? backgroundColor;

  /// A borda do menu bar
  final ShadBorder? border;

  /// Se deve selecionar no hover
  final bool? selectOnHover;

  @override
  Widget build(BuildContext context) {
    return ShadMenubar(
      items: items,
      radius: radius,
      controller: controller,
      padding: padding,
      backgroundColor: backgroundColor,
      border: border,
      selectOnHover: selectOnHover,
    );
  }
}

/// Widget que encapsula o ShadMenubarItem
class ArtMenuBarItem extends StatelessWidget {
  const ArtMenuBarItem({
    super.key,
    required this.child,
    required this.items,
    this.constraints,
    this.onHoverArea,
    this.padding,
    this.groupId,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.controller,
    this.anchor,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.variant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.expands,
  });

  /// O widget filho
  final Widget child;

  /// Os itens do submenu
  final List<Widget> items;

  /// Restrições de tamanho
  final BoxConstraints? constraints;

  /// Callback quando a área de hover muda
  final ValueChanged<bool>? onHoverArea;

  /// Padding do menu
  final EdgeInsetsGeometry? padding;

  /// ID do grupo
  final Object? groupId;

  /// Efeitos visuais
  final List<Effect<dynamic>>? effects;

  /// Sombras
  final List<BoxShadow>? shadows;

  /// Decoração
  final ShadDecoration? decoration;

  /// Filtro de imagem
  final ImageFilter? filter;

  /// Controlador do popover
  final ShadPopoverController? controller;

  /// Âncora do menu
  final ShadAnchorBase? anchor;

  /// Callback de long press
  final VoidCallback? onLongPress;

  /// Widget à esquerda
  final Widget? leading;

  /// Widget à direita
  final Widget? trailing;

  /// Variante do botão
  final ArtMenuBarButtonVariant? variant;

  /// Tamanho do botão
  final ArtMenuBarButtonSize? size;

  /// Cursor do mouse
  final MouseCursor? cursor;

  /// Largura do botão
  final double? width;

  /// Altura do botão
  final double? height;

  /// Padding do botão
  final EdgeInsetsGeometry? buttonPadding;

  /// Cor de fundo do botão
  final Color? backgroundColor;

  /// Cor de fundo quando selecionado
  final Color? selectedBackgroundColor;

  /// Cor de fundo no hover
  final Color? hoverBackgroundColor;

  /// Cor do texto
  final Color? foregroundColor;

  /// Cor do texto no hover
  final Color? hoverForegroundColor;

  /// Se deve focar automaticamente
  final bool autofocus;

  /// Nó de foco
  final FocusNode? focusNode;

  /// Cor de fundo quando pressionado
  final Color? pressedBackgroundColor;

  /// Cor do texto quando pressionado
  final Color? pressedForegroundColor;

  /// Sombras do botão
  final List<BoxShadow>? buttonShadows;

  /// Gradiente
  final Gradient? gradient;

  /// Decoração do texto
  final TextDecoration? textDecoration;

  /// Decoração do texto no hover
  final TextDecoration? hoverTextDecoration;

  /// Decoração do botão
  final ShadDecoration? buttonDecoration;

  /// Se está habilitado
  final bool enabled;

  /// Controlador de estados
  final ShadStatesController? statesController;

  /// Espaçamento
  final double? gap;

  /// Alinhamento principal
  final MainAxisAlignment? mainAxisAlignment;

  /// Alinhamento cruzado
  final CrossAxisAlignment? crossAxisAlignment;

  /// Estratégias de hover
  final ShadHoverStrategies? hoverStrategies;

  /// Callback de mudança de hover
  final ValueChanged<bool>? onHoverChange;

  /// Callback de tap down
  final ValueChanged<TapDownDetails>? onTapDown;

  /// Callback de tap up
  final ValueChanged<TapUpDetails>? onTapUp;

  /// Callback de cancelamento de tap
  final VoidCallback? onTapCancel;

  /// Callback de secondary tap down
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;

  /// Callback de secondary tap up
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;

  /// Callback de cancelamento de secondary tap
  final VoidCallback? onSecondaryTapCancel;

  /// Callback de início de long press
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// Callback de cancelamento de long press
  final VoidCallback? onLongPressCancel;

  /// Callback de long press up
  final VoidCallback? onLongPressUp;

  /// Callback de long press down
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// Callback de fim de long press
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// Callback de double tap
  final VoidCallback? onDoubleTap;

  /// Callback de double tap down
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// Callback de cancelamento de double tap
  final VoidCallback? onDoubleTapCancel;

  /// Duração do long press
  final Duration? longPressDuration;

  /// Direção do texto
  final TextDirection? textDirection;

  /// Callback de mudança de foco
  final ValueChanged<bool>? onFocusChange;

  /// Se deve expandir
  final bool? expands;

  @override
  Widget build(BuildContext context) {
    return ShadMenubarItem(
      items: items,
      constraints: constraints,
      onHoverArea: onHoverArea,
      padding: padding,
      groupId: groupId,
      effects: effects,
      shadows: shadows,
      decoration: decoration,
      filter: filter,
      controller: controller,
      anchor: anchor,
      onLongPress: onLongPress,
      leading: leading,
      trailing: trailing,
      variant: variant?.shadVariant,
      size: size?.shadSize,
      cursor: cursor,
      width: width,
      height: height,
      buttonPadding: buttonPadding,
      backgroundColor: backgroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor,
      foregroundColor: foregroundColor,
      hoverForegroundColor: hoverForegroundColor,
      autofocus: autofocus,
      focusNode: focusNode,
      pressedBackgroundColor: pressedBackgroundColor,
      pressedForegroundColor: pressedForegroundColor,
      buttonShadows: buttonShadows,
      gradient: gradient,
      textDecoration: textDecoration,
      hoverTextDecoration: hoverTextDecoration,
      buttonDecoration: buttonDecoration,
      enabled: enabled,
      statesController: statesController,
      gap: gap,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      hoverStrategies: hoverStrategies,
      onHoverChange: onHoverChange,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onLongPressStart: onLongPressStart,
      onLongPressCancel: onLongPressCancel,
      onLongPressUp: onLongPressUp,
      onLongPressDown: onLongPressDown,
      onLongPressEnd: onLongPressEnd,
      onDoubleTap: onDoubleTap,
      onDoubleTapDown: onDoubleTapDown,
      onDoubleTapCancel: onDoubleTapCancel,
      longPressDuration: longPressDuration,
      textDirection: textDirection,
      onFocusChange: onFocusChange,
      expands: expands,
      child: child,
    );
  }
}
