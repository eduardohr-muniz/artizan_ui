# LoaderOnButton

A utility widget that swaps a button's child for a small circular progress indicator while an async operation is in progress. The child is kept mounted (invisible) so the button does not resize during the loading state.

> **Note:** `DSButton` handles loading state automatically when `onPressed` returns a `Future`. Use `DSLoardOnButton` only when you need manual control — e.g. inside a custom button widget or when the loading state is driven by external state.

## Basic usage

```dart
DSLoardOnButton(
  visibility: isLoading,   // true = show spinner, false = show child
  color: Colors.white,     // spinner color
  child: const Text('Save'),
)
```

## API

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `child` | `Widget` | The normal button content |
| `visibility` | `bool` | `true` shows the spinner; `false` shows `child` |
| `color` | `Color` | Color of the `CircularProgressIndicator` |

## Example

```dart
import 'package:flutter/material.dart';
import 'package:artizan_ui/artizan_ui.dart';

class LoaderOnButtonDemo extends StatefulWidget {
  const LoaderOnButtonDemo({super.key});

  @override
  State<LoaderOnButtonDemo> createState() => _LoaderOnButtonDemoState();
}

class _LoaderOnButtonDemoState extends State<LoaderOnButtonDemo> {
  bool _loading = false;

  Future<void> _submit() async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _loading ? null : _submit,
      child: DSLoardOnButton(
        visibility: _loading,
        color: Colors.white,
        child: const Text('Submit'),
      ),
    );
  }
}
```
