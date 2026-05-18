import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsTextField extends StatelessWidget {
  const DsTextField({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Default', type: DsTextField)
Widget textFieldDefault(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Email');
  final placeholder = context.knobs.string(label: 'Placeholder', initialValue: 'Enter your email');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final obscure = context.knobs.boolean(label: 'Password field', initialValue: false);

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSTextFormField(
  label: Text('Email'),
  placeholder: Text('Enter your email'),
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSTextFormField(
          label: Text(label),
          placeholder: Text(placeholder),
          enabled: enabled,
          obscureText: obscure,
        ),
        const SizedBox(height: 24),
        DSTextFormField(
          label: const Text('With error'),
          placeholder: const Text('Type something...'),
          initialValue: 'invalid@',
          validator: (v) => (v != null && v.contains('@') && !v.endsWith('@'))
              ? null
              : 'Enter a valid email address',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Underline', type: DsTextField)
Widget textFieldUnderline(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Search');
  final placeholder = context.knobs.string(label: 'Placeholder', initialValue: 'Search...');

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSTextFormField.underline(
  label: Text('Search'),
  placeholder: Text('Search...'),
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSTextFormField.underline(
          label: Text(label),
          placeholder: Text(placeholder),
        ),
        const SizedBox(height: 24),
        DSTextFormField.underline(
          label: const Text('With leading icon'),
          placeholder: const Text('Search products...'),
          leading: const Icon(LucideIcons.search, size: 16),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Form', type: DsTextField)
Widget textFieldForm(BuildContext context) {
  final cs = context.dsColors;
  return ScaffoldBase(
    scrollable: true,
    code: '''
DSTextFormField(label: Text('Name'), placeholder: Text('João Silva'))
DSTextFormField(label: Text('Email'), placeholder: Text('joao@email.com'))
DSTextFormField(
  label: Text('Password'),
  placeholder: Text('••••••••'),
  obscureText: true,
)
DSButton(onPressed: () async {}, child: Text('Create account'))''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Sign up', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: cs.foreground)),
        const SizedBox(height: 4),
        Text('Create your account', style: TextStyle(fontSize: 14, color: cs.mutedForeground)),
        const SizedBox(height: 24),
        const DSTextFormField(label: Text('Name'), placeholder: Text('João Silva')),
        const SizedBox(height: 16),
        const DSTextFormField(label: Text('Email'), placeholder: Text('joao@email.com')),
        const SizedBox(height: 16),
        const DSTextFormField(label: Text('Password'), placeholder: Text('••••••••'), obscureText: true),
        const SizedBox(height: 24),
        DSButton(onPressed: () async {}, child: const Text('Create account')),
      ],
    ),
  );
}
