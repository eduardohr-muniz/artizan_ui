import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/widgets.dart';

class DSSegmentedBadge<T> extends StatefulWidget {
  final T value;
  final List<T> options;
  final Function(T value) onChanged;
  final Widget Function(T value) childBuilder;
  final Widget? label;

  const DSSegmentedBadge({
    required this.value,
    required this.options,
    required this.onChanged,
    required this.childBuilder,
    this.label,
    super.key,
  });

  @override
  State<DSSegmentedBadge<T>> createState() => _DSSegmentedBadgeState<T>();
}

class _DSSegmentedBadgeState<T> extends State<DSSegmentedBadge<T>> {
  late T _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(DSSegmentedBadge<T> old) {
    super.didUpdateWidget(old);
    if (old.value != widget.value) {
      _value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (widget.label != null)
          DefaultTextStyle(
            style: DSTheme.of(context).textTheme.muted.copyWith(color: context.dsColors.foreground, fontWeight: FontWeight.w600),
            child: widget.label!,
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: context.dsColors.muted, borderRadius: BorderRadius.circular(21)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: widget.options.map((e) {
              final isSelected = _value == e;
              return IgnorePointer(
                ignoring: isSelected,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 45),
                  child: DSBadge.raw(
                    variant: isSelected ? DSBadgeVariant.primary : DSBadgeVariant.secondary,
                    backgroundColor: isSelected ? null : context.dsColors.background,
                    foregroundColor: isSelected ? null : context.dsColors.foreground,
                    hoverBackgroundColor: context.dsColors.ring.withValues(alpha: .1),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    onPressed: () {
                      setState(() => _value = e);
                      widget.onChanged(e);
                    },
                    child: widget.childBuilder(e),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
