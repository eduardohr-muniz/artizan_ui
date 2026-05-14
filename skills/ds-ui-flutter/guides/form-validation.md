# Form Validation

`artizan_ui` re-exports `auto_form_validate`, which provides a controller-based approach to form validation, input masking, and auto-focus-on-error. It works alongside Flutter's standard `Form` + `GlobalKey<FormState>`.

## Two controller types

| Controller | Use for |
| :--- | :--- |
| `FormController` | Text inputs (`DSTextFormField`) |
| `CustomFormController<T>` | Any other widget — selects, checkboxes, date pickers |

---

## FormController (text fields)

Extend `FormController` to declare validation rules and input formatting for a text field.

```dart
class EmailController extends FormController {
  @override
  String? Function(String? value)? get validator => (value) {
    if (FormController.isEmpty(value)) return 'Campo obrigatório';
    if (!value!.contains('@')) return 'E-mail inválido';
    return null;
  };

  @override
  TextInputType? get textInputType => TextInputType.emailAddress;
}
```

Pass it to `DSTextFormField` via `formController`:

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      DSTextFormField(
        label: const Text('E-mail'),
        formController: EmailController(),
      ),
      DSButton(
        child: const Text('Salvar'),
        onPressed: () => _formKey.currentState!.validate(),
      ),
    ],
  ),
)
```

---

## Input masking

Define masks in `formaters` using `#` as the digit placeholder:

```dart
class PhoneController extends FormController {
  @override
  List<String> get formaters => ['(##) ####-####'];

  @override
  TextInputType? get textInputType => TextInputType.phone;

  @override
  String? Function(String? value)? get validator => (value) {
    if (FormController.isEmpty(value)) return 'Campo obrigatório';
    return null;
  };
}
```

### Multiple masks (e.g. CPF/CNPJ)

When the mask length depends on the input, list masks in order — the controller switches automatically:

```dart
class CpfCnpjController extends FormController {
  @override
  List<String> get formaters => [
    '###.###.###-##',    // CPF  — 11 digits
    '##.###.###/####-##', // CNPJ — 14 digits
  ];

  @override
  String? Function(String? value)? get validator => (value) {
    if (FormController.isEmpty(value)) return 'Campo obrigatório';
    return null;
  };
}
```

> **Required:** when using multiple masks a `TextEditingController` must be passed to `DSTextFormField`.

```dart
final _cpfCnpjEC = TextEditingController();

DSTextFormField(
  controller: _cpfCnpjEC,
  formController: CpfCnpjController(),
  label: const Text('CPF / CNPJ'),
)
```

### Character filter

Override `regexFilter` to restrict which characters are accepted:

```dart
@override
RegExp get regexFilter => RegExp(r'[0-9]'); // numbers only
```

---

## CustomFormController (non-text widgets)

Use `CustomFormController<T>` for dropdowns, selects, date pickers, checkboxes — any field that isn't a text input.

```dart
class StatusController extends CustomFormController<String?> {
  @override
  String? Function(String? value)? get validator => (value) {
    if (value == null) return 'Selecione um status';
    return null;
  };
}
```

Wrap the widget with `AutoFormFieldWrapper`:

```dart
String? _status;

AutoFormFieldWrapper<String?>(
  formController: StatusController(),
  builder: (field, didChange) => DSSelect<String>(
    value: _status,
    options: ['Ativo', 'Inativo'],
    onChanged: (v) {
      setState(() => _status = v);
      didChange(v); // required — notifies the FormField
    },
  ),
)
```

`AutoFormFieldWrapper` renders the error message below the widget automatically, matching the app's `InputDecorationTheme` style.

---

## Auto-focus on first error

This is the main value of the package: when a form is validated and multiple fields have errors, the package automatically moves focus to the **first** field that failed. No setup required — if you don't pass a `FocusNode`, the package creates one internally per controller and manages it for you.

The only thing needed before calling `validate()` is `resetErrorTracking()` on each controller — this clears the error list from the previous submit so the focus chain is accurate:

```dart
final _nameController  = NameController();
final _emailController = EmailController();

void _submit() {
  _nameController.resetErrorTracking();
  _emailController.resetErrorTracking();
  _formKey.currentState!.validate();
}
```

Pass your own `FocusNode` only if you need external control over focus (e.g. `FocusScope.of(context).requestFocus(myNode)`).

---

## Complete example

```dart
import 'package:flutter/material.dart';
import 'package:ds_ui/ds_ui.dart';

// Controllers
class NameController extends FormController {
  @override
  String? Function(String? value)? get validator => (value) =>
      FormController.isEmpty(value) ? 'Nome obrigatório' : null;
}

class PhoneController extends FormController {
  @override
  List<String> get formaters => ['(##) #####-####'];

  @override
  TextInputType? get textInputType => TextInputType.phone;

  @override
  String? Function(String? value)? get validator => (value) =>
      FormController.isEmpty(value) ? 'Telefone obrigatório' : null;
}

// Page
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey   = GlobalKey<FormState>();
  final _nameCtrl  = NameController();
  final _phoneCtrl = PhoneController();
  final _phoneEC   = TextEditingController(); // required — multiple masks

  void _submit() {
    _nameCtrl.resetErrorTracking();
    _phoneCtrl.resetErrorTracking();
    if (_formKey.currentState!.validate()) {
      // form valid — proceed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DSTextFormField(
                label: const Text('Nome'),
                formController: _nameCtrl,
                // FocusNode optional — package creates one automatically
              ),
              const SizedBox(height: 12),
              DSTextFormField(
                label: const Text('Telefone'),
                formController: _phoneCtrl,
                controller: _phoneEC,
              ),
              const SizedBox(height: 24),
              DSButton(
                onPressed: _submit,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## API reference

### `FormController`

| Member | Type | Description |
| :--- | :--- | :--- |
| `validator` | `String? Function(String?)?` | Returns error string or `null` |
| `regexFilter` | `RegExp` | Allowed characters (default: any) |
| `formaters` | `List<String>` | Input masks using `#` as digit placeholder |
| `textInputType` | `TextInputType?` | Keyboard type |
| `customFormatters` | `List<TextInputFormatter>` | Raw Flutter formatters (overrides `formaters`) |
| `FormController.isEmpty(v)` | `static bool` | `true` if value is null or whitespace-only |
| `resetErrorTracking()` | extension | Clears the auto-focus error chain |

### `CustomFormController<T>`

| Member | Type | Description |
| :--- | :--- | :--- |
| `validator` | `String? Function(T?)?` | Returns error string or `null` |
| `resetErrorTracking()` | extension | Clears the auto-focus error chain |

### `AutoFormFieldWrapper<T>`

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `formController` | `CustomFormController<T>?` | Validation controller |
| `builder` | `Widget Function(field, didChange)` | Builds the wrapped widget |
| `focusNode` | `FocusNode?` | For auto-focus-on-error |
| `initialValue` | `T?` | Initial field value |
| `errorWidget` | `Widget Function(String)?` | Custom error widget |
| `autovalidateMode` | `AutovalidateMode?` | When to auto-validate |
