import 'dart:ui';

import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef ArtContextMenuController = ShadContextMenuController;

/// Variantes do contexto menu
enum ArtContextMenuItemVariant {
  primary(ShadContextMenuItemVariant.primary),
  inset(ShadContextMenuItemVariant.inset);

  final ShadContextMenuItemVariant shadVariant;

  const ArtContextMenuItemVariant(this.shadVariant);
}

/// Widget que encapsula o ShadContextMenuRegion
class ArtContextMenuRegion extends StatelessWidget {
  const ArtContextMenuRegion({
    super.key,
    required this.child,
    required this.items,
    this.visible,
    this.constraints,
    this.onHoverArea,
    this.padding,
    this.groupId,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.controller,
    this.supportedDevices,
    this.longPressEnabled,
  });

  /// O widget filho que dispara a visibilidade do menu de contexto
  final Widget child;

  /// Os itens do menu de contexto
  final List<Widget> items;

  /// Se o menu de contexto está visível
  final bool? visible;

  /// Restrições de tamanho do menu
  final BoxConstraints? constraints;

  /// Callback quando a área de hover muda
  final ValueChanged<bool>? onHoverArea;

  /// Padding do menu
  final EdgeInsetsGeometry? padding;

  /// ID do grupo para gerenciamento de múltiplos menus
  final Object? groupId;

  /// Efeitos visuais
  final List<Effect<dynamic>>? effects;

  /// Sombras
  final List<BoxShadow>? shadows;

  /// Decoração
  final ArtDecoration? decoration;

  /// Filtro de imagem
  final ImageFilter? filter;

  /// Controlador do menu
  final ArtContextMenuController? controller;

  /// Tipos de dispositivos suportados
  final Set<PointerDeviceKind>? supportedDevices;

  /// Se o long press está habilitado
  final bool? longPressEnabled;

  @override
  Widget build(BuildContext context) {
    return ShadContextMenuRegion(
      items: items,
      visible: visible,
      constraints: constraints,
      onHoverArea: onHoverArea,
      padding: padding,
      groupId: groupId,
      effects: effects,
      shadows: shadows,
      decoration: decoration,
      filter: filter,
      controller: controller,
      supportedDevices: supportedDevices,
      longPressEnabled: longPressEnabled,
      child: child,
    );
  }
}

/// Widget que encapsula o ShadContextMenu
class ArtContextMenu extends StatelessWidget {
  const ArtContextMenu({
    super.key,
    required this.child,
    required this.items,
    this.anchor,
    this.visible,
    this.constraints,
    this.onHoverArea,
    this.padding,
    this.groupId,
    this.effects,
    this.shadows,
    this.decoration,
    this.filter,
    this.controller,
    this.onTapOutside,
    this.onTapInside,
    this.onTapUpInside,
    this.onTapUpOutside,
  });

  /// O widget filho
  final Widget child;

  /// Os itens do menu
  final List<Widget> items;

  /// Âncora do menu
  final ShadAnchorBase? anchor;

  /// Se o menu está visível
  final bool? visible;

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

  /// Controlador do menu
  final ShadContextMenuController? controller;

  /// Callback quando toca fora
  final TapRegionCallback? onTapOutside;

  /// Callback quando toca dentro
  final TapRegionCallback? onTapInside;

  /// Callback quando toca para cima dentro
  final TapRegionUpCallback? onTapUpInside;

  /// Callback quando toca para cima fora
  final TapRegionUpCallback? onTapUpOutside;

  @override
  Widget build(BuildContext context) {
    return ShadContextMenu(
      items: items,
      anchor: anchor,
      visible: visible,
      constraints: constraints,
      onHoverArea: onHoverArea,
      padding: padding,
      groupId: groupId,
      effects: effects,
      shadows: shadows,
      decoration: decoration,
      filter: filter,
      controller: controller,
      onTapOutside: onTapOutside,
      onTapInside: onTapInside,
      onTapUpInside: onTapUpInside,
      onTapUpOutside: onTapUpOutside,
      child: child,
    );
  }
}

/// Widget que encapsula o ShadContextMenuItem
class ArtContextMenuItem extends StatelessWidget {
  const ArtContextMenuItem({
    super.key,
    required this.child,
    this.items = const [],
    this.enabled = true,
    this.leading,
    this.trailing,
    this.leadingPadding,
    this.trailingPadding,
    this.padding,
    this.onPressed,
    this.anchor,
    this.showDelay,
    this.height,
    this.buttonVariant,
    this.decoration,
    this.textStyle,
    this.trailingTextStyle,
    this.constraints,
    this.subMenuPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.closeOnTap,
  }) : variant = ArtContextMenuItemVariant.primary;

  const ArtContextMenuItem.inset({
    super.key,
    required this.child,
    this.items = const [],
    this.enabled = true,
    this.leading,
    this.trailing,
    this.leadingPadding,
    this.trailingPadding,
    this.padding,
    this.onPressed,
    this.anchor,
    this.showDelay,
    this.height,
    this.buttonVariant,
    this.decoration,
    this.textStyle,
    this.trailingTextStyle,
    this.constraints,
    this.subMenuPadding,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.closeOnTap,
  }) : variant = ArtContextMenuItemVariant.inset;

  /// Variante do item
  final ArtContextMenuItemVariant variant;

  /// O widget filho
  final Widget child;

  /// Subitens do menu
  final List<Widget> items;

  /// Se o item está habilitado
  final bool enabled;

  /// Widget à esquerda
  final Widget? leading;

  /// Widget à direita
  final Widget? trailing;

  /// Padding do widget à esquerda
  final EdgeInsetsGeometry? leadingPadding;

  /// Padding do widget à direita
  final EdgeInsetsGeometry? trailingPadding;

  /// Padding do item
  final EdgeInsetsGeometry? padding;

  /// Callback quando pressionado
  final VoidCallback? onPressed;

  /// Âncora do submenu
  final ShadAnchorBase? anchor;

  /// Delay para mostrar o submenu
  final Duration? showDelay;

  /// Altura do item
  final double? height;

  /// Variante do botão
  final ShadButtonVariant? buttonVariant;

  /// Decoração
  final ShadDecoration? decoration;

  /// Estilo do texto
  final TextStyle? textStyle;

  /// Estilo do texto à direita
  final TextStyle? trailingTextStyle;

  /// Restrições de tamanho
  final BoxConstraints? constraints;

  /// Padding do submenu
  final EdgeInsetsGeometry? subMenuPadding;

  /// Cor de fundo
  final Color? backgroundColor;

  /// Cor de fundo quando selecionado
  final Color? selectedBackgroundColor;

  /// Se deve fechar ao tocar
  final bool? closeOnTap;

  @override
  Widget build(BuildContext context) {
    return ShadContextMenuItem.raw(
      key: key,
      variant: variant.shadVariant,
      items: items,
      enabled: enabled,
      leading: leading,
      trailing: trailing,
      leadingPadding: leadingPadding,
      trailingPadding: trailingPadding,
      padding: padding,
      onPressed: onPressed,
      anchor: anchor,
      showDelay: showDelay,
      height: height,
      buttonVariant: buttonVariant,
      decoration: decoration,
      textStyle: textStyle,
      trailingTextStyle: trailingTextStyle,
      constraints: constraints,
      subMenuPadding: subMenuPadding,
      backgroundColor: backgroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
      closeOnTap: closeOnTap,
      child: child,
    );
  }
}
