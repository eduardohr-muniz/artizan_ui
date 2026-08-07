import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

enum DSEmptyStateVariant { inTable, nonTable, small, minimal }

class DSEmptyState extends StatefulWidget {
  final Widget icon;
  final String? title;
  final String? subtitle;
  final Widget? action;
  final Color? color;
  final Color? backgroundColor;
  final bool showAvatar;
  final DSEmptyStateVariant variant;
  final TextAlign? textAlignment;

  const DSEmptyState({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
    this.variant = DSEmptyStateVariant.minimal,
    this.textAlignment,
  });

  const DSEmptyState.intable({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
  }) : variant = DSEmptyStateVariant.inTable,
       textAlignment = null;

  const DSEmptyState.nonTable({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
  }) : variant = DSEmptyStateVariant.nonTable,
       textAlignment = null;

  const DSEmptyState.small({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
    this.textAlignment,
  }) : variant = DSEmptyStateVariant.small;

  const DSEmptyState.minimal({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
    this.textAlignment,
  }) : variant = DSEmptyStateVariant.minimal,
       action = null;

  @override
  State<DSEmptyState> createState() => _DSEmptyStateState();
}

class _DSEmptyStateState extends State<DSEmptyState> {
  Widget _title(BuildContext context) => Text(
    widget.title!,
    style: DSTheme.of(context).textTheme.small,
    textAlign: widget.textAlignment,
  );

  Widget _subtitle(BuildContext context) => Text(
    widget.subtitle!,
    style: DSTheme.of(context).textTheme.muted,
    textAlign: widget.textAlignment,
  );

  Widget _icon(BuildContext context) {
    final iconWidget = IconTheme(
      data: IconThemeData(color: widget.color ?? context.dsColors.foreground),
      child: widget.icon,
    );

    if (!widget.showAvatar) return iconWidget;

    return CircleAvatar(
      backgroundColor:
          widget.backgroundColor ??
          (widget.color ?? context.dsColors.primary).withValues(alpha: .2),
      child: iconWidget,
    );
  }

  Widget _inTableWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _icon(context),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null) _title(context),
              if (widget.title != null && widget.subtitle != null)
                const SizedBox(height: 4),
              if (widget.subtitle != null) _subtitle(context),
              if (widget.action != null) ...[const SizedBox(height: 16), widget.action!],
            ],
          ),
        ),
      ],
    );
  }

  Widget _nonTableWidget() {
    return _inTableWidget();
  }

  Widget _smallWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _minimalWidget(context),
        if (widget.action != null) ...[const SizedBox(height: 8), widget.action!],
      ],
    );
  }

  Widget _minimalWidget(BuildContext context) {
    final hasText = widget.title != null || widget.subtitle != null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _icon(context),
        if (hasText) SizedBox(height: widget.showAvatar ? 16 : 12),
        if (widget.title != null) _title(context),
        if (widget.title != null && widget.subtitle != null) const SizedBox(height: 4),
        if (widget.subtitle != null) _subtitle(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.variant) {
      case DSEmptyStateVariant.inTable:
        return _inTableWidget();
      case DSEmptyStateVariant.nonTable:
        return _nonTableWidget();
      case DSEmptyStateVariant.small:
        return _smallWidget(context);
      case DSEmptyStateVariant.minimal:
        return _minimalWidget(context);
    }
  }
}
