import 'dart:async';

import 'package:ds_ui/ds_ui.dart';
import 'package:ds_ui/src/components/loader_on_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum DSButtonVariant {
  primary(ShadButtonVariant.primary),
  destructive(ShadButtonVariant.destructive),
  outline(ShadButtonVariant.outline),
  secondary(ShadButtonVariant.secondary),
  ghost(ShadButtonVariant.ghost),
  link(ShadButtonVariant.link),
  darken(ShadButtonVariant.primary);

  final ShadButtonVariant shadVariant;

  const DSButtonVariant(this.shadVariant);
}

enum DSButtonSize { regular, sm, lg }

typedef DSButtonTheme = ShadButtonTheme;

class DSButton extends StatefulWidget {
  const DSButton({
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
  }) : variant = DSButtonVariant.primary;

  const DSButton.raw({
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

  const DSButton.destructive({
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
  }) : variant = DSButtonVariant.destructive;

  const DSButton.outline({
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
  }) : variant = DSButtonVariant.outline;

  const DSButton.secondary({
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
  }) : variant = DSButtonVariant.secondary;

  const DSButton.ghost({
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
  }) : variant = DSButtonVariant.ghost;

  const DSButton.link({
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
  }) : variant = DSButtonVariant.link;

  const DSButton.darken({
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
  }) : variant = DSButtonVariant.darken;

  final FutureOr<void> Function()? onPressed;

  final VoidCallback? onLongPress;

  final Widget? leading;

  final Widget? child;

  final Widget? trailing;

  final DSButtonVariant variant;

  final DSButtonSize? size;

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
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  bool _isLoading = false;

  bool get _effectiveIsLoading => widget.isLoading ?? _isLoading;

  Widget? _effectiveTrailing(BuildContext context, DSThemeData theme) {
    if (_effectiveIsLoading == false) return widget.trailing;
    final foregroundColor = _buttonTheme(theme).foregroundColor;
    if (widget.trailing == null) {
      return SizedBox(
        width: 14,
        height: 14,
        child: CircularProgressIndicator(strokeWidth: 1, strokeCap: StrokeCap.round, color: foregroundColor ?? context.dsColors.foreground),
      );
    }

    return DSLoardOnButton(visibility: _effectiveIsLoading, color: foregroundColor ?? context.dsColors.foreground, child: widget.trailing!);
  }

  FutureOr<void> _effectiveOnPressed() async {
    if (_effectiveIsLoading) return;
    final isFuture = widget.onPressed is Future Function();
    if (isFuture && widget.isLoading == null) {
      if (mounted) setState(() => _isLoading = true);
      try {
        await widget.onPressed!();
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
      return;
    }
    widget.onPressed?.call();
  }

  DSButtonTheme _buttonTheme(DSThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;
    return switch (widget.variant) {
      DSButtonVariant.primary => theme.primaryButtonTheme,
      DSButtonVariant.destructive => theme.destructiveButtonTheme,
      DSButtonVariant.secondary => theme.secondaryButtonTheme,
      DSButtonVariant.ghost => theme.ghostButtonTheme,
      DSButtonVariant.outline => theme.outlineButtonTheme,
      DSButtonVariant.link => theme.linkButtonTheme,
      DSButtonVariant.darken => theme.primaryButtonTheme.copyWith(
        backgroundColor: isDark ? Colors.white : Colors.black,
        foregroundColor: isDark ? Colors.black : Colors.white,
        hoverBackgroundColor: isDark ? Colors.white.withValues(alpha: 0.9) : Colors.black.withValues(alpha: 0.9),
        hoverForegroundColor: isDark ? Colors.black : Colors.white,
        pressedBackgroundColor: isDark ? Colors.white : Colors.black,
        pressedForegroundColor: isDark ? Colors.black : Colors.white,
      ),
    };
  }

  Color? _effectiveBackgroundColor({required bool isDark, required DSButtonVariant variant}) {
    if (variant == DSButtonVariant.darken) return isDark ? Colors.white : Colors.black;
    return null;
  }

  Color? _effectiveForegroundColor({required bool isDark, required DSButtonVariant variant}) {
    if (variant == DSButtonVariant.darken) return isDark ? Colors.black : Colors.white;
    return null;
  }

  Color? _effectiveHoverBackgroundColor({required bool isDark, required DSButtonVariant variant}) {
    if (variant == DSButtonVariant.darken) return isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1);
    return null;
  }

  Color? _effectivePressedBackgroundColor({required bool isDark, required DSButtonVariant variant}) {
    if (variant == DSButtonVariant.darken) return isDark ? Colors.white : Colors.black;
    return null;
  }

  Color? _effectiveHoverForegroundColor({required bool isDark, required DSButtonVariant variant}) {
    if (variant == DSButtonVariant.darken) return isDark ? Colors.black : Colors.white;
    return null;
  }

  Color? _effectivePressedForegroundColor({required bool isDark, required DSButtonVariant variant}) {
    if (variant == DSButtonVariant.darken) return isDark ? Colors.white : Colors.black;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
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
      backgroundColor: widget.backgroundColor ?? _effectiveBackgroundColor(isDark: isDark, variant: widget.variant),
      hoverBackgroundColor: widget.hoverBackgroundColor ?? _effectiveHoverBackgroundColor(isDark: isDark, variant: widget.variant),
      foregroundColor: widget.foregroundColor ?? _effectiveForegroundColor(isDark: isDark, variant: widget.variant),
      hoverForegroundColor: widget.hoverForegroundColor ?? _effectiveHoverForegroundColor(isDark: isDark, variant: widget.variant),
      pressedBackgroundColor: widget.pressedBackgroundColor ?? _effectivePressedBackgroundColor(isDark: isDark, variant: widget.variant),
      pressedForegroundColor: widget.pressedForegroundColor ?? _effectivePressedForegroundColor(isDark: isDark, variant: widget.variant),
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
      case DSButtonSize.sm:
        return ShadButtonSize.sm;
      case DSButtonSize.lg:
        return ShadButtonSize.lg;
      case DSButtonSize.regular:
      default:
        return null;
    }
  }
}
