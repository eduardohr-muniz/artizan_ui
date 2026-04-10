import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';

enum ArtEmptyStateVariant { inTable, nonTable, small, minimal }

class ArtEmptyState extends StatefulWidget {
  final Widget icon;
  final String? title;
  final String? subtitle;
  final Widget? action;
  final Color? color;
  final Color? backgroundColor;
  final bool showAvatar;
  final ArtEmptyStateVariant variant;
  final TextAlign? textAlignment;

  const ArtEmptyState({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
    this.variant = ArtEmptyStateVariant.minimal,
    this.textAlignment,
  });

  const ArtEmptyState.intable({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
  }) : variant = ArtEmptyStateVariant.inTable,
       textAlignment = null;

  const ArtEmptyState.nonTable({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
  }) : variant = ArtEmptyStateVariant.nonTable,
       textAlignment = null;

  const ArtEmptyState.small({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
    this.textAlignment,
  }) : variant = ArtEmptyStateVariant.small;

  const ArtEmptyState.minimal({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.color,
    this.backgroundColor,
    this.showAvatar = true,
    this.textAlignment,
  }) : variant = ArtEmptyStateVariant.minimal,
       action = null;

  @override
  State<ArtEmptyState> createState() => _ArtEmptyStateState();
}

class _ArtEmptyStateState extends State<ArtEmptyState> {
  Widget _title(BuildContext context) => Text(widget.title!, style: context.artTextTheme.small, textAlign: widget.textAlignment);

  Widget _subtitle(BuildContext context) => Text(widget.subtitle!, style: context.artTextTheme.muted, textAlign: widget.textAlignment);

  Widget _icon(BuildContext context) {
    final iconWidget = IconTheme(data: IconThemeData(color: widget.color ?? context.artColorScheme.foreground), child: widget.icon);

    if (!widget.showAvatar) return iconWidget;

    return CircleAvatar(
      backgroundColor: widget.backgroundColor ?? (widget.color ?? context.artColorScheme.primary).withValues(alpha: .2),
      child: iconWidget,
    );
  }

  Widget _inTableWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _icon(context),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null) _title(context),
              if (widget.title != null && widget.subtitle != null) const SizedBox(height: 4),
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
      case ArtEmptyStateVariant.inTable:
        return _inTableWidget();
      case ArtEmptyStateVariant.nonTable:
        return _nonTableWidget();
      case ArtEmptyStateVariant.small:
        return _smallWidget(context);
      case ArtEmptyStateVariant.minimal:
        return _minimalWidget(context);
    }
  }
}
