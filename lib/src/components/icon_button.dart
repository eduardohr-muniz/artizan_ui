import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ArtIconButton extends StatelessWidget {
  const ArtIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.onFocusChange,
  }) : variant = ArtButtonVariant.primary;

  const ArtIconButton.raw({
    super.key,
    required this.variant,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
  }) : assert(
          variant != ArtButtonVariant.link,
          "ShadIconButton doesn't support the link variant",
        );

  const ArtIconButton.destructive({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
  }) : variant = ArtButtonVariant.destructive;

  const ArtIconButton.outline({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.onFocusChange,
  }) : variant = ArtButtonVariant.outline;

  const ArtIconButton.secondary({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.onFocusChange,
  }) : variant = ArtButtonVariant.secondary;

  const ArtIconButton.ghost({
    super.key,
    required this.icon,
    this.iconSize,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.onFocusChange,
  }) : variant = ArtButtonVariant.ghost;

  final ArtButtonVariant variant;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final Widget icon;

  final double? iconSize;

  final MouseCursor? cursor;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry? padding;

  final Color? backgroundColor;

  final Color? hoverBackgroundColor;

  final Color? foregroundColor;

  final Color? hoverForegroundColor;

  final bool autofocus;

  final FocusNode? focusNode;

  final Color? pressedBackgroundColor;

  final Color? pressedForegroundColor;

  final List<BoxShadow>? shadows;

  final Gradient? gradient;

  final ShadDecoration? decoration;

  final bool enabled;

  final ShadStatesController? statesController;

  final ShadHoverStrategies? hoverStrategies;

  final ValueChanged<bool>? onHoverChange;

  final ValueChanged<TapDownDetails>? onTapDown;

  final ValueChanged<TapUpDetails>? onTapUp;

  final VoidCallback? onTapCancel;

  final ValueChanged<TapDownDetails>? onSecondaryTapDown;

  final ValueChanged<TapUpDetails>? onSecondaryTapUp;

  final VoidCallback? onSecondaryTapCancel;

  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  final VoidCallback? onLongPressCancel;

  final VoidCallback? onLongPressUp;

  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  final VoidCallback? onDoubleTap;

  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  final VoidCallback? onDoubleTapCancel;

  final Duration? longPressDuration;

  final ValueChanged<bool>? onFocusChange;

  @override
  Widget build(BuildContext context) {
    return ShadIconButton.raw(
      icon: icon,
      iconSize: iconSize,
      variant: variant.shadVariant,
      onPressed: onPressed,
      onLongPress: onLongPress,
      cursor: cursor,
      width: width,
      height: height,
      padding: padding,
      backgroundColor: backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor,
      foregroundColor: foregroundColor,
      hoverForegroundColor: hoverForegroundColor,
      autofocus: autofocus,
      focusNode: focusNode,
      pressedBackgroundColor: pressedBackgroundColor,
      pressedForegroundColor: pressedForegroundColor,
      shadows: shadows,
      gradient: gradient,
      decoration: decoration,
      enabled: enabled,
      statesController: statesController,
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
      onFocusChange: onFocusChange,
    );
  }
}
