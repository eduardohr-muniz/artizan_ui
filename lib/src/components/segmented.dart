import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ArtSegmented<T> extends StatelessWidget {
  final bool multiSelectionEnabled;
  final bool emptySelectionAllowed;
  final List<T> segments;
  final Set<T> selected;
  final Function(Set<T>)? onSelectionChanged;
  final ArtSegmentedItem<T> Function(T value) segmentBuilder;

  const ArtSegmented({
    super.key,
    required this.selected,
    required this.segments,
    required this.segmentBuilder,
    this.onSelectionChanged,
    this.multiSelectionEnabled = false,
    this.emptySelectionAllowed = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = ArtTheme.of(context).colorScheme;
    return SegmentedButton<T>(
      multiSelectionEnabled: multiSelectionEnabled,
      emptySelectionAllowed: emptySelectionAllowed,
      selectedIcon: Icon(LucideIcons.check, size: 12),
      style: SegmentedButton.styleFrom(
        side: BorderSide(color: isDarkTheme ? colorScheme.mutedForeground : colorScheme.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selectedBackgroundColor: isDarkTheme ? colorScheme.muted : colorScheme.background,
        selectedForegroundColor: colorScheme.foreground,
        backgroundColor: isDarkTheme ? colorScheme.background : colorScheme.muted,
        foregroundColor: colorScheme.mutedForeground,
        overlayColor: Colors.transparent,
      ),
      segments: segments.map((e) => segmentBuilder(e)).toList(),
      selected: selected,
      onSelectionChanged: onSelectionChanged,
    );
  }
}

class ArtSegmentedItem<T> extends ButtonSegment<T> {
  const ArtSegmentedItem({required super.value, super.icon, super.label, super.tooltip, super.enabled});
}
