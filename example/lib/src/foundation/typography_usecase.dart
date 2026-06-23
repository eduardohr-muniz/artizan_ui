import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../widgets/scaffold_base.dart';

// ─── Marker class ─────────────────────────────────────────────────────────────

/// Marker class used by @widgetbook.UseCase — not rendered directly.
/// Named `DSTypography` to avoid conflict with Flutter's built-in [Typography].
class DSTypography extends StatelessWidget {
  const DSTypography({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

// ─── Shared constants ─────────────────────────────────────────────────────────

const _sampleLong = 'The quick brown fox jumps over the lazy dog';
const _sampleParagraph =
    'Hamburgefons — the classic pangram used by typographers to preview typefaces at a glance.';
const _sampleCaption = 'Last updated 3 min ago · v1.2.0';

// ─── Internal widgets ─────────────────────────────────────────────────────────

class _GroupHeader extends StatelessWidget {
  const _GroupHeader(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: cs.mutedForeground,
        ),
      ),
    );
  }
}

class _TypeRow extends StatelessWidget {
  const _TypeRow({
    required this.token,
    required this.style,
    required this.sample,
    this.isLast = false,
    this.muted = false,
  });

  final String token;
  final TextStyle style;
  final String sample;
  final bool isLast;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;
    final size = style.fontSize?.toStringAsFixed(0) ?? '—';
    final weight = _weightLabel(style.fontWeight);
    final ls = (style.letterSpacing != null && style.letterSpacing != 0)
        ? ' · ls ${style.letterSpacing!.toStringAsFixed(2)}'
        : '';
    final sampleColor = muted ? cs.mutedForeground : cs.foreground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    token,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                      color: cs.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$size px · $weight$ls',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: cs.mutedForeground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                sample,
                style: style.copyWith(color: sampleColor),
              ),
            ],
          ),
        ),
        if (!isLast) Divider(height: 1, thickness: 1, color: cs.border),
      ],
    );
  }

  static String _weightLabel(FontWeight? w) => switch (w) {
        FontWeight.w300 => 'Light 300',
        FontWeight.w400 => 'Regular 400',
        FontWeight.w500 => 'Medium 500',
        FontWeight.w600 => 'Semibold 600',
        FontWeight.w700 => 'Bold 700',
        FontWeight.w800 => 'Extrabold 800',
        _ => w?.toString() ?? '—',
      };
}

