import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/widgets.dart';

class ArtSegmentedBadge<T> extends StatelessWidget {
  final T value;
  final List<T> options;
  final Function(T value) onChanged;
  final Widget Function(T value) childBuilder;
  final Widget? label;
  const ArtSegmentedBadge({required this.value, required this.options, required this.onChanged, required this.childBuilder, this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        if (label != null) DefaultTextStyle(style: context.artTextTheme.muted.copyWith(color: context.artColorScheme.foreground, fontWeight: FontWeight.w600), child: label!),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: context.artColorScheme.muted, borderRadius: BorderRadius.circular(21)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children:
                options
                    .map(
                      (e) => IgnorePointer(
                        ignoring: value == e,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 45),
                          child: ArtBadge.raw(
                            variant: value == e ? ArtBadgeVariant.primary : ArtBadgeVariant.secondary,
                            backgroundColor: value == e ? null : context.artColorScheme.background,
                            foregroundColor: value == e ? null : context.artColorScheme.foreground,
                            hoverBackgroundColor: context.artColorScheme.ring.withValues(alpha: .1),
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: childBuilder(e),
                            onPressed: () => onChanged(e),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
