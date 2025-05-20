import 'package:artizan_ui/src/themes/theme.dart';
import 'package:flutter/material.dart';

enum ArtEmptyStateVariant {
  inTable,
  nonTable,
  small,
  minimal;
}

class ArtEmptyState extends StatefulWidget {
  final Widget icon;
  final String? title;
  final String? subtitle;
  final Widget? action;
  final Color? color;
  final ArtEmptyStateVariant variant;

  const ArtEmptyState.intable({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
  }) : variant = ArtEmptyStateVariant.inTable;

  const ArtEmptyState.nonTable({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
  }) : variant = ArtEmptyStateVariant.nonTable;

  const ArtEmptyState.small({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.action,
    this.color,
  }) : variant = ArtEmptyStateVariant.small;

  const ArtEmptyState.minimal({
    required this.icon,
    super.key,
    this.title,
    this.subtitle,
    this.color,
  })  : variant = ArtEmptyStateVariant.minimal,
        action = null;

  @override
  State<ArtEmptyState> createState() => _ArtEmptyStateState();
}

class _ArtEmptyStateState extends State<ArtEmptyState> {
  late final theme = ArtTheme.of(context);

  Widget _title() => DefaultTextStyle(
        style: theme.textTheme.small,
        child: Flexible(
          child: Text(widget.title!),
        ),
      );

  Widget _subtitle() => DefaultTextStyle(
        style: theme.textTheme.muted,
        child: Flexible(
          child: Text(widget.subtitle!),
        ),
      );

  Widget _icon() {
    return CircleAvatar(
      backgroundColor: (widget.color ?? theme.colorScheme.primary).withOpacity(.2),
      child: IconTheme(
        data: IconThemeData(
          color: widget.color ?? theme.colorScheme.foreground,
        ),
        child: widget.icon,
      ),
    );
  }

  Widget _inTableWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _icon(),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null) _title(),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 4),
                _subtitle(),
              ],
              if (widget.action != null) ...[
                SizedBox(height: 16),
                widget.action!,
              ]
            ],
          ),
        ),
      ],
    );
  }

  Widget _nonTableWidget() {
    return _inTableWidget();
  }

  Widget _smallWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _minimalWidget(),
        if (widget.action != null) ...[
          const SizedBox(height: 8),
          widget.action!,
        ]
      ],
    );
  }

  Widget _minimalWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _icon(),
        if (widget.title != null) ...[
          const SizedBox(height: 16),
          _title(),
        ],
        if (widget.subtitle != null) ...[
          const SizedBox(height: 4),
          _subtitle(),
        ]
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
        return _smallWidget();
      case ArtEmptyStateVariant.minimal:
        return _minimalWidget();
    }
  }
}
