import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// {@template ArtBreadcrumb}
/// A breadcrumb navigation component that displays the current page location
/// within a navigational hierarchy.
///
/// Breadcrumbs provide users with a clear understanding of their current
/// location and allow them to navigate back to parent pages in the hierarchy.
/// {@endtemplate}
class ArtBreadcrumb extends StatelessWidget {
  /// {@macro ArtBreadcrumb}
  const ArtBreadcrumb({super.key, required this.children, this.separator, this.mainAxisAlignment, this.crossAxisAlignment, this.textDirection, this.verticalDirection, this.spacing, this.textStyle, this.lastItemTextColor});

  /// The list of breadcrumb items to display.
  final List<Widget> children;

  /// Custom separator widget between breadcrumb items.
  /// If null, uses the default chevron right icon.
  final Widget? separator;

  /// {@template ArtBreadcrumb.mainAxisAlignment}
  /// How the children should be placed along the wraps main axis.
  /// {@endtemplate}
  final WrapAlignment? mainAxisAlignment;

  /// {@template ArtBreadcrumb.crossAxisAlignment}
  /// How the children should be placed along the wraps cross axis.
  /// {@endtemplate}
  final WrapCrossAlignment? crossAxisAlignment;

  /// {@template ArtBreadcrumb.textDirection}
  /// The text direction to use for the breadcrumb.
  /// {@endtemplate}
  final TextDirection? textDirection;

  /// {@template ArtBreadcrumb.verticalDirection}
  /// The vertical direction to use for the breadcrumb.
  /// {@endtemplate}
  final VerticalDirection? verticalDirection;

  /// {@template ArtBreadcrumb.spacing}
  /// The spacing between breadcrumb items.
  /// Defaults to 10.
  /// {@endtemplate}
  final double? spacing;

  /// {@template ArtBreadcrumb.textStyle}
  /// The style for the breadcrumb link text.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ArtBreadcrumb.lastItemTextColor}
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

/// {@template ArtBreadcrumbLink}
/// A clickable breadcrumb item that navigates when tapped.
///
/// This widget wraps content in a clickable area and applies appropriate
/// hover and focus styling for interactive breadcrumb items.
/// {@endtemplate}
class ArtBreadcrumbLink extends StatefulWidget {
  /// {@macro ArtBreadcrumbLink}
  const ArtBreadcrumbLink({super.key, required this.child, this.onPressed, this.normalColor, this.hoverColor, this.textStyle, this.onHoverChange});

  /// The widget to display as the link content.
  final Widget child;

  /// Called when the breadcrumb link is tapped.
  final VoidCallback? onPressed;

  /// {@template ArtBreadcrumbLink.normalColor}
  /// The color for the breadcrumb link text when not hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.mutedForeground]
  /// {@endtemplate}
  final Color? normalColor;

  /// {@template ArtBreadcrumbLink.hoverColor}
  /// The color for the breadcrumb link text when hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? hoverColor;

  /// {@template ArtBreadcrumbLink.textStyle}
  /// The style for the breadcrumb link text.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// Called when the hover state changes.
  final void Function(bool)? onHoverChange;

  @override
  State<ArtBreadcrumbLink> createState() => _ArtBreadcrumbLinkState();
}

class _ArtBreadcrumbLinkState extends State<ArtBreadcrumbLink> {
  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbLink(onPressed: widget.onPressed, normalColor: widget.normalColor, hoverColor: widget.hoverColor, textStyle: widget.textStyle, onHoverChange: widget.onHoverChange, child: widget.child);
  }
}

/// {@template ArtBreadcrumbSeparator}
/// A separator widget used between breadcrumb items.
///
/// This widget provides a visual separator between breadcrumb items.
/// By default, it displays a chevron right icon.
/// {@endtemplate}
class ArtBreadcrumbSeparator extends StatelessWidget {
  /// {@macro ArtBreadcrumbSeparator}
  const ArtBreadcrumbSeparator({super.key, this.size, this.color});

  /// {@template ArtBreadcrumbSeparator.size}
  /// The size of the separator.
  /// defaults value is 14.0
  /// {@endtemplate}
  final double? size;

  /// {@template ArtBreadcrumbSeparator.color}
  /// The color of the separator.
  /// defaults to `ShadColorScheme.mutedForeground`
  /// {@endtemplate}
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbSeparator(size: size, color: color);
  }
}

