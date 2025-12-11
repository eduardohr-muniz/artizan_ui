import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef ArtTooltipController = ShadTooltipController;

typedef ArtHoverStrategies = ShadHoverStrategies;

class ArtTooltip extends StatelessWidget {
  const ArtTooltip({
    super.key,
    required this.child,
    required this.builder,
    this.focusNode,
    this.waitDuration,
    this.showDuration,
    this.effects,
    this.padding,
    this.decoration,
    this.anchor,
    this.hoverStrategies,
    this.controller,
    this.longPressDuration,
    this.duration,
    this.reverseDuration,
  });

  final Widget child;
  final WidgetBuilder builder;
  final FocusNode? focusNode;
  final Duration? waitDuration;
  final Duration? showDuration;
  final List<Effect<dynamic>>? effects;
  final EdgeInsetsGeometry? padding;
  final ArtDecoration? decoration;
  final ArtAnchorBase? anchor;
  final ArtHoverStrategies? hoverStrategies;
  final ArtTooltipController? controller;
  final Duration? longPressDuration;
  final Duration? duration;
  final Duration? reverseDuration;

  @override
  Widget build(BuildContext context) {
    return ShadTooltip(
      builder: builder,
      focusNode: focusNode,
      waitDuration: waitDuration,
      showDuration: showDuration,
      effects: effects,
      padding: padding,
      decoration: decoration,
      anchor: anchor,
      hoverStrategies: hoverStrategies,
      controller: controller,
      longPressDuration: longPressDuration,
      duration: duration,
      reverseDuration: reverseDuration,
      child: child,
    );
  }
}