// ─── Use cases ─────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'All Tokens', type: DSTypography)
Widget typeScaleAll(BuildContext context) {
  final t = context.dsTextTheme;

  final displayRows = [
    ('displayLarge', t.displayLarge, 'Display Large', false),
    ('displaySmall', t.displaySmall, 'Display Small', false),
  ];
  final titleRows = [
    ('titleLarge', t.titleLarge, 'Screen Title', false),
    ('title', t.title, 'Panel Heading', false),
    ('titleSmall', t.titleSmall, 'Section Heading', false),
  ];
  final bodyRows = [
    ('bodyLarge', t.bodyLarge, _sampleLong, false),
    ('body', t.body, _sampleLong, false),
    ('bodySmall', t.bodySmall, _sampleParagraph, false),
    ('bodyMuted', t.body, _sampleLong, true),
    ('bodySmallMuted', t.bodySmall, _sampleParagraph, true),
  ];
  final labelRows = [
    ('labelLarge', t.labelLarge, 'Button Label / Tab', false),
    ('label', t.label, 'Chip · Badge', false),
    ('labelSmall', t.labelSmall, 'STATUS TAG', false),
  ];

  final captionRows = [
    ('caption', t.caption, _sampleCaption, false),
    ('captionMuted', t.caption, _sampleCaption, true),
  ];

  Widget buildGroup(String header, List<(String, TextStyle, String, bool)> rows) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GroupHeader(header),
          for (var i = 0; i < rows.length; i++)
            _TypeRow(
              token: rows[i].$1,
              style: rows[i].$2,
              sample: rows[i].$3,
              muted: rows[i].$4,
              isLast: i == rows.length - 1,
            ),
          const SizedBox(height: 16),
        ],
      );

  return ScaffoldBase(
    scrollable: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildGroup('Display', displayRows),
        buildGroup('Title', titleRows),
        buildGroup('Body', bodyRows),
        buildGroup('Label', labelRows),
        buildGroup('Caption', captionRows),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Display', type: DSTypography)
Widget typeScaleDisplay(BuildContext context) {
  final t = context.dsTextTheme;
  final rows = [
    ('displayLarge', t.displayLarge, 'Display Large'),
    ('displaySmall', t.displaySmall, 'Display Small'),
  ];
  return ScaffoldBase(
    scrollable: true,
    // dart format off
    code: '''
Text('Hero Text', style: context.dsTextTheme.displayLarge)
Text('Modal Title', style: context.dsTextTheme.displaySmall)
''',
    // dart format on
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _GroupHeader('Display'),
        for (var i = 0; i < rows.length; i++)
          _TypeRow(
            token: rows[i].$1,
            style: rows[i].$2,
            sample: rows[i].$3,
            isLast: i == rows.length - 1,
          ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Title', type: DSTypography)
Widget typeScaleTitle(BuildContext context) {
  final t = context.dsTextTheme;
  final rows = [
    ('titleLarge', t.titleLarge, 'Screen Title'),
    ('title', t.title, 'Panel Heading'),
    ('titleSmall', t.titleSmall, 'Section Heading'),
  ];
  return ScaffoldBase(
    scrollable: true,
    // dart format off
    code: '''
Text('Page Title', style: context.dsTextTheme.titleLarge)
Text('Card Title', style: context.dsTextTheme.title)
Text('Section Header', style: context.dsTextTheme.titleSmall)
''',
    // dart format on
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _GroupHeader('Title'),
        for (var i = 0; i < rows.length; i++)
          _TypeRow(
            token: rows[i].$1,
            style: rows[i].$2,
            sample: rows[i].$3,
            isLast: i == rows.length - 1,
          ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Body', type: DSTypography)
Widget typeScaleBody(BuildContext context) {
  final t = context.dsTextTheme;
  final rows = [
    ('bodyLarge', t.bodyLarge, _sampleLong, false),
    ('body', t.body, _sampleLong, false),
    ('bodySmall', t.bodySmall, _sampleParagraph, false),
    ('bodyMuted', t.body, _sampleLong, true),
    ('bodySmallMuted', t.bodySmall, _sampleParagraph, true),
  ];
  return ScaffoldBase(
    scrollable: true,
    // dart format off
    code: '''
Text('Primary text', style: context.dsTextTheme.bodyLarge)
Text('Default text', style: context.dsTextTheme.body)
Text('Helper text', style: context.dsTextTheme.bodySmall)

// muted variants
Text(
  'Secondary info',
  style: context.dsTextTheme.body.copyWith(
    color: context.dsColors.mutedForeground,
  ),
)
Text(
  'Timestamp',
  style: context.dsTextTheme.bodySmall.copyWith(
    color: context.dsColors.mutedForeground,
  ),
)
''',
    // dart format on
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _GroupHeader('Body'),
        for (var i = 0; i < rows.length; i++)
          _TypeRow(
            token: rows[i].$1,
            style: rows[i].$2,
            sample: rows[i].$3,
            muted: rows[i].$4,
            isLast: i == rows.length - 1,
          ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Caption', type: DSTypography)
Widget typeScaleCaption(BuildContext context) {
  final t = context.dsTextTheme;
  final rows = [
    ('caption', t.caption, _sampleCaption, false),
    ('captionMuted', t.caption, _sampleCaption, true),
  ];
  return ScaffoldBase(
    scrollable: true,
    // dart format off
    code: '''
Text('Last updated 3 min ago', style: context.dsTextTheme.caption)

// muted variant
Text(
  'Last updated 3 min ago',
  style: context.dsTextTheme.caption.copyWith(
    color: context.dsColors.mutedForeground,
  ),
)
''',
    // dart format on
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _GroupHeader('Caption'),
        for (var i = 0; i < rows.length; i++)
          _TypeRow(
            token: rows[i].$1,
            style: rows[i].$2,
            sample: rows[i].$3,
            muted: rows[i].$4,
            isLast: i == rows.length - 1,
          ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Label', type: DSTypography)
Widget typeScaleLabel(BuildContext context) {
  final t = context.dsTextTheme;
  final rows = [
    ('labelLarge', t.labelLarge, 'Button Label / Tab', false),
    ('label', t.label, 'Chip · Badge', false),
    ('labelSmall', t.labelSmall, 'STATUS TAG', false),
  ];
  return ScaffoldBase(
    scrollable: true,
    // dart format off
    code: '''
Text('Submit', style: context.dsTextTheme.labelLarge)
Text('New', style: context.dsTextTheme.label)
Text('DRAFT', style: context.dsTextTheme.labelSmall)
''',
    // dart format on
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _GroupHeader('Label'),
        for (var i = 0; i < rows.length; i++)
          _TypeRow(
            token: rows[i].$1,
            style: rows[i].$2,
            sample: rows[i].$3,
            muted: rows[i].$4,
            isLast: i == rows.length - 1,
          ),
      ],
    ),
  );
}
