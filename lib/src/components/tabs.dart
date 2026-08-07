import 'dart:math' as math;
import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef DSTabsController<T> = ShadTabsController<T>;

class DSTabs<T> extends StatefulWidget implements PreferredSizeWidget {
  const DSTabs({
    required this.tabs,
    super.key,
    this.value,
    this.controller,
    this.gap,
    this.scrollable,
    this.dragStartBehavior,
    this.physics,
    this.padding,
    this.decoration,
    this.tabBarConstraints,
    this.contentConstraints,
    this.restorationId,
    this.onChanged,
    this.tabBarAlignment,
    this.tabsGap,
    this.contentAlignment,
    this.contentGap,
    this.maintainState,
  }) : assert(
         (value != null) ^ (controller != null),
         'Either value or controller must be provided',
       );

  final T? value;

  final List<DSTab<T>> tabs;

  final DSTabsController<T>? controller;

  final double? gap;

  final bool? scrollable;

  final DragStartBehavior? dragStartBehavior;

  final ScrollPhysics? physics;

  final EdgeInsets? padding;

  final ShadDecoration? decoration;

  final BoxConstraints? tabBarConstraints;

  final BoxConstraints? contentConstraints;

  final String? restorationId;

  final ValueChanged<T>? onChanged;

  final Alignment? tabBarAlignment;

  final double? tabsGap;

  final Alignment? contentAlignment;

  final double? contentGap;

  final bool? maintainState;

  @override
  State<DSTabs<T>> createState() => _DSTabsState<T>();

  @override
  Size get preferredSize {
    var maxHeight = 0.0;
    for (final tab in tabs) {
      final itemHeight = tab.preferredSize.height;
      maxHeight = math.max(itemHeight, maxHeight);
    }
    return Size.fromHeight(maxHeight);
  }
}

class _DSTabsState<T> extends State<DSTabs<T>> {
  late List<GlobalKey> _tabKeys;
  late List<T> orderedValues;
  DSTabsController<T>? _internalController;

  DSTabsController<T> get controller => widget.controller ?? _internalController!;

  late final scrollController = ScrollController();

  bool get scrollable => widget.scrollable ?? false;

  @override
  void initState() {
    super.initState();
    _tabKeys = widget.tabs.map((_) => GlobalKey()).toList();
    if (widget.controller == null) {
      _internalController = DSTabsController<T>(value: widget.value as T);
    }
    orderedValues = widget.tabs.map((e) => e.value).toList();
  }

  @override
  void didUpdateWidget(covariant DSTabs<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller == null && oldWidget.controller != null) {
      _internalController = DSTabsController<T>(value: oldWidget.controller!.selected);
    } else if (widget.controller != null && oldWidget.controller == null) {
      _internalController?.dispose();
      _internalController = null;
    }

    if (widget.tabs.length > _tabKeys.length) {
      final delta = widget.tabs.length - _tabKeys.length;
      _tabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
    } else if (widget.tabs.length < _tabKeys.length) {
      _tabKeys.removeRange(widget.tabs.length, _tabKeys.length);
    }

    if (!listEquals(widget.tabs, oldWidget.tabs)) {
      orderedValues = widget.tabs.map((e) => e.value).toList();
    }

    if (widget.value is T &&
        widget.controller == null &&
        controller.selected != widget.value) {
      controller.select(widget.value as T);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    _internalController?.dispose();
    super.dispose();
  }

  bool get _hasContent => widget.tabs.any((tab) => tab.content != null);

  double? get _effectiveGap => widget.gap ?? (_hasContent ? null : 0);

  ShadButtonSize? _mapSize(DSButtonSize? size) {
    if (size == null) return null;
    return switch (size) {
      DSButtonSize.regular => ShadButtonSize.regular,
      DSButtonSize.sm => ShadButtonSize.sm,
      DSButtonSize.lg => ShadButtonSize.lg,
    };
  }

  @override
  Widget build(BuildContext context) {
    final tabs = _buildShadTabs(context);

    if (_hasContent) return tabs;
    return IntrinsicHeight(child: tabs);
  }

