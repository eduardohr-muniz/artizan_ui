import 'package:ds_ui/src/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum DSAlertVariant { success, info, warning, destructive, muted }

class DSAlert extends StatelessWidget {
  const DSAlert.success({super.key, this.iconData, this.title, this.description}) : variant = DSAlertVariant.success;

  const DSAlert.info({super.key, this.iconData, this.title, this.description}) : variant = DSAlertVariant.info;

  const DSAlert.warning({super.key, this.iconData, this.title, this.description}) : variant = DSAlertVariant.warning;

  const DSAlert.destructive({super.key, this.iconData, this.title, this.description}) : variant = DSAlertVariant.destructive;

  const DSAlert.muted({super.key, this.iconData, this.title, this.description}) : variant = DSAlertVariant.muted;

  final DSAlertVariant variant;
  final IconData? iconData;
  final Widget? title;
  final Widget? description;

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;

    final (Color bg, Color fg, IconData defaultIcon) = switch (variant) {
      DSAlertVariant.success => (cs.success.withValues(alpha: 0.12), cs.success, LucideIcons.circleCheck),
      DSAlertVariant.info => (cs.info.withValues(alpha: 0.12), cs.info, LucideIcons.info),
      DSAlertVariant.warning => (cs.warning.withValues(alpha: 0.12), cs.warning, LucideIcons.triangleAlert),
      DSAlertVariant.destructive => (cs.destructive.withValues(alpha: 0.12), cs.destructive, LucideIcons.circleX),
      DSAlertVariant.muted => (cs.muted, cs.mutedForeground, LucideIcons.info),
    };

    bool hasTitle = title != null && title.toString().isNotEmpty;
    bool hasDescription = description != null && description.toString().isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData ?? defaultIcon, size: 14, color: fg),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasTitle) DefaultTextStyle.merge(style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: fg), child: title!),
                if (hasTitle && hasDescription) const SizedBox(height: 2),
                if (hasDescription) DefaultTextStyle.merge(style: TextStyle(fontSize: 13, color: fg), child: description!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
