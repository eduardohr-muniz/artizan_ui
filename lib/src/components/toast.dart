import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// The default duration for toasts to remain visible.
const kDefaultToastDuration = Duration(seconds: 4);

/// Variants available for the [DSToast] widget.
enum DSToastVariant { primary, destructive }

/// A customizable toast notification widget that wraps [ShadToast].
class DSToast extends StatelessWidget {
  /// Creates a primary variant toast widget.
  const DSToast({
    super.key,
    this.id,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration = kDefaultToastDuration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
  }) : variant = DSToastVariant.primary;

  /// Creates a destructive variant toast widget.
  const DSToast.destructive({
    super.key,
    this.id,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration = kDefaultToastDuration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
  }) : variant = DSToastVariant.destructive;
  const DSToast.raw({
    required this.variant,
    super.key,
    this.id,
    this.title,
    this.description,
    this.action,
    this.closeIcon,
    this.closeIconData,
    this.alignment,
    this.offset,
    this.duration = kDefaultToastDuration,
    this.textDirection,
    this.animateIn,
    this.animateOut,
    this.crossAxisAlignment,
    this.showCloseIconOnlyWhenHovered,
    this.titleStyle,
    this.descriptionStyle,
    this.actionPadding,
    this.border,
    this.radius,
    this.shadows,
    this.backgroundColor,
    this.padding,
    this.closeIconPosition,
    this.constraints,
  });

  /// The unique identifier for the toast.
  final Object? id;

  /// The title widget displayed at the top of the toast.
  final Widget? title;

  /// The description widget displayed below the title.
  final Widget? description;

  /// An optional action widget displayed alongside the content.
  final Widget? action;

  /// The custom widget for the close button.
  final Widget? closeIcon;

  /// The icon data for the close button.
  final IconData? closeIconData;

  /// The alignment of the toast within the screen.
  final Alignment? alignment;

  /// The offset from the alignment position as padding.
  final Offset? offset;

  /// The duration the toast remains visible before auto-hiding.
  final Duration? duration;

  /// The directionality of the toast's content.
  final TextDirection? textDirection;

  /// The animation effects when the toast appears.
  final List<Effect<dynamic>>? animateIn;

  /// The animation effects when the toast disappears.
  final List<Effect<dynamic>>? animateOut;

  /// The cross-axis alignment of the toast's content.
  final CrossAxisAlignment? crossAxisAlignment;

  /// Whether the close icon is visible only when the toast is hovered.
  final bool? showCloseIconOnlyWhenHovered;

  /// The text style for the title.
  final TextStyle? titleStyle;

  /// The text style for the description.
  final TextStyle? descriptionStyle;

  /// The padding around the action widget.
  final EdgeInsets? actionPadding;

  /// The border surrounding the toast.
  final DSBorder? border;

  /// The border radius of the toast's corners.
  final BorderRadius? radius;

  /// The list of box shadows applied to the toast.
  final List<BoxShadow>? shadows;

  /// The background color of the toast.
  final Color? backgroundColor;

  /// The padding inside the toast.
  final EdgeInsets? padding;

  /// The position of the close icon within the toast.
  final ShadPosition? closeIconPosition;

  /// The variant of the toast.
  final DSToastVariant variant;

  /// Constraints applied to the toast's layout.
  final BoxConstraints? constraints;

  /// Maps [DSToastVariant] to [ShadToastVariant].
  ShadToastVariant get _shadVariant => switch (variant) {
    DSToastVariant.primary => ShadToastVariant.primary,
    DSToastVariant.destructive => ShadToastVariant.destructive,
  };

  @override
  Widget build(BuildContext context) {
    return ShadToast.raw(
      id: id,
      variant: _shadVariant,
      title: title,
      description: description,
      action: action,
      closeIcon: closeIcon,
      closeIconData: closeIconData,
      alignment: alignment,
      offset: offset,
      duration: duration,
      textDirection: textDirection,
      animateIn: animateIn,
      animateOut: animateOut,
      crossAxisAlignment: crossAxisAlignment,
      showCloseIconOnlyWhenHovered: showCloseIconOnlyWhenHovered,
      titleStyle: titleStyle,
      descriptionStyle: descriptionStyle,
      actionPadding: actionPadding,
      border: border,
      radius: radius,
      shadows: shadows,
      backgroundColor: backgroundColor,
      padding: padding,
      closeIconPosition: closeIconPosition,
      constraints: constraints,
    );
  }

  /// Shows this toast using the nearest [ShadToaster] ancestor.
  void show(BuildContext context) {
    ShadToaster.of(context).show(
      ShadToast.raw(
        id: id,
        variant: _shadVariant,
        title: title,
        description: description,
        action: action,
        closeIcon: closeIcon,
        closeIconData: closeIconData,
        alignment: alignment,
        offset: offset,
        duration: duration,
        textDirection: textDirection,
        animateIn: animateIn,
        animateOut: animateOut,
        crossAxisAlignment: crossAxisAlignment,
        showCloseIconOnlyWhenHovered: showCloseIconOnlyWhenHovered,
        titleStyle: titleStyle,
        descriptionStyle: descriptionStyle,
        actionPadding: actionPadding,
        border: border,
        radius: radius,
        shadows: shadows,
        backgroundColor: backgroundColor,
        padding: padding,
        closeIconPosition: closeIconPosition,
        constraints: constraints,
      ),
    );
  }
}

/// A widget that manages and displays toasts within the widget tree.
class DSToaster extends StatelessWidget {
  /// Creates a toaster widget that wraps the provided child.
  const DSToaster({required this.child, super.key});

  /// The widget below the toaster in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadToaster(child: child);
  }

  /// Shows a toast using the nearest [DSToaster] ancestor.
  static void show(BuildContext context, DSToast toast) {
    toast.show(context);
  }

  /// Hides the currently visible toast.
  static void hide(BuildContext context) {
    ShadToaster.of(context).hide();
  }
}

class DSSonner extends StatelessWidget {
  /// Creates a toaster widget that wraps the provided child.
  const DSSonner({required this.child, super.key});

  /// The widget below the toaster in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadSonner(child: child);
  }

  /// Shows a toast using the nearest [DSToaster] ancestor.
  static void show(BuildContext context, DSToast toast, {bool append = true}) {
    ShadSonner.of(context).show(
      ShadToast.raw(
        id: toast.id,
        variant: toast._shadVariant,
        title: toast.title,
        description: toast.description,
        action: toast.action,
        closeIcon: toast.closeIcon,
        closeIconData: toast.closeIconData,
        alignment: toast.alignment,
        offset: toast.offset,
        duration: toast.duration,
        textDirection: toast.textDirection,
        animateIn: toast.animateIn,
        animateOut: toast.animateOut,
        crossAxisAlignment: toast.crossAxisAlignment,
        showCloseIconOnlyWhenHovered: toast.showCloseIconOnlyWhenHovered,
        titleStyle: toast.titleStyle,
        descriptionStyle: toast.descriptionStyle,
        actionPadding: toast.actionPadding,
        border: toast.border,
        radius: toast.radius,
        shadows: toast.shadows,
        backgroundColor: toast.backgroundColor,
        padding: toast.padding,
        closeIconPosition: toast.closeIconPosition,
        constraints: toast.constraints,
      ),
      append: append,
    );
  }

  /// Hides the currently visible toast.
  static void hide(BuildContext context, Object? id) {
    ShadSonner.of(context).hide(id);
  }
}
