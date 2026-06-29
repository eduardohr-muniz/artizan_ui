import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsCardDotted extends StatelessWidget {
  const DsCardDotted({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Default', type: DsCardDotted)
Widget cardDottedDefault(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Adicionar seu endereço');
  final desc = context.knobs
      .string(label: 'Description', initialValue: 'Toque para buscar e selecionar no mapa');
  final tappable = context.knobs.boolean(label: 'Tappable', initialValue: true);

  return ScaffoldBase(
    maxWidth: 420,
    code: '''
DSCardDotted(
  onPressed: () {},
  leading: Icon(LucideIcons.mapPinPlus),
  title: Text('Adicionar seu endereço'),
  description: Text('Toque para buscar e selecionar no mapa'),
  trailing: Icon(LucideIcons.chevronRight),
)''',
    child: DSCardDotted(
      onPressed: tappable ? () {} : null,
      leading: const Icon(LucideIcons.mapPinPlus),
      title: Text(title),
      description: Text(desc),
      trailing: const Icon(LucideIcons.chevronRight),
    ),
  );
}

@widgetbook.UseCase(name: 'Address (Empty State)', type: DsCardDotted)
Widget cardDottedAddressEmpty(BuildContext context) {
  final cs = context.dsColors;
  return ScaffoldBase(
    maxWidth: 420,
    scrollable: true,
    code: r'''
DSCardDotted(
  onPressed: () {},
  borderColor: cs.success,
  backgroundColor: cs.success.withValues(alpha: 0.08),
  leading: Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: cs.background,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(LucideIcons.mapPinPlus, size: 20, color: cs.success),
  ),
  title: Text('Adicionar seu endereço'),
  description: Text('Toque para buscar e selecionar no mapa'),
  trailing: Icon(LucideIcons.chevronRight, size: 20, color: cs.success),
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Endereço do estabelecimento', style: context.dsTextTheme.label),
        const SizedBox(height: 12),
        DSCardDotted(
          onPressed: () {},
          borderColor: cs.success,
          backgroundColor: cs.success.withValues(alpha: 0.08),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cs.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(LucideIcons.mapPinPlus, size: 20, color: cs.success),
          ),
          title: const Text('Adicionar seu endereço'),
          description: const Text('Toque para buscar e selecionar no mapa'),
          trailing: Icon(LucideIcons.chevronRight, size: 20, color: cs.success),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Address (Filled)', type: DsCardDotted)
Widget cardDottedAddressFilled(BuildContext context) {
  final cs = context.dsColors;
  return ScaffoldBase(
    maxWidth: 420,
    scrollable: true,
    code: r'''
DSCardDotted(
  onPressed: () {},
  borderColor: cs.success,
  backgroundColor: cs.success.withValues(alpha: 0.08),
  leading: Container(...),               // ícone mapPin
  title: Text('Av. Paulista, 1578'),
  description: Text('Bela Vista · São Paulo · SP'),
  trailing: Icon(LucideIcons.chevronRight),
)''',
    child: DSCardDotted(
      onPressed: () {},
      borderColor: cs.success,
      backgroundColor: cs.success.withValues(alpha: 0.08),
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cs.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(LucideIcons.mapPin, size: 20, color: cs.success),
      ),
      title: const Text('Av. Paulista, 1578'),
      description: const Text('Bela Vista · São Paulo · SP'),
      trailing: Icon(LucideIcons.chevronRight, size: 20, color: cs.success),
    ),
  );
}
