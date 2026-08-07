# Range Slider

An input where the user selects a range (two values) from within a given range. Mirrors the appearance of `DSSlider`/`ShadSlider` (8px track, 20px thumbs with a `background` fill and a 2px `primary` ring), since shadcn has no native range slider.

Controlled: pass `values` and update them in `onChanged` (like the Material `RangeSlider`). Use `divisions` for discrete steps.

```dart
DSRangeSlider(
  values: RangeValues(20, 70),
  min: 0,
  max: 100,
  onChanged: (value) {},
),
```

## Example
```dart
import 'package:example/common/base_scaffold.dart';
import 'package:example/common/properties/bool_property.dart';
import 'package:example/common/properties/string_property.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:dependencies/dependencies.dart';

class RangeSliderPage extends StatefulWidget {
  const RangeSliderPage({super.key});

  @override
  State<RangeSliderPage> createState() => _RangeSliderPageState();
}

class _RangeSliderPageState extends State<RangeSliderPage> {
  var enabled = true;
  RangeValues values = const RangeValues(20, 70);
  int? divisions;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Range Slider',
      editable: [
        MyBoolProperty(
          label: 'Enabled',
          value: enabled,
          onChanged: (value) => setState(() => enabled = value),
        ),
        MyStringProperty(
          label: 'Divisions',
          initialValue: divisions?.toString() ?? '',
          onChanged: (v) {
            setState(() {
              divisions = int.tryParse(v);
            });
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
      children: [
        DSRangeSlider(
          values: values,
          min: 0,
          max: 100,
          enabled: enabled,
          divisions: divisions,
          labels: RangeLabels(
            '${values.start.round()}',
            '${values.end.round()}',
          ),
          onChanged: (value) => setState(() => values = value),
        ),
      ],
    );
  }
}

```
