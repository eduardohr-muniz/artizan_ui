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

@UseCase(name: 'Primary', type: ArtButton)
Widget primaryButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtButton(
      trailing: context.knobs.boolean(label: 'SuffixIcon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      leading: context.knobs.boolean(label: 'Icon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(name: 'Destructive', type: ArtButton)
Widget destructiveButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtButton.destructive(
      trailing: context.knobs.boolean(label: 'SuffixIcon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      leading: context.knobs.boolean(label: 'Icon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(name: 'Secondary', type: ArtButton)
Widget secondaryButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtButton.secondary(
      trailing: context.knobs.boolean(label: 'SuffixIcon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      leading: context.knobs.boolean(label: 'Icon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(name: 'Outline', type: ArtButton)
Widget outlineButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtButton.outline(
      trailing: context.knobs.boolean(label: 'SuffixIcon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      leading: context.knobs.boolean(label: 'Icon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(name: 'Ghost', type: ArtButton)
Widget ghostButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtButton.ghost(
      trailing: context.knobs.boolean(label: 'SuffixIcon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      leading: context.knobs.boolean(label: 'Icon', initialValue: true) ? const Icon(Icons.ac_unit) : null,
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(name: 'Link', type: ArtButton)
Widget linkButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtButton.link(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(name: 'Raw', type: ArtButton)
Widget rawButton(BuildContext context) {
  final type = context.knobs.list(label: 'Pressed type', options: typePressed);
  return _base(
    child: ArtButton.link(
      onPressed: () async {
        await onTap(type);
      },
      enabled: context.knobs.boolean(
        label: 'Enable',
        initialValue: true,
      ),
      child: Text(context.knobs.string(label: 'Text', initialValue: 'Text')),
    ),
  );
}

@UseCase(name: 'Icon', type: ArtButton)
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
            Expanded(child: child),
          ],
        ),
      ),
    ),
  );
}
