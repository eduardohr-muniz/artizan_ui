import 'dart:developer';
import 'package:artizan_ui/artizan_ui.dart';
import 'package:example/src/widget_base.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

List<String> typePressed = [
  'onTap',
  'onTapFuture',
];

ValueNotifier<bool?> loading = ValueNotifier(false);

onTap(String type) async {
  if (type == 'onTap') {
    log('onTap');
  } else if (type == 'onTapFuture') {
    await Future.delayed(const Duration(seconds: 1), () {
      log('onTapFuture');
    });
  }
}

@UseCase(name: 'Button', type: ArtButton)
Widget primaryButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  final variant = context.knobs.list(label: 'Variant', options: ArtButtonVariant.values);
  final forceLoading = context.knobs.boolean(label: 'Force Loading', initialValue: false);
  return _base(
    child: ValueListenableBuilder(
        valueListenable: loading,
        builder: (context, value, child) {
          return ArtButton.raw(
            variant: variant,
            trailing: context.knobs.boolean(label: 'SuffixIcon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
            leading: context.knobs.boolean(label: 'Icon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
            expands: true,
            onPressed: () async {
              await onTap(type);
            },
            isLoading: forceLoading,
            enabled: context.knobs.boolean(
              label: 'Enable',
              initialValue: true,
            ),
            child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
          );
        }),
  );
}

@UseCase(name: 'IconButton', type: ArtButton)
Widget iconButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  final variant = context.knobs.list(label: 'Variant', options: ArtButtonVariant.values.where((e) => e != ArtButtonVariant.link).toList());
  final forceLoading = context.knobs.boolean(label: 'Force Loading', initialValue: false);
  return BaseWidget(
    child: ArtIconButton.raw(
      variant: variant,
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      isLoading: forceLoading,
      icon: const Icon(Icons.ac_unit),
    ),
  );
}

Widget _base({required Widget child}) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Row(
          children: [
            Expanded(child: child),
          ],
        ),
      ),
    ),
  );
}