  Widget _buildShadTabs(BuildContext context) {
    return ShadTabs<T>(
      value: widget.controller != null ? null : controller.selected,
      controller: widget.controller != null ? controller : null,
      tabs:
          widget.tabs
              .map(
                (artTab) => ShadTab<T>(
                  value: artTab.value,
                  content: artTab.content,
                  leading: artTab.leading,
                  trailing: artTab.trailing,
                  enabled: artTab.enabled,
                  flex: artTab.flex,
                  height: artTab.height,
                  width: artTab.width,
                  backgroundColor: artTab.backgroundColor,
                  selectedBackgroundColor: artTab.selectedBackgroundColor,
                  hoverBackgroundColor: artTab.hoverBackgroundColor,
                  selectedHoverBackgroundColor: artTab.selectedHoverBackgroundColor,
                  padding: artTab.padding,
                  decoration: artTab.decoration,
                  selectedDecoration: artTab.selectedDecoration,
                  foregroundColor: artTab.foregroundColor,
                  selectedForegroundColor: artTab.selectedForegroundColor,
                  textStyle: artTab.textStyle,
                  shadows: artTab.shadows,
                  selectedShadows: artTab.selectedShadows,
                  focusNode: artTab.focusNode,
                  onPressed: artTab.onPressed,
                  onLongPress: artTab.onLongPress,
                  size: _mapSize(artTab.size),
                  cursor: artTab.cursor,
                  hoverForegroundColor: artTab.hoverForegroundColor,
                  autofocus: artTab.autofocus,
                  pressedBackgroundColor: artTab.pressedBackgroundColor,
                  pressedForegroundColor: artTab.pressedForegroundColor,
                  gradient: artTab.gradient,
                  textDecoration: artTab.textDecoration,
                  hoverTextDecoration: artTab.hoverTextDecoration,
                  statesController: artTab.statesController,
                  mainAxisAlignment: artTab.mainAxisAlignment,
                  crossAxisAlignment: artTab.crossAxisAlignment,
                  hoverStrategies: artTab.hoverStrategies,
                  onHoverChange: artTab.onHoverChange,
                  onTapDown: artTab.onTapDown,
                  onTapUp: artTab.onTapUp,
                  onTapCancel: artTab.onTapCancel,
                  onLongPressStart: artTab.onLongPressStart,
                  onLongPressCancel: artTab.onLongPressCancel,
                  onLongPressUp: artTab.onLongPressUp,
                  onLongPressDown: artTab.onLongPressDown,
                  onLongPressEnd: artTab.onLongPressEnd,
                  onDoubleTap: artTab.onDoubleTap,
                  onDoubleTapDown: artTab.onDoubleTapDown,
                  onDoubleTapCancel: artTab.onDoubleTapCancel,
                  longPressDuration: artTab.longPressDuration,
                  expandContent: artTab.expandContent,
                  child: artTab.child,
                ),
              )
              .toList(),
      gap: _effectiveGap,
      scrollable: widget.scrollable,
      dragStartBehavior: widget.dragStartBehavior,
      physics: widget.physics,
      padding: EdgeInsets.zero,
      decoration: widget.decoration,
      tabBarConstraints: widget.tabBarConstraints,
      contentConstraints: widget.contentConstraints,
      maintainState: widget.maintainState,
      tabBarAlignment: widget.tabBarAlignment,
      tabsGap: widget.tabsGap,
      restorationId: widget.restorationId,
      onChanged: (value) {
        controller.select(value);
        widget.onChanged?.call(value);
      },
    );
  }
}

class DSTab<T> extends StatelessWidget implements PreferredSizeWidget {
  const DSTab({
    required this.value,
    required this.child,
    super.key,
    this.content,
    this.leading,
    this.trailing,
    this.enabled = true,
    this.flex = 1,
    this.height,
    this.width,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.hoverBackgroundColor,
    this.selectedHoverBackgroundColor,
    this.padding,
    this.decoration,
    this.selectedDecoration,
    this.foregroundColor,
    this.selectedForegroundColor,
    this.textStyle,
    this.shadows,
    this.selectedShadows,
    this.focusNode,
    this.onPressed,
    this.onLongPress,
    this.size,
    this.cursor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.expandContent,
  });

  final T value;

  final Widget child;

  final Widget? content;

  final Widget? leading;

  final Widget? trailing;

  final bool enabled;

  final int flex;

  final double? height;

  final double? width;

  final Color? backgroundColor;

  final Color? selectedBackgroundColor;

  final Color? hoverBackgroundColor;

  final Color? selectedHoverBackgroundColor;

  final EdgeInsets? padding;

  final DSDecoration? decoration;

  final DSDecoration? selectedDecoration;

  final Color? foregroundColor;

  final Color? selectedForegroundColor;

  final TextStyle? textStyle;

  final List<BoxShadow>? shadows;

  final List<BoxShadow>? selectedShadows;

  final FocusNode? focusNode;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final DSButtonSize? size;

  final MouseCursor? cursor;

  final Color? hoverForegroundColor;

  final bool autofocus;

  final Color? pressedBackgroundColor;

  final Color? pressedForegroundColor;

  final Gradient? gradient;

  final TextDecoration? textDecoration;

  final TextDecoration? hoverTextDecoration;

  final ShadStatesController? statesController;

  final MainAxisAlignment? mainAxisAlignment;

  final CrossAxisAlignment? crossAxisAlignment;

  final ShadHoverStrategies? hoverStrategies;

  final ValueChanged<bool>? onHoverChange;

  final ValueChanged<TapDownDetails>? onTapDown;

  final ValueChanged<TapUpDetails>? onTapUp;

  final VoidCallback? onTapCancel;

  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  final VoidCallback? onLongPressCancel;

  final VoidCallback? onLongPressUp;

  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  final VoidCallback? onDoubleTap;

  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  final VoidCallback? onDoubleTapCancel;

  final Duration? longPressDuration;

  final bool? expandContent;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height ?? 32);
  }
}
