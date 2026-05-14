# RadioGroup

A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.



```dart
DSRadioGroup<String>(
  items: [
    DSRadio(
      label: Text('Default'),
      value: 'default',
    ),
    DSRadio(
      label: Text('Comfortable'),
      value: 'comfortable',
    ),
    DSRadio(
      label: Text('Nothing'),
      value: 'nothing',
    ),
  ],
),
```



## Form



```dart
enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

DSRadioGroupFormField<NotifyAbout>(
  label: const Text('Notify me about'),
  items: NotifyAbout.values.map(
    (e) => DSRadio(
      value: e,
      label: Text(e.message),
    ),
  ),
  validator: (v) {
    if (v == null) {
      return 'You need to select a notification type.';
    }
    return null;
  },
),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dependencies/dependencies.dart';

enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  NotifyAbout? value;
  bool enabled = true;
  Axis axis = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'RadioGroup',
      crossAxisAlignment: CrossAxisAlignment.start,
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyEnumProperty(
          label: 'Axis',
          value: axis,
          onChanged: (value) {
            if (value != null) {
              setState(() => axis = value);
            }
          },
          values: Axis.values,
        ),
      ],
      children: [
        DSRadioGroup<NotifyAbout>(
          enabled: enabled,
          initialValue: value,
          onChanged: (v) {
            print('onChange $v');
          },
          axis: axis,
          items: NotifyAbout.values.map(
            (e) => DSRadio(
              value: e,
              label: Text(e.message),
            ),
          ),
        ),
      ],
    );
  }
}

```

## Form Example
```dart
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

enum NotifyAbout {
  all,
  mentions,
  nothing;

  String get message {
    return switch (this) {
      all => 'All new messages',
      mentions => 'Direct messages and mentions',
      nothing => 'Nothing',
    };
  }
}

class RadioGroupFormFieldPage extends StatefulWidget {
  const RadioGroupFormFieldPage({super.key});

  @override
  State<RadioGroupFormFieldPage> createState() =>
      _RadioGroupFormFieldPageState();
}

class _RadioGroupFormFieldPageState extends State<RadioGroupFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = DSAutovalidateMode.alwaysAfterFirstValidation;
  NotifyAbout? initialValue;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<DSFormState>();

  @override
  Widget build(BuildContext context) {
    final theme = DSTheme.of(context);
    return DSForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {'notify': initialValue},
      child: BaseScaffold(
        appBarTitle: 'RadioGroupFormField',
        editable: [
          MyBoolProperty(
            label: 'Enabled',
            value: enabled,
            onChanged: (value) => setState(() => enabled = value),
          ),
          MyEnumProperty(
            label: 'autovalidateMode',
            value: autovalidateMode,
            values: DSAutovalidateMode.values,
            onChanged: (value) {
              if (value != null) {
                setState(() => autovalidateMode = value);
              }
            },
          ),
          MyEnumProperty<NotifyAbout>(
            label: 'Form Initial Value',
            value: NotifyAbout.nothing,
            values: NotifyAbout.values,
            onChanged: (value) {
              formKey.currentState!.setFieldValue('notify', value);
            },
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSRadioGroupFormField(
                  id: 'notify',
                  enabled: enabled,
                  initialValue: initialValue,
                  toValueTransformer: (value) => value?.name,
                  items: NotifyAbout.values.map(
                    (e) => DSRadio(
                      value: e,
                      label: Text(e.message),
                    ),
                  ),
                  label: const Text('Notify me about'),
                  validator: (v) {
                    if (v == null) {
                      return 'You need to select a notification type.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DSButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    print('submitted');
                    if (formKey.currentState!.saveAndValidate()) {
                      setState(() {
                        formValue = formKey.currentState!.value;
                      });
                    } else {
                      print('validation failed');
                    }
                  },
                ),
                if (formValue.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('FormValue', style: theme.textTheme.p),
                        const SizedBox(height: 4),
                        SelectableText(
                          const JsonEncoder.withIndent(
                            '    ',
                          ).convert(formValue),
                          style: theme.textTheme.small,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

```
