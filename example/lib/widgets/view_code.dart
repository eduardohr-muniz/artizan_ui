import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class ViewCode extends StatefulWidget {
  final String code;
  const ViewCode({required this.code, super.key});

  @override
  State<ViewCode> createState() => _ViewCodeState();
}

class _ViewCodeState extends State<ViewCode> {
  bool _expanded = false;
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Row(
              children: [
                Icon(LucideIcons.code, size: 14, color: cs.mutedForeground),
                const SizedBox(width: 6),
                Text(
                  _expanded ? 'Hide code' : 'View code',
                  style: TextStyle(fontSize: 12, color: cs.mutedForeground),
                ),
                const Spacer(),
                Icon(
                  _expanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
                  size: 14,
                  color: cs.mutedForeground,
                ),
              ],
            ),
          ),
        ),
        if (_expanded) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                HighlightView(
                  widget.code.trim(),
                  language: 'dart',
                  theme: atomOneDarkTheme,
                  padding: const EdgeInsets.fromLTRB(16, 16, 48, 16),
                  textStyle:
                      const TextStyle(fontFamily: 'monospace', fontSize: 12, height: 1.5),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: _copy,
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        _copied ? LucideIcons.check : LucideIcons.copy,
                        size: 14,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
