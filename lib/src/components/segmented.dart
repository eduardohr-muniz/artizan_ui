import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

class DSSegmented<T> extends StatefulWidget {
  final bool multiSelectionEnabled;
  final bool emptySelectionAllowed;
  final List<T> segments;
  final Set<T> selected;
  final Function(Set<T>)? onSelectionChanged;
  final DSSegmentedItem<T> Function(T value) segmentBuilder;

  const DSSegmented({
    super.key,
    required this.selected,
    required this.segments,
    required this.segmentBuilder,
    this.onSelectionChanged,
    this.multiSelectionEnabled = false,
    this.emptySelectionAllowed = false,
  });

  @override
  State<DSSegmented<T>> createState() => _DSSegmentedState<T>();
}

class _DSSegmentedState<T> extends State<DSSegmented<T>> {
  late Set<T> _selected;

  @override
  void initState() {
    super.initState();
    _selected = Set.of(widget.selected);
  }

  @override
  void didUpdateWidget(DSSegmented<T> old) {
    super.didUpdateWidget(old);
    if (old.selected != widget.selected) {
      _selected = Set.of(widget.selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = DSTheme.of(context).colorScheme;

    return SegmentedButton<T>(
      multiSelectionEnabled: widget.multiSelectionEnabled,
      emptySelectionAllowed: widget.emptySelectionAllowed,
      selectedIcon: const Icon(LucideIcons.check, size: 12),
      style: SegmentedButton.styleFrom(
        side: BorderSide(color: isDarkTheme ? colorScheme.mutedForeground : colorScheme.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selectedBackgroundColor: isDarkTheme ? colorScheme.muted : colorScheme.background,
        selectedForegroundColor: colorScheme.foreground,
        backgroundColor: isDarkTheme ? colorScheme.background : colorScheme.muted,
        foregroundColor: colorScheme.mutedForeground,
        overlayColor: Colors.transparent,
      ),
      segments: widget.segments.map((e) => widget.segmentBuilder(e)).toList(),
      selected: _selected,
      onSelectionChanged: (value) {
        setState(() => _selected = value);
        widget.onSelectionChanged?.call(value);
      },
    );
  }
}

class DSSegmentedItem<T> extends ButtonSegment<T> {
  const DSSegmentedItem({required super.value, super.icon, super.label, super.tooltip, super.enabled});
}
