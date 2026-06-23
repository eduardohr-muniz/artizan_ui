import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsSheet extends StatelessWidget {
  const DsSheet({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Invite Member', type: DsSheet)
Widget sheetInviteMember(BuildContext context) {
  return ScaffoldBase(
    code: '''
await showDSSheet(
  context: context,
  builder: (_) => DSSheet(
    title: Text('Invite team member'),
    description: Text('Send an invitation to collaborate.'),
    actions: [
      DSButton.outline(onPressed: () async {}, child: Text('Cancel')),
      DSButton(onPressed: () async {}, child: Text('Send invite')),
    ],
    child: Column(children: [
      DSTextFormField(label: Text('Full name'), placeholder: Text('Jane Doe')),
      SizedBox(height: 16),
      DSTextFormField(label: Text('Email address'), placeholder: Text('jane@company.com')),
    ]),
  ),
)''',
    child: DSButton(
      onPressed: () async {
        await showDSSheet(
          context: context,
          builder: (_) => const _InviteMemberSheet(),
        );
      },
      child: const Text('Invite Member'),
    ),
  );
}

@widgetbook.UseCase(name: 'Edit Profile', type: DsSheet)
Widget sheetEditProfile(BuildContext context) {
  return ScaffoldBase(
    code: '''
await showDSSheet(
  context: context,
  builder: (_) => DSSheet(
    title: Text('Edit profile'),
    description: Text('Update your personal information.'),
    actions: [
      DSButton.outline(onPressed: () async {}, child: Text('Discard')),
      DSButton(onPressed: () async {}, child: Text('Save changes')),
    ],
    child: DSTextFormField(label: Text('Name'), placeholder: Text('Jane Doe')),
  ),
)''',
    child: DSButton.outline(
      onPressed: () async {
        await showDSSheet(
          context: context,
          builder: (_) => const _EditProfileSheet(),
        );
      },
      child: const Text('Edit Profile'),
    ),
  );
}

// ─── Invite Member Sheet ──────────────────────────────────────────────────────

class _InviteMemberSheet extends StatefulWidget {
  const _InviteMemberSheet();

  @override
  State<_InviteMemberSheet> createState() => _InviteMemberSheetState();
}

class _InviteMemberSheetState extends State<_InviteMemberSheet> {
  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;
    return DSSheet(
      title: const Text('Invite team member'),
      description: const Text('Send an invitation to collaborate on this workspace.'),
      actions: [
        DSButton.outline(
          onPressed: () async => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        DSButton(
          onPressed: () async {
            await Future.delayed(const Duration(seconds: 1));
            if (context.mounted) Navigator.of(context).pop();
          },
          child: const Text('Send invite'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DSTextFormField(
            label: Text('Full name'),
            placeholder: Text('Jane Doe'),
          ),
          const SizedBox(height: 16),
          const DSTextFormField(
            label: Text('Email address'),
            placeholder: Text('jane@company.com'),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Role',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500, color: cs.foreground,),),
              const SizedBox(height: 6),
              DSSelect<String>(
                placeholder: const Text('Select a role...'),
                selectedOptionBuilder: (_, v) => Text(v),
                options: const [
                  DSOption(value: 'Admin', child: Text('Admin')),
                  DSOption(value: 'Editor', child: Text('Editor')),
                  DSOption(value: 'Viewer', child: Text('Viewer')),
                ],
                onChanged: (_) {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cs.muted,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(LucideIcons.info, size: 14, color: cs.mutedForeground),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'An email with a join link will be sent to the address above.',
                    style: TextStyle(fontSize: 13, color: cs.mutedForeground),
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

// ─── Edit Profile Sheet ───────────────────────────────────────────────────────

class _EditProfileSheet extends StatelessWidget {
  const _EditProfileSheet();

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;
    return DSSheet(
      title: const Text('Edit profile'),
      description: const Text('Update your personal information and preferences.'),
      actions: [
        DSButton.outline(
          onPressed: () async => Navigator.of(context).pop(),
          child: const Text('Discard'),
        ),
        DSButton(
          onPressed: () async {
            await Future.delayed(const Duration(seconds: 1));
            if (context.mounted) Navigator.of(context).pop();
          },
          child: const Text('Save changes'),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: cs.primary,
                child: Text('JD',
                    style: TextStyle(
                        color: cs.primaryForeground, fontWeight: FontWeight.w600,),),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSButton.outline(
                      onPressed: () async {}, child: const Text('Change avatar'),),
                  const SizedBox(height: 4),
                  Text('JPG, PNG up to 2 MB',
                      style: TextStyle(fontSize: 12, color: cs.mutedForeground),),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                  child: DSTextFormField(
                      label: Text('First name'), placeholder: Text('Jane'),),),
              SizedBox(width: 12),
              Expanded(
                  child: DSTextFormField(
                      label: Text('Last name'), placeholder: Text('Doe'),),),
            ],
          ),
          const SizedBox(height: 16),
          const DSTextFormField(
            label: Text('Email'),
            placeholder: Text('jane@company.com'),
          ),
          const SizedBox(height: 16),
          const DSTextFormField(
            label: Text('Bio'),
            placeholder: Text('Tell us a little about yourself...'),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
