import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ArtButtonVariant {
  primary(ShadButtonVariant.primary),
  destructive(ShadButtonVariant.destructive),
  outline(ShadButtonVariant.outline),
  secondary(ShadButtonVariant.secondary),
  ghost(ShadButtonVariant.ghost),
  link(ShadButtonVariant.link);

  final ShadButtonVariant shadVariant;

  const ArtButtonVariant(this.shadVariant);
}

enum ArtButtonSize {
  regular,
  sm,
  lg,
}

class ArtButton extends StatelessWidget {
  const ArtButton({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.gap,
    this.onFocusChange,
    this.expands,
  }) : variant = ArtButtonVariant.primary;

  const ArtButton.raw({
    super.key,
    required this.variant,
    this.size,
    this.child,
    this.leading,
    this.trailing,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.gap,
    this.onFocusChange,
    this.expands,
  });

  const ArtButton.destructive({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.gap,
    this.onFocusChange,
    this.expands,
  }) : variant = ArtButtonVariant.destructive;

  const ArtButton.outline({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.gap,
    this.onFocusChange,
    this.expands,
  }) : variant = ArtButtonVariant.outline;

  const ArtButton.secondary({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.gap,
    this.onFocusChange,
    this.expands,
  }) : variant = ArtButtonVariant.secondary;

  const ArtButton.ghost({
    super.key,
    this.child,
    this.leading,
    this.trailing,
    this.onPressed,
    this.size,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.gap,
    this.onFocusChange,
    this.expands,
  }) : variant = ArtButtonVariant.ghost;

  const ArtButton.link({
    super.key,
    required this.child,
    this.onPressed,
    this.size,
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
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
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
    this.gap,
    this.onFocusChange,
    this.expands,
    this.leading,
    this.trailing,
  }) : variant = ArtButtonVariant.link;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final Widget? leading;

  final Widget? child;

  final Widget? trailing;

  final ArtButtonVariant variant;

  final ArtButtonSize? size;

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

  final TextDecoration? textDecoration;

  final TextDecoration? hoverTextDecoration;

  final ShadDecoration? decoration;

  final bool enabled;

  final ShadStatesController? statesController;

  final double? gap;

  final MainAxisAlignment? mainAxisAlignment;

  final CrossAxisAlignment? crossAxisAlignment;

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

  final TextDirection? textDirection;

  final ValueChanged<bool>? onFocusChange;

  final bool? expands;

  @override
  Widget build(BuildContext context) {
    final theme = ArtTheme.of(context);
    return ShadButton.raw(
      variant: variant.shadVariant,
      onPressed: onPressed,
      onLongPress: onLongPress,
      leading: leading,
      trailing: trailing,
      size: _mapSize(),
      cursor: cursor,
      width: width,
      height: height,
      padding: padding,
      backgroundColor: backgroundColor,
      hoverBackgroundColor: hoverBackgroundColor,
      foregroundColor: variant == ArtButtonVariant.outline ? theme.colorScheme.foreground : foregroundColor,
      hoverForegroundColor: hoverForegroundColor,
      pressedBackgroundColor: pressedBackgroundColor,
      pressedForegroundColor: pressedForegroundColor,
      autofocus: autofocus,
      focusNode: focusNode,
      shadows: shadows,
      gradient: gradient,
      textDecoration: textDecoration,
      hoverTextDecoration: hoverTextDecoration,
      decoration: decoration,
      enabled: enabled,
      statesController: statesController,
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
      gap: gap,
      onFocusChange: onFocusChange,
      expands: expands,
      child: child,
    );
  }

  ShadButtonSize? _mapSize() {
    switch (size) {
      case ArtButtonSize.sm:
        return ShadButtonSize.sm;
      case ArtButtonSize.lg:
        return ShadButtonSize.lg;
      case ArtButtonSize.regular:
      default:
        return null;
    }
  }
}