/// {@template ArtBreadcrumbEllipsis}
/// An ellipsis indicator for breadcrumb navigation.
///
/// This widget is used to indicate that there are more breadcrumb items
/// that are not currently visible, typically in a collapsed state.
/// It's often used with dropdown menus to show hidden breadcrumb levels.
/// {@endtemplate}
class ArtBreadcrumbEllipsis extends StatelessWidget {
  /// {@macro ArtBreadcrumbEllipsis}
  const ArtBreadcrumbEllipsis({super.key, this.size});

  /// {@template ArtBreadcrumbEllipsis.size}
  /// The size of the ellipsis indicator.
  /// defaults value is 16.0
  /// {@endtemplate}
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbEllipsis(size: size);
  }
}

/// {@template ArtBreadcrumbDropdown}
/// A dropdown breadcrumb item that displays a menu when clicked.
///
/// This widget is used to show collapsed breadcrumb items in a dropdown menu,
/// typically represented by an ellipsis. It follows the shadcn/ui pattern of
/// using a popover to show hidden navigation levels.
/// {@endtemplate}
class ArtBreadcrumbDropdown extends StatefulWidget {
  /// {@macro ArtBreadcrumbDropdown}
  const ArtBreadcrumbDropdown({super.key, required this.child, required this.items, this.backgroundColor, this.padding, this.anchor, this.arrowGap, this.normalTextColor, this.hoverTextColor, this.showDropdownArrow});

  /// The widget that triggers the dropdown.
  final Widget child;

  /// The list of dropdown menu items to display.
  final List<ArtBreadcrumbDropMenuItem> items;

  /// {@template ArtBreadcrumbDropdown.backgroundColor}
  /// The color for dropdown menu. defaults to
  /// [ShadTheme.of(context).colorScheme.popover]
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ArtBreadcrumbDropdown.padding}
  /// The padding value for dropdown menu. defaults to
  /// [EdgeInsets.all(4)]
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template ArtBreadcrumbDropdown.anchor}
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
  final ArtAnchorBase? anchor;

  /// {@template ArtBreadcrumbDropdown.arrowGap}
  /// The gap between the child and dropdown icon.
  /// defaults to 4
  /// {@endtemplate}
  final double? arrowGap;

  /// {@template ArtBreadcrumbDropdown.normalTextColor}
  /// The color for the breadcrumb link text when not hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.mutedForeground]
  /// {@endtemplate}
  final Color? normalTextColor;

  /// {@template ArtBreadcrumbDropdown.hoverTextColor}
  /// The color for the breadcrumb link text when hovered.
  /// defaults to [ShadTheme.of(context).colorScheme.foreground]
  /// {@endtemplate}
  final Color? hoverTextColor;

  /// {@template ArtBreadcrumbDropdown.showDropdownArrow}
  /// Whether to show the dropdown arrow icon.
  /// Defaults to true.
  /// {@endtemplate}
  final bool? showDropdownArrow;

  @override
  State<ArtBreadcrumbDropdown> createState() => _ArtBreadcrumbDropdownState();
}

class _ArtBreadcrumbDropdownState extends State<ArtBreadcrumbDropdown> {
  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbDropdown(
      items: widget.items.map((item) => ShadBreadcrumbDropMenuItem(onPressed: item.onPressed, textStyle: item.textStyle, itemPadding: item.itemPadding, child: item.child)).toList(),
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

/// {@template ArtBreadcrumbDropMenuItem}
/// A single item in a breadcrumb dropdown.
///
/// This widget represents a child in a dropdown menu and can
/// contain text, links, or other interactive elements.
/// {@endtemplate}
class ArtBreadcrumbDropMenuItem extends StatelessWidget {
  /// {@macro ArtBreadcrumbDropMenuItem}
  const ArtBreadcrumbDropMenuItem({super.key, required this.child, this.onPressed, this.textStyle, this.itemPadding});

  /// The widget to display as the breadcrumb item content.
  final Widget child;

  /// Called when the Widget is tapped.
  final VoidCallback? onPressed;

  /// {@template ArtBreadcrumbDropMenuItem.textStyle}
  /// The text style for dropdown menu items.
  /// defaults to [ShadTheme.of(context).textTheme.small]
  /// {@endtemplate}
  final TextStyle? textStyle;

  /// {@template ArtBreadcrumbDropMenuItem.itemPadding}
  /// The padding value for dropdown menu items.
  /// defaults to [EdgeInsets.symmetric(horizontal: 12, vertical: 10)]
  /// {@endtemplate}
  final EdgeInsetsGeometry? itemPadding;

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbDropMenuItem(onPressed: onPressed, textStyle: textStyle, itemPadding: itemPadding, child: child);
  }
}
