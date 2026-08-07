import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum DSDialogVariant { primary, alert }

typedef DSPosition = ShadPosition;

/// Converts DSDialogVariant to ShadDialogVariant
ShadDialogVariant _buildShadDialogVariantFromDSDialogVariant(DSDialogVariant variant) {
  switch (variant) {
    case DSDialogVariant.primary:
      return ShadDialogVariant.primary;
    case DSDialogVariant.alert:
      return ShadDialogVariant.alert;
  }
}

/// Displays an [DSDialog] as a modal dialog with animation.
///
/// Shows a dialog with customizable barrier and animation properties, returning
/// a [Future] with the result when the dialog is dismissed.
Future<T?> showDSDialog<T>({
  /// The build context in which to show the dialog.
  required BuildContext context,

  /// The builder function to create the dialog content.
  required WidgetBuilder builder,

  /// Whether the dialog can be dismissed by tapping outside the barrier.
  /// Defaults to true.
  bool barrierDismissible = true,

  /// The color of the barrier behind the dialog.
  /// Defaults to a semi-transparent black (0xcc000000).
  Color barrierColor = const Color(0xcc000000),

  /// The accessibility label for the barrier.
  /// Defaults to an empty string.
  String barrierLabel = '',

  /// Whether to use the root navigator for routing.
  /// Defaults to true.
  bool useRootNavigator = true,

  /// Optional route settings for navigation.
  RouteSettings? routeSettings,

  /// The anchor point for positioning the dialog.
  Offset? anchorPoint,

  /// The animation effects when the dialog appears.
  /// Defaults to fade and scale-in if not specified.
  List<Effect<dynamic>>? animateIn,

  /// The animation effects when the dialog disappears.
  /// Defaults to fade and scale-out if not specified.
  List<Effect<dynamic>>? animateOut,

  /// The variant of the dialog to display.
  /// Defaults to [DSDialogVariant.primary].
  DSDialogVariant variant = DSDialogVariant.primary,
}) {
  return showShadDialog<T>(
    context: context,
    builder: builder,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    animateIn: animateIn,
    animateOut: animateOut,
    variant: _buildShadDialogVariantFromDSDialogVariant(variant),
  );
}

/// Displays an [DSDialog] alert variant as a modal dialog with animation.
///
/// Convenience function for showing alert dialogs with pre-configured styling.
Future<T?> showDSDialogAlert<T>({
  /// The build context in which to show the dialog.
  required BuildContext context,

  /// The builder function to create the dialog content.
  required WidgetBuilder builder,

  /// Whether the dialog can be dismissed by tapping outside the barrier.
  /// Defaults to true.
  bool barrierDismissible = true,

  /// The color of the barrier behind the dialog.
  /// Defaults to a semi-transparent black (0xcc000000).
  Color barrierColor = const Color(0xcc000000),

  /// The accessibility label for the barrier.
  /// Defaults to an empty string.
  String barrierLabel = '',

  /// Whether to use the root navigator for routing.
  /// Defaults to true.
  bool useRootNavigator = true,

  /// Optional route settings for navigation.
  RouteSettings? routeSettings,

  /// The anchor point for positioning the dialog.
  Offset? anchorPoint,

  /// The animation effects when the dialog appears.
  /// Defaults to fade and scale-in if not specified.
  List<Effect<dynamic>>? animateIn,

  /// The animation effects when the dialog disappears.
  /// Defaults to fade and scale-out if not specified.
  List<Effect<dynamic>>? animateOut,
}) {
  return showDSDialog<T>(
    context: context,
    builder: builder,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    animateIn: animateIn,
    animateOut: animateOut,
    variant: DSDialogVariant.alert,
  );
}

class DSDialog extends StatelessWidget {
  final DSDialogVariant variant;
  final Widget? title;
  final Widget? description;
  final Widget? child;
  final List<Widget> actions;
  final Widget? closeIcon;
  final IconData? closeIconData;
  final DSPosition? closeIconPosition;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final bool? expandActionsWhenTiny;
  final EdgeInsets? padding;
  final double? gap;
  final BoxConstraints? constraints;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
  final bool? removeBorderRadiusWhenTiny;
  final Axis? actionsAxis;
  final MainAxisSize? actionsMainAxisSize;
  final MainAxisAlignment? actionsMainAxisAlignment;
  final VerticalDirection? actionsVerticalDirection;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextAlign? titleTextAlign;
  final TextAlign? descriptionTextAlign;
  final Alignment? alignment;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? scrollable;
  final EdgeInsets? scrollPadding;

  const DSDialog({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.closeIcon,
    this.closeIconData,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.constraints,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.alignment,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
  }) : variant = DSDialogVariant.primary;

  const DSDialog.alert({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.closeIcon,
    this.closeIconData,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.constraints,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.alignment,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
  }) : variant = DSDialogVariant.alert;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: ShadDialog.raw(
        variant: _buildShadDialogVariantFromDSDialogVariant(variant),
        title: title,
        description: description,
        actions: actions,
        closeIcon: closeIcon,
        closeIconData: closeIconData,
        closeIconPosition: closeIconPosition,
        radius: radius,
        backgroundColor: backgroundColor,
        expandActionsWhenTiny: expandActionsWhenTiny,
        padding: padding,
        gap: gap,
        constraints: constraints,
        border: border,
        shadows: shadows,
        removeBorderRadiusWhenTiny: removeBorderRadiusWhenTiny ?? false,
        actionsAxis: actionsAxis,
        actionsMainAxisSize: actionsMainAxisSize,
        actionsMainAxisAlignment: actionsMainAxisAlignment,
        actionsVerticalDirection: actionsVerticalDirection,
        titleStyle: titleStyle,
        descriptionStyle: descriptionStyle,
        titleTextAlign: titleTextAlign,
        descriptionTextAlign: descriptionTextAlign,
        alignment: alignment,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        scrollable: scrollable,
        scrollPadding: scrollPadding,
        child: child,
      ),
    );
  }
}
