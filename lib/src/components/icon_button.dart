import 'dart:async';

import 'package:artizan_ui/artizan_ui.dart';
import 'package:artizan_ui/src/components/loader_on_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ArtIconButton extends StatefulWidget {
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
    this.isLoading,
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
    this.isLoading,
  }) : assert(variant != ArtButtonVariant.link, "ShadIconButton doesn't support the link variant");

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
    this.isLoading,
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
    this.isLoading,
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
    this.isLoading,
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
    this.isLoading,
  }) : variant = ArtButtonVariant.ghost;

  final ArtButtonVariant variant;

  final FutureOr<void> Function()? onPressed;

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

  final bool? isLoading;

  @override
  State<ArtIconButton> createState() => _ArtIconButtonState();
}

class _ArtIconButtonState extends State<ArtIconButton> {
  bool _isLoading = false;

  bool get _effectiveIsLoading => widget.isLoading ?? _isLoading;

  Widget _effectiveIcon(BuildContext context, ArtThemeData theme) {
    final foregroundColor = _buttonTheme(theme).foregroundColor;
    if (_effectiveIsLoading) return ArtLoardOnButton(visibility: _isLoading, color: foregroundColor ?? context.artColorScheme.foreground, child: widget.icon);
    return widget.icon;
  }

  FutureOr<void> _effectiveOnPressed() async {
    if (_effectiveIsLoading) return;
    final isFuture = widget.onPressed is Future Function();
    if (isFuture && widget.isLoading == null) {
      setState(() => _isLoading = true);
      try {
        await widget.onPressed!();
      } finally {
        setState(() => _isLoading = false);
      }
      return;
    }
    widget.onPressed!();
  }

  ArtButtonTheme _buttonTheme(ArtThemeData theme) {
    return switch (widget.variant) {
      ArtButtonVariant.primary => theme.primaryButtonTheme,
      ArtButtonVariant.destructive => theme.destructiveButtonTheme,
      ArtButtonVariant.secondary => theme.secondaryButtonTheme,
      ArtButtonVariant.ghost => theme.ghostButtonTheme,
      ArtButtonVariant.outline => theme.outlineButtonTheme,
      ArtButtonVariant.link => theme.linkButtonTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = ArtTheme.of(context);

    return ShadIconButton.raw(
      icon: _effectiveIcon(context, theme),
      iconSize: widget.iconSize,
      variant: widget.variant.shadVariant,
      onPressed: _effectiveOnPressed,
      onLongPress: widget.onLongPress,
      cursor: widget.cursor,
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      backgroundColor: widget.backgroundColor,
      hoverBackgroundColor: widget.hoverBackgroundColor,
      foregroundColor: widget.foregroundColor,
      hoverForegroundColor: widget.hoverForegroundColor,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      pressedBackgroundColor: widget.pressedBackgroundColor,
      pressedForegroundColor: widget.pressedForegroundColor,
      shadows: widget.shadows,
      gradient: widget.gradient,
      decoration: widget.decoration,
      enabled: widget.enabled,
      statesController: widget.statesController,
      hoverStrategies: widget.hoverStrategies,
      onHoverChange: widget.onHoverChange,
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      onSecondaryTapDown: widget.onSecondaryTapDown,
      onSecondaryTapUp: widget.onSecondaryTapUp,
      onSecondaryTapCancel: widget.onSecondaryTapCancel,
      onLongPressStart: widget.onLongPressStart,
      onLongPressCancel: widget.onLongPressCancel,
      onLongPressUp: widget.onLongPressUp,
      onLongPressDown: widget.onLongPressDown,
      onLongPressEnd: widget.onLongPressEnd,
      onDoubleTap: widget.onDoubleTap,
      onDoubleTapDown: widget.onDoubleTapDown,
      onDoubleTapCancel: widget.onDoubleTapCancel,
      longPressDuration: widget.longPressDuration,
      onFocusChange: widget.onFocusChange,
    );
  }
}
