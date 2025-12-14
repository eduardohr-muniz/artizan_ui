import 'dart:ui';

import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef ArtContextMenuController = ShadContextMenuController;

/// Tipos de gatilho para abrir o menu de contexto
enum ArtContextMenuTrigger {
  /// Abre apenas com clique esquerdo
  leftClick,

  /// Abre apenas com clique direito
  rightClick,

  /// Abre apenas com long press
  longPress,

  /// Abre com clique esquerdo e direito
  leftAndRight,

  /// Abre com qualquer tipo de clique (esquerdo, direito ou long press)
  all,
}

/// Variantes do contexto menu
enum ArtContextMenuItemVariant {
  primary(ShadContextMenuItemVariant.primary),
  inset(ShadContextMenuItemVariant.inset);

  final ShadContextMenuItemVariant shadVariant;

  const ArtContextMenuItemVariant(this.shadVariant);
}

/// Widget que encapsula o ShadContextMenuRegion
class ArtContextMenuRegion extends StatefulWidget {
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
    this.trigger = ArtContextMenuTrigger.rightClick,
    this.hitTestBehavior,
    this.popoverReverseDuration,
    this.offset,
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

  /// Tipo de gatilho para abrir o menu
  final ArtContextMenuTrigger trigger;

  /// Comportamento durante hit testing
  final HitTestBehavior? hitTestBehavior;

  /// Duração da animação reversa do popover
  final Duration? popoverReverseDuration;

  /// Offset adicional para o posicionamento do menu
  /// Permite ajustar a posição do menu em relação ao ponto de clique
  /// Útil para evitar que o menu grude nas bordas da tela ou posicionar onde desejar
  final Offset? offset;

  @override
  State<ArtContextMenuRegion> createState() => _ArtContextMenuRegionState();
}

class _ArtContextMenuRegionState extends State<ArtContextMenuRegion> {
  ArtContextMenuController? _controller;
  Offset? _offset;

  ArtContextMenuController get controller => widget.controller ?? (_controller ??= ArtContextMenuController(isOpen: widget.visible ?? false));

  bool get _enableLeftClick => widget.trigger == ArtContextMenuTrigger.leftClick || widget.trigger == ArtContextMenuTrigger.leftAndRight || widget.trigger == ArtContextMenuTrigger.all;

  bool get _enableRightClick => widget.trigger == ArtContextMenuTrigger.rightClick || widget.trigger == ArtContextMenuTrigger.leftAndRight || widget.trigger == ArtContextMenuTrigger.all;

  bool get _enableLongPress => widget.trigger == ArtContextMenuTrigger.longPress || widget.trigger == ArtContextMenuTrigger.all;

  @override
  void didUpdateWidget(covariant ArtContextMenuRegion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != null) {
      controller.setOpen(widget.visible!);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _showAtOffset(Offset offset) {
    if (!mounted) return;
    setState(() => _offset = offset);
    controller.show();
  }

  void _show(Offset offset) {
    _showAtOffset(offset);
  }

  void _onLongPress() {
    assert(_offset != null, 'offset must not be null');
    _showAtOffset(_offset!);
  }

  @override
  Widget build(BuildContext context) {
    final effectiveLongPressEnabled = _enableLongPress && (widget.longPressEnabled ?? (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS));

    // Aplica offset se fornecido
    final finalOffset =
        _offset == null
            ? null
            : widget.offset != null
            ? Offset(_offset!.dx + widget.offset!.dx, _offset!.dy + widget.offset!.dy)
            : _offset;

    return ArtContextMenu(
      anchor: finalOffset == null ? null : ShadGlobalAnchor(finalOffset),
      controller: controller,
      items: widget.items,
      constraints: widget.constraints,
      onHoverArea: widget.onHoverArea,
      padding: widget.padding,
      groupId: widget.groupId,
      effects: widget.effects,
      shadows: widget.shadows,
      decoration: widget.decoration,
      filter: widget.filter,
      popoverReverseDuration: widget.popoverReverseDuration,
      child: ShadGestureDetector(
        behavior: widget.hitTestBehavior ?? HitTestBehavior.opaque,
        supportedDevices: widget.supportedDevices,
        onTapDown:
            _enableLeftClick
                ? (d) {
                  _show(d.globalPosition);
                }
                : null,
        onSecondaryTapDown:
            _enableRightClick
                ? (d) async {
                  final isContextMenuAlreadyDisabled = kIsWeb && !BrowserContextMenu.enabled;
                  if (kIsWeb && !isContextMenuAlreadyDisabled) {
                    await BrowserContextMenu.disableContextMenu();
                  }
                  if (defaultTargetPlatform != TargetPlatform.windows) {
                    _show(d.globalPosition);
                  }
                }
                : null,
        onSecondaryTapUp:
            _enableRightClick
                ? (d) async {
                  final isContextMenuAlreadyDisabled = kIsWeb && !BrowserContextMenu.enabled;
                  if (defaultTargetPlatform == TargetPlatform.windows) {
                    _show(d.globalPosition);
                    await Future<void>.delayed(Duration.zero);
                  }
                  if (kIsWeb && !isContextMenuAlreadyDisabled) {
                    await BrowserContextMenu.enableContextMenu();
                  }
                }
                : null,
        onLongPressStart:
            effectiveLongPressEnabled
                ? (d) {
                  _offset = d.globalPosition;
                }
                : null,
        onLongPress: effectiveLongPressEnabled ? _onLongPress : null,
        child: widget.child,
      ),
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
    this.popoverReverseDuration,
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

  /// Duração da animação reversa do popover
  final Duration? popoverReverseDuration;

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
      popoverReverseDuration: popoverReverseDuration,
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
