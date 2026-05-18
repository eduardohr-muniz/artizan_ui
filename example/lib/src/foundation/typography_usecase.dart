import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// ─── Marker class ─────────────────────────────────────────────────────────────

/// Marker class used by @widgetbook.UseCase — not rendered directly.
/// Named `DsTypeScale` to avoid conflict with Flutter's built-in [Typography].
class DsTypeScale extends StatelessWidget {
  const DsTypeScale({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

// ─── Shared constants ─────────────────────────────────────────────────────────

const _sampleLong = 'The quick brown fox jumps over the lazy dog';
const _sampleParagraph =
    'Hamburgefons — the classic pangram used by typographers to preview typefaces at a glance.';

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
  });

  final String token;
  final TextStyle style;
  final String sample;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;
    final size = style.fontSize?.toStringAsFixed(0) ?? '—';
    final weight = _weightLabel(style.fontWeight);
    final ls = (style.letterSpacing != null && style.letterSpacing != 0)
        ? ' · ls ${style.letterSpacing!.toStringAsFixed(2)}'
        : '';

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
                style: style.copyWith(color: cs.foreground),
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

class _ScaffoldWrapper extends StatelessWidget {
  const _ScaffoldWrapper({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: cs.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

// ─── Use cases ─────────────────────────────────────────────────────────────────

@widgetbook.UseCase(name: 'All Tokens', type: DsTypeScale)
Widget typeScaleAll(BuildContext context) {
  final t = DSTheme.of(context).textTheme;

  final groups = [
    (
      'Display',
      [
        ('displayLarge', t.displayLarge, 'Display Large'),
        ('displaySmall', t.displaySmall, 'Display Small'),
      ],
    ),
    (
      'Title',
      [
        ('titleLarge', t.titleLarge, 'Screen Title'),
        ('titleMedium', t.titleMedium, 'Panel Heading'),
        ('titleSmall', t.titleSmall, 'Section Heading'),
      ],
    ),
    (
      'Body',
      [
        ('bodyLarge', t.bodyLarge, _sampleLong),
        ('bodyMedium', t.bodyMedium, _sampleLong),
        ('bodySmall', t.bodySmall, _sampleParagraph),
      ],
    ),
    (
      'Label',
      [
        ('labelLarge', t.labelLarge, 'Button Label / Tab'),
        ('labelMedium', t.labelMedium, 'Chip · Badge'),
        ('labelSmall', t.labelSmall, 'STATUS TAG'),
      ],
    ),
  ];

  return _ScaffoldWrapper(
    children: [
      for (final group in groups) ...[
        _GroupHeader(group.$1),
        for (var i = 0; i < group.$2.length; i++)
          _TypeRow(
            token: group.$2[i].$1,
            style: group.$2[i].$2,
            sample: group.$2[i].$3,
            isLast: i == group.$2.length - 1,
          ),
        const SizedBox(height: 16),
      ],
    ],
  );
}

@widgetbook.UseCase(name: 'Display', type: DsTypeScale)
Widget typeScaleDisplay(BuildContext context) {
  final t = DSTheme.of(context).textTheme;
  final rows = [
    ('displayLarge', t.displayLarge, 'Display Large'),
    ('displaySmall', t.displaySmall, 'Display Small'),
  ];
  return _ScaffoldWrapper(
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
  );
}

@widgetbook.UseCase(name: 'Title', type: DsTypeScale)
Widget typeScaleTitle(BuildContext context) {
  final t = DSTheme.of(context).textTheme;
  final rows = [
    ('titleLarge', t.titleLarge, 'Screen Title'),
    ('titleMedium', t.titleMedium, 'Panel Heading'),
    ('titleSmall', t.titleSmall, 'Section Heading'),
  ];
  return _ScaffoldWrapper(
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
  );
}

@widgetbook.UseCase(name: 'Body', type: DsTypeScale)
Widget typeScaleBody(BuildContext context) {
  final t = DSTheme.of(context).textTheme;
  final rows = [
    ('bodyLarge', t.bodyLarge, _sampleLong),
    ('bodyMedium', t.bodyMedium, _sampleLong),
    ('bodySmall', t.bodySmall, _sampleParagraph),
  ];
  return _ScaffoldWrapper(
    children: [
      const _GroupHeader('Body'),
      for (var i = 0; i < rows.length; i++)
        _TypeRow(
          token: rows[i].$1,
          style: rows[i].$2,
          sample: rows[i].$3,
          isLast: i == rows.length - 1,
        ),
    ],
  );
}

@widgetbook.UseCase(name: 'Label', type: DsTypeScale)
Widget typeScaleLabel(BuildContext context) {
  final t = DSTheme.of(context).textTheme;
  final rows = [
    ('labelLarge', t.labelLarge, 'Button Label / Tab'),
    ('labelMedium', t.labelMedium, 'Chip · Badge'),
    ('labelSmall', t.labelSmall, 'STATUS TAG'),
  ];
  return _ScaffoldWrapper(
    children: [
      const _GroupHeader('Label'),
      for (var i = 0; i < rows.length; i++)
        _TypeRow(
          token: rows[i].$1,
          style: rows[i].$2,
          sample: rows[i].$3,
          isLast: i == rows.length - 1,
        ),
    ],
  );
}
