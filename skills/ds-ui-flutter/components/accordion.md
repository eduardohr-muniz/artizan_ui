# Accordion

A vertically stacked set of interactive headings that each reveal a section of content.



```dart
final details = [
  (
    title: 'Is it acceptable?',
    content: 'Yes. It adheres to the WAI-ARIA design pattern.',
  ),
  (
    title: 'Is it styled?',
    content:
        "Yes. It comes with default styles that matches the other components' aesthetic.",
  ),
  (
    title: 'Is it animated?',
    content:
        "Yes. It's animated by default, but you can disable it if you prefer.",
  ),
];

@override
Widget build(BuildContext context) {
  return DSAccordion<({String content, String title})>(
    children: details.map(
      (detail) => DSAccordionItem(
        value: detail,
        title: Text(detail.title),
        child: Text(detail.content),
      ),
    ),
  );
}
```



## Multiple



```dart
final details = [
  (
    title: 'Is it acceptable?',
    content: 'Yes. It adheres to the WAI-ARIA design pattern.',
  ),
  (
    title: 'Is it styled?',
    content:
        "Yes. It comes with default styles that matches the other components' aesthetic.",
  ),
  (
    title: 'Is it animated?',
    content:
        "Yes. It's animated by default, but you can disable it if you prefer.",
  ),
];

@override
Widget build(BuildContext context) {
  return DSAccordion<({String content, String title})>.multiple(
    children: details.map(
      (detail) => DSAccordionItem(
        value: detail,
        title: Text(detail.title),
        child: Text(detail.content),
      ),
    ),
  );
}
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/enum_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dependencies/dependencies.dart';

final details = [
  (
    title: 'Is it acceptable?',
    content: 'Yes. It adheres to the WAI-ARIA design pattern.',
  ),
  (
    title: 'Is it styled?',
    content:
        "Yes. It comes with default styles that matches the other components' aesthetic.",
  ),
  (
    title: 'Is it animated?',
    content:
        "Yes. It's animated by default, but you can disable it if you prefer.",
  ),
];

class AccordionPage extends StatefulWidget {
  const AccordionPage({super.key});

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
  var type = DSAccordionVariant.single;
  var underlineTitle = true;

  @override
  Widget build(BuildContext context) {
    final children = details.map(
      (detail) {
        return DSAccordionItem(
          value: detail,
          title: Text(detail.title),
          underlineTitleOnHover: underlineTitle,
          child: Text(detail.content),
        );
      },
    );
    return BaseScaffold(
      appBarTitle: 'Accordion',
      editable: [
        MyEnumProperty(
          label: 'Type',
          value: type,
          values: DSAccordionVariant.values,
          onChanged: (value) {
            if (value != null) {
              setState(() => type = value);
            }
          },
        ),
        MyBoolProperty(
          label: 'Underline title',
          value: underlineTitle,
          onChanged: (v) => setState(() => underlineTitle = v),
        ),
      ],
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: type == DSAccordionVariant.single
              ? DSAccordion<({String content, String title})>(
                  children: children,
                )
              : DSAccordion<({String content, String title})>.multiple(
                  children: children,
                ),
        ),
      ],
    );
  }
}

```
