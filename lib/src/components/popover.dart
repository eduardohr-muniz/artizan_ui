import 'dart:ui';
import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Widget que encapsula o ShadPopover

class ArtPopover extends StatelessWidget {
  const ArtPopover({
    super.key,
    required this.child,
    required this.popover,
    this.controller,
    this.visible,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.anchor,
    this.effects,
    this.shadows,
    this.padding,
    this.decoration,
    this.filter,
    this.groupId,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
  }) : assert(
          (controller != null) ^ (visible != null),
          'Either controller or visible must be provided',
        );

  /// O widget filho
  final Widget child;

  /// O widget que será exibido como popover
  final WidgetBuilder popover;

  /// O controlador que controla a visibilidade do popover
  final ArtPopoverController? controller;

  /// Indica se o popover deve estar visível
  final bool? visible;

  /// Fecha o popover quando o usuário toca fora, padrão é true
  final bool closeOnTapOutside;

  /// O nó de foco do widget filho, o popover será exibido quando focado
  final FocusNode? focusNode;

  /// A posição do popover no sistema de coordenadas global
  final ArtAnchorBase? anchor;

  /// Os efeitos de animação aplicados ao popover
  final List<Effect<dynamic>>? effects;

  /// As sombras aplicadas ao popover
  final List<BoxShadow>? shadows;

  /// O padding do popover
  final EdgeInsetsGeometry? padding;

  /// A decoração do popover
  final ArtDecoration? decoration;

  /// O filtro do popover
  final ImageFilter? filter;

  /// O ID do grupo do popover
  final Object? groupId;

  /// O ID do grupo da área do mouse
  final Object? areaGroupId;

  /// Se o groupId deve ser usado para o widget filho
  final bool useSameGroupIdForChild;

  @override
  Widget build(BuildContext context) {
    return ShadPopover(
      popover: popover,
      controller: controller,
      visible: visible,
      closeOnTapOutside: closeOnTapOutside,
      focusNode: focusNode,
      anchor: anchor,
      effects: effects,
      shadows: shadows,
      padding: padding,
      decoration: decoration,
      filter: filter,
      groupId: groupId,
      areaGroupId: areaGroupId,
      useSameGroupIdForChild: useSameGroupIdForChild,
      child: child,
    );
  }
}
