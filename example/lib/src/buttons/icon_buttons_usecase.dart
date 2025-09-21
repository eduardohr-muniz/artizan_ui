import 'dart:developer';
import 'package:artizan_ui/artizan_ui.dart';
import 'package:example/src/widget_base.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

List<String> typePressed = ['onTap', 'onTapFuture'];

onTap(String type) async {
  if (type == 'onTap') {
    log('onTap');
  } else {
    await Future.delayed(const Duration(seconds: 1), () {
      log('onTapFuture');
    });
  }
}

@UseCase(name: 'Primary', type: ArtIconButton)
Widget primaryButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtIconButton(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      icon: Icon(Icons.ac_unit),
    ),
  );
}

@UseCase(name: 'Destructive', type: ArtIconButton)
Widget destructiveButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtIconButton.destructive(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      icon: Icon(Icons.ac_unit),
    ),
  );
}

@UseCase(name: 'Secondary', type: ArtIconButton)
Widget secondaryButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtIconButton.secondary(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      icon: Icon(Icons.ac_unit),
    ),
  );
}

@UseCase(name: 'Outline', type: ArtIconButton)
Widget outlineButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtIconButton.outline(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      icon: Icon(Icons.ac_unit),
    ),
  );
}

@UseCase(name: 'Ghost', type: ArtIconButton)
Widget ghostButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtIconButton.ghost(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      icon: Icon(Icons.ac_unit),
    ),
  );
}

@UseCase(name: 'Icon', type: ArtIconButton)
Widget iconButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return BaseWidget(
    child: ArtIconButton.outline(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
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
            child,
          ],
        ),
      ),
    ),
  );
}
