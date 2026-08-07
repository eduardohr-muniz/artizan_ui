import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'view_code.dart';

class ScaffoldBase extends StatelessWidget {
  const ScaffoldBase({
    required this.child,
    super.key,
    this.code,
    this.scrollable = false,
    this.maxWidth,
  });

  final Widget child;
  final String? code;
  final bool scrollable; // true = SingleChildScrollView, false = Center
  final double? maxWidth; // opcional para constringir largura

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;

    Widget content = child;
    if (maxWidth != null) {
      content = ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth!),
        child: content,
      );
    }

    final Widget main = scrollable
        ? SingleChildScrollView(padding: const EdgeInsets.all(12), child: content)
        : Center(child: Padding(padding: const EdgeInsets.all(12), child: content));

    return Scaffold(
      backgroundColor: cs.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: main),
            if (code != null)
              Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: cs.border)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: ViewCode(code: code!),
              ),
          ],
        ),
      ),
    );
  }
}
