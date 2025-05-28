import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef ArtSheetSide = ShadSheetSide;

/// Shows a [ArtSheet], which is a modal bottom sheet implementation.
///
/// Returns a [Future] that resolves to the value (if any) that the sheet is
/// closed with.
Future<T?> showArtSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  ArtSheetSide? side,
  Color? backgroundColor,
  String barrierLabel = '',
  ShapeBorder? shape,
  Color barrierColor = const Color(0xcc000000),
  bool useRootNavigator = false,
  bool isDismissible = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  List<Effect<dynamic>>? animateIn,
  List<Effect<dynamic>>? animateOut,
}) {
  return showShadSheet(
    context: context,
    builder: builder,
    side: side,
    backgroundColor: backgroundColor,
    barrierLabel: barrierLabel,
    shape: shape,
    barrierColor: barrierColor,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    animateIn: animateIn,
    animateOut: animateOut,
  );
}

class ArtSheet extends StatelessWidget {
  const ArtSheet({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.constraints,
    this.expandCrossSide,
    this.closeIcon,
    this.closeIconData,
    this.closeIconPosition,
    this.radius,
    this.backgroundColor,
    this.expandActionsWhenTiny,
    this.padding,
    this.gap,
    this.actionsAxis,
    this.actionsMainAxisSize,
    this.actionsMainAxisAlignment,
    this.actionsVerticalDirection,
    this.border,
    this.shadows,
    this.removeBorderRadiusWhenTiny,
    this.titleStyle,
    this.descriptionStyle,
    this.titleTextAlign,
    this.descriptionTextAlign,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollable,
    this.scrollPadding,
    this.draggable,
    this.onClosing,
    this.onDragStart,
    this.onDragEnd,
    this.animationController,
    this.isScrollControlled = false,
    this.minFlingVelocity,
    this.closeProgressThreshold,
    this.enterDuration = const Duration(milliseconds: 250),
    this.exitDuration = const Duration(milliseconds: 200),
    this.disabledScrollControlMaxRatio,
  });

  final Widget? title;
  final Widget? description;
  final Widget? child;
  final List<Widget> actions;
  final BoxConstraints? constraints;
  final bool? expandCrossSide;
  final Widget? closeIcon;
  final IconData? closeIconData;
  final ShadPosition? closeIconPosition;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final bool? expandActionsWhenTiny;
  final EdgeInsets? padding;
  final double? gap;
  final Axis? actionsAxis;
  final MainAxisSize? actionsMainAxisSize;
  final MainAxisAlignment? actionsMainAxisAlignment;
  final VerticalDirection? actionsVerticalDirection;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
  final bool? removeBorderRadiusWhenTiny;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextAlign? titleTextAlign;
  final TextAlign? descriptionTextAlign;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? scrollable;
  final EdgeInsets? scrollPadding;
  final bool? draggable;
  final VoidCallback? onClosing;
  final SheetDragStartHandler? onDragStart;
  final SheetDragEndHandler? onDragEnd;
  final AnimationController? animationController;
  final bool isScrollControlled;
  final double? minFlingVelocity;
  final double? closeProgressThreshold;
  final Duration enterDuration;
  final Duration exitDuration;
  final double? disabledScrollControlMaxRatio;

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      title: title,
      description: description,
      actions: actions,
      constraints: constraints,
      expandCrossSide: expandCrossSide,
      closeIcon: closeIcon,
      closeIconData: closeIconData,
      closeIconPosition: closeIconPosition,
      radius: radius,
      backgroundColor: backgroundColor,
      expandActionsWhenTiny: expandActionsWhenTiny,
      padding: padding,
      gap: gap,
      actionsAxis: actionsAxis,
      actionsMainAxisSize: actionsMainAxisSize,
      actionsMainAxisAlignment: actionsMainAxisAlignment,
      actionsVerticalDirection: actionsVerticalDirection,
      border: border,
      shadows: shadows,
      removeBorderRadiusWhenTiny: removeBorderRadiusWhenTiny,
      titleStyle: titleStyle,
      descriptionStyle: descriptionStyle,
      titleTextAlign: titleTextAlign,
      descriptionTextAlign: descriptionTextAlign,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      scrollable: scrollable,
      scrollPadding: scrollPadding,
      draggable: draggable,
      onClosing: onClosing,
      onDragStart: onDragStart,
      onDragEnd: onDragEnd,
      animationController: animationController,
      isScrollControlled: isScrollControlled,
      minFlingVelocity: minFlingVelocity,
      closeProgressThreshold: closeProgressThreshold,
      enterDuration: enterDuration,
      exitDuration: exitDuration,
      disabledScrollControlMaxRatio: disabledScrollControlMaxRatio,
      child: child,
    );
  }
}
