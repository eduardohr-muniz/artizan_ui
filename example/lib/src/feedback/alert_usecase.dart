import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class DsAlert extends StatelessWidget {
  const DsAlert({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

Widget _page(BuildContext context, Widget child) {
  final cs = context.dsColors;
  return Scaffold(
    backgroundColor: cs.background,
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: child,
    ),
  );
}

@widgetbook.UseCase(name: 'All Variants', type: DsAlert)
Widget alertAllVariants(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Heads up!');
  final desc = context.knobs.string(label: 'Description', initialValue: 'You can add components to your app using the CLI.');
  final showIcon = context.knobs.boolean(label: 'Show icon', initialValue: true);

  Widget alert(String name, Widget w) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                  letterSpacing: 0.4, color: context.dsColors.mutedForeground)),
          const SizedBox(height: 6),
          w,
          const SizedBox(height: 16),
        ],
      );

  return _page(
    context,
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        alert('Default', DSAlert.info(
          title: Text(title),
          description: Text(desc),
          icon: showIcon ? const Icon(LucideIcons.info) : null,
        )),
        alert('Success', DSAlert.success(
          title: Text(title),
          description: Text(desc),
          icon: showIcon ? const Icon(LucideIcons.circleCheck) : null,
        )),
        alert('Warning', DSAlert.warning(
          title: Text(title),
          description: Text(desc),
          icon: showIcon ? const Icon(LucideIcons.triangleAlert) : null,
        )),
        alert('Destructive', DSAlert.destructive(
          title: Text(title),
          description: Text(desc),
          icon: showIcon ? const Icon(LucideIcons.circleX) : null,
        )),
        alert('Info', DSAlert.info(
          title: Text(title),
          description: Text(desc),
          icon: showIcon ? const Icon(LucideIcons.info) : null,
        )),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Success', type: DsAlert)
Widget alertSuccess(BuildContext context) {
  return _page(context, DSAlert.success(
    title: const Text('Changes saved'),
    description: const Text('Your settings have been updated successfully.'),
    icon: const Icon(LucideIcons.circleCheck),
  ));
}

@widgetbook.UseCase(name: 'Warning', type: DsAlert)
Widget alertWarning(BuildContext context) {
  return _page(context, DSAlert.warning(
    title: const Text('Action required'),
    description: const Text('Your session will expire in 5 minutes.'),
    icon: const Icon(LucideIcons.triangleAlert),
  ));
}

@widgetbook.UseCase(name: 'Destructive', type: DsAlert)
Widget alertDestructive(BuildContext context) {
  return _page(context, DSAlert.destructive(
    title: const Text('Something went wrong'),
    description: const Text('Unable to process your request. Please try again.'),
    icon: const Icon(LucideIcons.circleX),
  ));
}
