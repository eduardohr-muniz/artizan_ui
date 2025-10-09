import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'FormField', type: ArtTextFormField)
Widget emptyStateInTable(BuildContext context) {
  return FormField();
}

class CpfCnpjFormController extends FormController {
  @override
  List<String> get formaters => [
        '###.###.###-##',
        '##.###.###/####-##',
      ];

  @override
  String? Function(String? value)? get validator => (value) {
        if (value == null || value.isEmpty) return 'Campo obrigatório';
        if (value.length != 14) return 'CPF/CNPJ inválido';
        return null;
      };

  RegExp get regex => RegExp(r'^[0-9]$');
}

class FormField extends StatefulWidget {
  const FormField({super.key});

  @override
  State<FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<FormField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cpfCnpjEC = TextEditingController(
    text: '12973643686',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ArtTextFormField(
                formController: CpfCnpjFormController(),
                label: Text('CPF/CNPJ'),
                controller: cpfCnpjEC,
              ),
              SizedBox(height: 16),
              ArtButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Formulário válido');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
