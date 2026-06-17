# InputOTP

Accessible one-time password component with copy paste functionality.



```dart
DSInputOTP(
  onChanged: (v) => print('OTP: $v'),
  maxLength: 6,
  children: const [
    DSInputOTPGroup(
      children: [
        DSInputOTPSlot(),
        DSInputOTPSlot(),
        DSInputOTPSlot(),
      ],
    ),
    Icon(size: 24, LucideIcons.dot),
    DSInputOTPGroup(
      children: [
        DSInputOTPSlot(),
        DSInputOTPSlot(),
        DSInputOTPSlot(),
      ],
    ),
  ],
)
```



## InputFormatters

Using InputFormatters you can restrict the input characters.
The example below shows how to restrict the input to only numbers.



```dart
DSInputOTP(
  onChanged: (v) => print('OTP: $v'),
  maxLength: 4,
  keyboardType: TextInputType.number,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
  ],
  children: const [
    DSInputOTPGroup(
      children: [
        DSInputOTPSlot(),
        DSInputOTPSlot(),
        DSInputOTPSlot(),
        DSInputOTPSlot(),
      ],
    ),
  ],
)
```



See also `UpperCaseTextInputFormatter` and `LowerCaseTextInputFormatter` which are provided by the package.

## Form



```dart
DSInputOTPFormField(
  id: 'otp',
  maxLength: 6,
  label: const Text('OTP'),
  description: const Text('Enter your OTP.'),
  validator: (v) {
    if (v.contains(' ')) {
      return 'Fill the whole OTP code';
    }
    return null;
  },
  children: const [
    DSInputOTPGroup(
      children: [
        DSInputOTPSlot(),
        DSInputOTPSlot(),
        DSInputOTPSlot(),
      ],
    ),
    Icon(size: 24, LucideIcons.dot),
    DSInputOTPGroup(
      children: [
        DSInputOTPSlot(),
        DSInputOTPSlot(),
        DSInputOTPSlot(),
      ],
    ),
  ],
)
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:dependencies/dependencies.dart';

class InputOTPPage extends StatefulWidget {
  const InputOTPPage({super.key});

  @override
  State<InputOTPPage> createState() => _InputOTPPageState();
}

class _InputOTPPageState extends State<InputOTPPage> {
  var enabled = true;
  var uppercase = true;
  var digitsOnly = false;
  var jumpToNextWhenFilled = true;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Input OTP',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyBoolProperty(
          label: 'Uppercase',
          value: uppercase,
          enabled: !digitsOnly,
          onChanged: (value) => setState(() => uppercase = value),
        ),
        MyBoolProperty(
          label: 'Digits only',
          value: digitsOnly,
          enabled: !uppercase,
          onChanged: (value) => setState(() => digitsOnly = value),
        ),
        MyBoolProperty(
          label: 'Jump to next when filled',
          value: jumpToNextWhenFilled,
          onChanged: (value) => setState(() => jumpToNextWhenFilled = value),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: DSInputOTP(
            onChanged: (v) => print('OTP: $v'),
            maxLength: 6,
            enabled: enabled,
            jumpToNextWhenFilled: jumpToNextWhenFilled,
            keyboardType: digitsOnly ? TextInputType.number : null,
            inputFormatters: [
              if (digitsOnly) FilteringTextInputFormatter.digitsOnly,
              if (uppercase) const UpperCaseTextInputFormatter(),
            ],
            children: const [
              DSInputOTPGroup(
                children: [
                  DSInputOTPSlot(),
                  DSInputOTPSlot(),
                  DSInputOTPSlot(),
                ],
              ),
              Icon(LucideIcons.dot),
              DSInputOTPGroup(
                children: [
                  DSInputOTPSlot(),
                  DSInputOTPSlot(),
                  DSInputOTPSlot(),
                ],
              ),
            ],
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
import 'package:example/common/properties/string_property.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class InputOTPFormFieldPage extends StatefulWidget {
  const InputOTPFormFieldPage({super.key});

  @override
  State<InputOTPFormFieldPage> createState() => _InputOTPFormFieldPageState();
}

class _InputOTPFormFieldPageState extends State<InputOTPFormFieldPage> {
  bool enabled = true;
  var autovalidateMode = DSAutovalidateMode.alwaysAfterFirstValidation;
  String? initialValue;
  Map<Object, dynamic> formValue = {};
  final formKey = GlobalKey<DSFormState>();

  @override
  Widget build(BuildContext context) {
    return DSForm(
      key: formKey,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      initialValue: {if (initialValue != null) 'otp': initialValue},
      child: BaseScaffold(
        appBarTitle: 'InputFormField',
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
          MyStringProperty(
            label: 'Form Initial Value',
            initialValue: initialValue,
            placeholder: const Text('OTP initial value'),
            onChanged: (value) {
              setState(() {
                value.isEmpty ? initialValue = null : initialValue = value;
              });
              // Reset the form
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                formKey.currentState!.reset();
              });
            },
          ),
        ],
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSInputOTPFormField(
                  id: 'otp',
                  maxLength: 6,
                  enabled: enabled,
                  label: const Text('OTP'),
                  description: const Text('Enter your OTP.'),
                  validator: (v) {
                    if (v.contains(' ')) {
                      return 'Fill the whole OTP code';
                    }
                    return null;
                  },
                  children: const [
                    DSInputOTPGroup(
                      children: [
                        DSInputOTPSlot(),
                        DSInputOTPSlot(),
                        DSInputOTPSlot(),
                      ],
                    ),
                    Icon(LucideIcons.dot),
                    DSInputOTPGroup(
                      children: [
                        DSInputOTPSlot(),
                        DSInputOTPSlot(),
                        DSInputOTPSlot(),
                      ],
                    ),
                  ],
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
                        Text('FormValue', style: context.dsTextTheme.body),
                        const SizedBox(height: 4),
                        SelectableText(
                          const JsonEncoder.withIndent(
                            '    ',
                          ).convert(formValue),
                          style: context.dsTextTheme.bodySmall,
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
