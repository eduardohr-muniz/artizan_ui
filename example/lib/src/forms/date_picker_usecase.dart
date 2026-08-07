import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

class DsDatePicker extends StatelessWidget {
  const DsDatePicker({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class DsInputOtp extends StatelessWidget {
  const DsInputOtp({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

@widgetbook.UseCase(name: 'Single', type: DsDatePicker)
Widget datePickerSingle(BuildContext context) {
  return ScaffoldBase(
    scrollable: true,
    code: r'''
DSDatePicker(
  selected: DateTime.now(),
  onChanged: (date) {},
  formatDate: (d) => '${d.day}/${d.month}/${d.year}',
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSDatePicker(
          selected: DateTime.now(),
          onChanged: (_) {},
          formatDate: (d) => '${d.day}/${d.month}/${d.year}',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Range', type: DsDatePicker)
Widget datePickerRange(BuildContext context) {
  return ScaffoldBase(
    scrollable: true,
    code: r'''
DSDatePicker.range(
  onChanged: (range) {},
  formatDateRange: (r) => '${r.start} – ${r.end}',
)''',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSDatePicker.range(
          onChanged: (_) {},
          formatDateRange: (r) {
            final s = r.start;
            final e = r.end;
            if (s == null || e == null) return '';
            return '${s.day}/${s.month}/${s.year} – ${e.day}/${e.month}/${e.year}';
          },
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'OTP Input', type: DsInputOtp)
Widget otpInput(BuildContext context) {
  final cs = context.dsColors;
  return ScaffoldBase(
    code: '''
DSInputOtp(
  maxLength: 6,
  onChanged: (value) {},
  children: [
    DSInputOtpGroup(children: [
      DSInputOtpSlot(),
      DSInputOtpSlot(),
      DSInputOtpSlot(),
    ]),
    Text('·'),
    DSInputOtpGroup(children: [
      DSInputOtpSlot(),
      DSInputOtpSlot(),
      DSInputOtpSlot(),
    ]),
  ],
)''',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Verification code',
          style:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: cs.foreground),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter the 6-digit code sent to your phone.',
          style: TextStyle(fontSize: 14, color: cs.mutedForeground),
        ),
        const SizedBox(height: 24),
        DSInputOtp(
          maxLength: 6,
          onChanged: (_) {},
          children: [
            DSInputOtpGroup(
              children: [
                const DSInputOtpSlot(),
                const DSInputOtpSlot(),
                const DSInputOtpSlot(),
              ],
            ),
            const Text('·'),
            DSInputOtpGroup(
              children: [
                const DSInputOtpSlot(),
                const DSInputOtpSlot(),
                const DSInputOtpSlot(),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        DSButton(onPressed: () async {}, child: const Text('Verify')),
      ],
    ),
  );
}
