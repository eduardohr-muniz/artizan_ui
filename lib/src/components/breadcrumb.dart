import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// {@template DSBreadcrumb}
/// A breadcrumb navigation component that displays the current page location
/// within a navigational hierarchy.
///
/// Breadcrumbs provide users with a clear understanding of their current
/// location and allow them to navigate back to parent pages in the hierarchy.
/// {@endtemplate}
class DSBreadcrumb extends StatelessWidget {
  /// {@macro DSBreadcrumb}
  const DSBreadcrumb({
    super.key,
    required this.children,
    this.separator,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.spacing,
    this.textStyle,
    this.lastItemTextColor,
  });

  /// The list of breadcrumb items to display.
  final List<Widget> children;

  /// Custom separator widget between breadcrumb items.
  /// If null, uses the default chevron right icon.
  final Widget? separator;

  /// {@template DSBreadcrumb.mainAxisAlignment}
  /// How the children should be placed along the wraps main axis.
  /// {@endtemplate}
  final WrapAlignment? mainAxisAlignment;

  /// {@template DSBreadcrumb.crossAxisAlignment}
  /// How the children should be placed along the wraps cross axis.
  /// {@endtemplate}
  final WrapCrossAlignment? crossAxisAlignment;

  /// {@template DSBreadcrumb.textDirection}
  /// The text direction to use for the breadcrumb.
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template DSBreadcrumb.verticalDirection}
  /// The vertical direction to use for the breadcrumb.
  /// {@endtemplate}
  final VerticalDirection? verticalDirection;

  /// {@template DSBreadcrumb.spacing}
  /// The spacing between breadcrumb items.
  /// Defaults to 10.
  /// {@endtemplate}
  final double? spacing;

  /// {@template DSBreadcrumb.textStyle}
  /// The style for the breadcrumb link text.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template DSBreadcrumb.lastItemTextColor}
  /// The color for the last breadcrumb items text.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? lastItemTextColor;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumb(
      separator: separator,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      spacing: spacing,
      textStyle: textStyle,
      lastItemTextColor: lastItemTextColor,
      children: children,
    );
  }
}

/// {@template DSBreadcrumbLink}
/// A clickable breadcrumb item that navigates when tapped.
///
/// This widget wraps content in a clickable area and applies appropriate
/// hover and focus styling for interactive breadcrumb items.
/// {@endtemplate}
class DSBreadcrumbLink extends StatefulWidget {
  /// {@macro DSBreadcrumbLink}
  const DSBreadcrumbLink({super.key, required this.child, this.onPressed, this.normalColor, this.hoverColor, this.textStyle, this.onHoverChange});

  /// The widget to display as the link content.
  final Widget child;

  /// Called when the breadcrumb link is tapped.
  final VoidCallback? onPressed;

  /// {@template DSBreadcrumbLink.normalColor}
  /// The color for the breadcrumb link text when not hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.mutedForeground]
  /// {@endtemplate}
  final Color? normalColor;

  /// {@template DSBreadcrumbLink.hoverColor}
  /// The color for the breadcrumb link text when hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? hoverColor;

  /// {@template DSBreadcrumbLink.textStyle}
  /// The style for the breadcrumb link text.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// Called when the hover state changes.
  final void Function(bool)? onHoverChange;

  @override
  State<DSBreadcrumbLink> createState() => _DSBreadcrumbLinkState();
}

class _DSBreadcrumbLinkState extends State<DSBreadcrumbLink> {
  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbLink(
      onPressed: widget.onPressed,
      normalColor: widget.normalColor,
      hoverColor: widget.hoverColor,
      textStyle: widget.textStyle,
      onHoverChange: widget.onHoverChange,
      child: widget.child,
    );
  }
}

/// {@template DSBreadcrumbSeparator}
/// A separator widget used between breadcrumb items.
///
/// This widget provides a visual separator between breadcrumb items.
/// By default, it displays a chevron right icon.
/// {@endtemplate}
class DSBreadcrumbSeparator extends StatelessWidget {
  /// {@macro DSBreadcrumbSeparator}
  const DSBreadcrumbSeparator({super.key, this.size, this.color});

  /// {@template DSBreadcrumbSeparator.size}
  /// The size of the separator.
  /// defaults value is 14.0
  /// {@endtemplate}
  final double? size;

  /// {@template DSBreadcrumbSeparator.color}
  /// The color of the separator.
  /// defaults to `ShadColorScheme.mutedForeground`
  /// {@endtemplate}
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbSeparator(size: size, color: color);
  }
}

/// {@template DSBreadcrumbEllipsis}
/// An ellipsis indicator for breadcrumb navigation.
///
/// This widget is used to indicate that there are more breadcrumb items
/// that are not currently visible, typically in a collapsed state.
/// It's often used with dropdown menus to show hidden breadcrumb levels.
/// {@endtemplate}
class DSBreadcrumbEllipsis extends StatelessWidget {
  /// {@macro DSBreadcrumbEllipsis}
  const DSBreadcrumbEllipsis({super.key, this.size});

