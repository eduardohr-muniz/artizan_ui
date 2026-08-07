import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsAlert extends StatelessWidget {
  const DsAlert({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'All Variants', type: DsAlert)
Widget alertAllVariants(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Heads up!');
  final desc = context.knobs.string(
      label: 'Description',
      initialValue: 'You can add components to your app using the CLI.',);
  final showTitle = context.knobs.boolean(label: 'Show title', initialValue: true);

  Widget row(String name, Widget w) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
              color: context.dsColors.mutedForeground,
            ),
          ),
          const SizedBox(height: 6),
          w,
          const SizedBox(height: 16),
        ],
      );

  return ScaffoldBase(
    scrollable: true,
    code: '''
DSAlert.info(title: Text('Heads up!'), description: Text('...'))
DSAlert.success(title: Text('Changes saved'), description: Text('...'))
DSAlert.warning(title: Text('Action required'), description: Text('...'))
DSAlert.destructive(title: Text('Something went wrong'), description: Text('...'))
DSAlert.muted(description: Text('An email will be sent to the address above.'))''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row('Info',
            DSAlert.info(title: showTitle ? Text(title) : null, description: Text(desc)),),
        row(
            'Success',
            DSAlert.success(
                title: showTitle ? Text(title) : null, description: Text(desc),),),
        row(
            'Warning',
            DSAlert.warning(
                title: showTitle ? Text(title) : null, description: Text(desc),),),
        row(
            'Destructive',
            DSAlert.destructive(
                title: showTitle ? Text(title) : null, description: Text(desc),),),
        row(
            'Muted',
            DSAlert.muted(
                title: showTitle ? Text(title) : null, description: Text(desc),),),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Info', type: DsAlert)
Widget alertInfo(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Heads up!');
  final desc = context.knobs.string(
      label: 'Description',
      initialValue: 'You can add components to your app using the CLI.',);
  final showTitle = context.knobs.boolean(label: 'Show title', initialValue: true);

  return ScaffoldBase(
    code: '''
DSAlert.info(
  title: Text('Heads up!'),
  description: Text('You can add components using the CLI.'),
)''',
    child: DSAlert.info(
      title: showTitle ? Text(title) : null,
      description: Text(desc),
    ),
  );
}

@widgetbook.UseCase(name: 'Success', type: DsAlert)
Widget alertSuccess(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Changes saved');
  final desc = context.knobs.string(
      label: 'Description',
      initialValue: 'Your settings have been updated successfully.',);
  final showTitle = context.knobs.boolean(label: 'Show title', initialValue: true);

  return ScaffoldBase(
    code: '''
DSAlert.success(
  title: Text('Changes saved'),
  description: Text('Your settings have been updated successfully.'),
)''',
    child: DSAlert.success(
      title: showTitle ? Text(title) : null,
      description: Text(desc),
    ),
  );
}

@widgetbook.UseCase(name: 'Warning', type: DsAlert)
Widget alertWarning(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Action required');
  final desc = context.knobs.string(
      label: 'Description', initialValue: 'Your session will expire in 5 minutes.',);
  final showTitle = context.knobs.boolean(label: 'Show title', initialValue: true);

  return ScaffoldBase(
    code: '''
DSAlert.warning(
  title: Text('Action required'),
  description: Text('Your session will expire in 5 minutes.'),
)''',
    child: DSAlert.warning(
      title: showTitle ? Text(title) : null,
      description: Text(desc),
    ),
  );
}

@widgetbook.UseCase(name: 'Destructive', type: DsAlert)
Widget alertDestructive(BuildContext context) {
  final title =
      context.knobs.string(label: 'Title', initialValue: 'Something went wrong');
  final desc = context.knobs.string(
      label: 'Description',
      initialValue: 'Unable to process your request. Please try again.',);
  final showTitle = context.knobs.boolean(label: 'Show title', initialValue: true);

  return ScaffoldBase(
    code: '''
DSAlert.destructive(
  title: Text('Something went wrong'),
  description: Text('Unable to process your request. Please try again.'),
)''',
    child: DSAlert.destructive(
      title: showTitle ? Text(title) : null,
      description: Text(desc),
    ),
  );
}

@widgetbook.UseCase(name: 'Muted', type: DsAlert)
Widget alertMuted(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Note');
  final desc = context.knobs.string(
      label: 'Description',
      initialValue: 'An email with a join link will be sent to the address above.',);
  final showTitle = context.knobs.boolean(label: 'Show title');

  return ScaffoldBase(
    code: '''
DSAlert.muted(
  description: Text('An email with a join link will be sent to the address above.'),
)''',
    child: DSAlert.muted(
      title: showTitle ? Text(title) : null,
      description: Text(desc),
    ),
  );
}
