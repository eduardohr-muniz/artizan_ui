import 'dart:async';

import 'package:artizan_ui/artizan_ui.dart';
import 'package:artizan_ui/src/components/loader_on_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ArtButtonVariant {
  primary(ShadButtonVariant.primary),
  destructive(ShadButtonVariant.destructive),
  outline(ShadButtonVariant.outline),
  secondary(ShadButtonVariant.secondary),
  ghost(ShadButtonVariant.ghost),
  link(ShadButtonVariant.link),
  darken(ShadButtonVariant.primary);

  final ShadButtonVariant shadVariant;

  const ArtButtonVariant(this.shadVariant);
}

enum ArtButtonSize { regular, sm, lg }

typedef ArtButtonTheme = ShadButtonTheme;

class ArtButton extends StatefulWidget {
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
    this.isLoading,
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
    this.isLoading,
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
    this.isLoading,
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
    this.isLoading,
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
    this.isLoading,
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
    this.isLoading,
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
    this.isLoading,
  }) : variant = ArtButtonVariant.link;

  const ArtButton.darken({
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
    this.isLoading,
  }) : variant = ArtButtonVariant.darken;

  final FutureOr<void> Function()? onPressed;

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

  final bool? isLoading;

  @override
  State<ArtButton> createState() => _ArtButtonState();
}

class _ArtButtonState extends State<ArtButton> {
  bool _isLoading = false;

  bool get _effectiveIsLoading => widget.isLoading ?? _isLoading;

  Widget? _effectiveTrailing(BuildContext context, ArtThemeData theme) {
    if (_effectiveIsLoading == false) return widget.trailing;
    final foregroundColor = _buttonTheme(theme).foregroundColor;
    if (widget.trailing == null) return SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 1, strokeCap: StrokeCap.round, color: foregroundColor ?? context.artColorScheme.foreground));
    return ArtLoardOnButton(visibility: _effectiveIsLoading, color: foregroundColor ?? context.artColorScheme.foreground, child: widget.trailing!);
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
    final isDark = theme.brightness == Brightness.dark;
    return switch (widget.variant) {
      ArtButtonVariant.primary => theme.primaryButtonTheme,
      ArtButtonVariant.destructive => theme.destructiveButtonTheme,
      ArtButtonVariant.secondary => theme.secondaryButtonTheme,
      ArtButtonVariant.ghost => theme.ghostButtonTheme,
      ArtButtonVariant.outline => theme.outlineButtonTheme,
      ArtButtonVariant.link => theme.linkButtonTheme,
      ArtButtonVariant.darken => theme.primaryButtonTheme.copyWith(
        backgroundColor: isDark ? Colors.white : Colors.black,
        foregroundColor: isDark ? Colors.black : Colors.white,
        hoverBackgroundColor: isDark ? Colors.white.withValues(alpha: 0.9) : Colors.black.withValues(alpha: 0.9),
        hoverForegroundColor: isDark ? Colors.black : Colors.white,
        pressedBackgroundColor: isDark ? Colors.white : Colors.black,
        pressedForegroundColor: isDark ? Colors.black : Colors.white,
      ),
    };
  }

  Color? _effectiveForegroundColor(BuildContext context, ArtButtonTheme buttonTheme) {
    if (widget.variant == ArtButtonVariant.outline) return context.artColorScheme.foreground;
    return buttonTheme.foregroundColor;
  }

  Color? _effectiveBackgroundColor(ArtButtonTheme buttonTheme) => buttonTheme.backgroundColor;
  Color? _effectiveHoverBackgroundColor(ArtButtonTheme buttonTheme) => buttonTheme.hoverBackgroundColor;
  Color? _effectivePressedBackgroundColor(ArtButtonTheme buttonTheme) => buttonTheme.pressedBackgroundColor;
  Color? _effectiveHoverForegroundColor(ArtButtonTheme buttonTheme) => buttonTheme.hoverForegroundColor;
  Color? _effectivePressedForegroundColor(ArtButtonTheme buttonTheme) => buttonTheme.pressedForegroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = ArtTheme.of(context);

    return ShadButton.raw(
      variant: widget.variant.shadVariant,
      onPressed: _effectiveOnPressed,
      onLongPress: widget.onLongPress,
      leading: widget.leading,
      trailing: _effectiveTrailing(context, theme),
      size: _mapSize(),
      cursor: widget.cursor,
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      backgroundColor: widget.backgroundColor ?? _effectiveBackgroundColor(_buttonTheme(theme)),
      hoverBackgroundColor: widget.hoverBackgroundColor ?? _effectiveHoverBackgroundColor(_buttonTheme(theme)),
      foregroundColor: widget.foregroundColor ?? _effectiveForegroundColor(context, _buttonTheme(theme)),
      hoverForegroundColor: widget.hoverForegroundColor ?? _effectiveHoverForegroundColor(_buttonTheme(theme)),
      pressedBackgroundColor: widget.pressedBackgroundColor ?? _effectivePressedBackgroundColor(_buttonTheme(theme)),
      pressedForegroundColor: widget.pressedForegroundColor ?? _effectivePressedForegroundColor(_buttonTheme(theme)),
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      shadows: widget.shadows,
      gradient: widget.gradient,
      textDecoration: widget.textDecoration,
      hoverTextDecoration: widget.hoverTextDecoration,
      decoration: widget.decoration,
      enabled: widget.enabled,
      statesController: widget.statesController,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
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
      textDirection: widget.textDirection,
      gap: widget.gap,
      onFocusChange: widget.onFocusChange,
      expands: widget.expands,
      child: widget.child,
    );
  }

  ShadButtonSize? _mapSize() {
    switch (widget.size) {
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