  /// {@template DSBreadcrumbEllipsis.size}
  /// The size of the ellipsis indicator.
  /// defaults value is 16.0
  /// {@endtemplate}
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbEllipsis(size: size);
  }
}

/// {@template DSBreadcrumbDropdown}
/// A dropdown breadcrumb item that displays a menu when clicked.
///
/// This widget is used to show collapsed breadcrumb items in a dropdown menu,
/// typically represented by an ellipsis. It follows the shadcn/ui pattern of
/// using a popover to show hidden navigation levels.
/// {@endtemplate}
class DSBreadcrumbDropdown extends StatefulWidget {
  /// {@macro DSBreadcrumbDropdown}
  const DSBreadcrumbDropdown({
    super.key,
    required this.child,
    required this.items,
    this.backgroundColor,
    this.padding,
    this.anchor,
    this.arrowGap,
    this.normalTextColor,
    this.hoverTextColor,
    this.showDropdownArrow,
  });

  /// The widget that triggers the dropdown.
  final Widget child;

  /// The list of dropdown menu items to display.
  final List<DSBreadcrumbDropMenuItem> items;

  /// {@template DSBreadcrumbDropdown.backgroundColor}
  /// The color for dropdown menu. defaults to
  /// [ShadTheme.of(context).colorScheme.popover]
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template DSBreadcrumbDropdown.padding}
  /// The padding value for dropdown menu. defaults to
  /// [EdgeInsets.all(4)]
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template DSBreadcrumbDropdown.anchor}
  /// The anchor configuration for the dropdown popover.
  /// Defaults to
  /// ```dart
  /// ShadAnchorAuto(
  ///   offset: Offset(0, 4),
  ///   targetAnchor: Alignment.bottomLeft,
  ///   followerAnchor: Alignment.bottomRight,
  /// ),
  /// ```
  /// {@endtemplate}
  final DSAnchorBase? anchor;

  /// {@template DSBreadcrumbDropdown.arrowGap}
  /// The gap between the child and dropdown icon.
  /// defaults to 4
  /// {@endtemplate}
  final double? arrowGap;

  /// {@template DSBreadcrumbDropdown.normalTextColor}
  /// The color for the breadcrumb link text when not hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.mutedForeground]
  /// {@endtemplate}
  final Color? normalTextColor;

  /// {@template DSBreadcrumbDropdown.hoverTextColor}
  /// The color for the breadcrumb link text when hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? hoverTextColor;

  /// {@template DSBreadcrumbDropdown.showDropdownArrow}
  /// Whether to show the dropdown arrow icon.
  /// Defaults to true.
  /// {@endtemplate}
  final bool? showDropdownArrow;

  @override
  State<DSBreadcrumbDropdown> createState() => _DSBreadcrumbDropdownState();
}

class _DSBreadcrumbDropdownState extends State<DSBreadcrumbDropdown> {
  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbDropdown(
      items:
          widget.items
              .map(
                (item) => ShadBreadcrumbDropMenuItem(
                  onPressed: item.onPressed,
                  textStyle: item.textStyle,
                  itemPadding: item.itemPadding,
                  child: item.child,
                ),
              )
              .toList(),
      backgroundColor: widget.backgroundColor,
      padding: widget.padding,
      anchor: widget.anchor,
      arrowGap: widget.arrowGap,
      normalTextColor: widget.normalTextColor,
      hoverTextColor: widget.hoverTextColor,
      showDropdownArrow: widget.showDropdownArrow,
      child: widget.child,
    );
  }
}

/// {@template DSBreadcrumbDropMenuItem}
/// A single item in a breadcrumb dropdown.
///
/// This widget represents a child in a dropdown menu and can
/// contain text, links, or other interactive elements.
/// {@endtemplate}
class DSBreadcrumbDropMenuItem extends StatelessWidget {
  /// {@macro DSBreadcrumbDropMenuItem}
  const DSBreadcrumbDropMenuItem({super.key, required this.child, this.onPressed, this.textStyle, this.itemPadding});

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Called when the Widget is tapped.
  final VoidCallback? onPressed;

  /// {@template DSBreadcrumbDropMenuItem.textStyle}
  /// The text style for dropdown menu items.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template DSBreadcrumbDropMenuItem.itemPadding}
  /// The padding value for dropdown menu items.
  /// defaults to [EdgeInsets.symmetric(horizontal: 12, vertical: 10)]
  /// {@endtemplate}
  final EdgeInsetsGeometry? itemPadding;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbDropMenuItem(onPressed: onPressed, textStyle: textStyle, itemPadding: itemPadding, child: child);
  }
}
