import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// ─── Marker class ─────────────────────────────────────────────────────────────

class DsColorTokens extends StatelessWidget {
  const DsColorTokens({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

String _hex(Color c) {
  final value = c.toARGB32();
  return '#${value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
}

Color _onColor(Color bg) =>
    bg.computeLuminance() > 0.35
        ? const Color(0xff09090b)
        : const Color(0xfffafafa);

// ─── Atoms ────────────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 12),
      child: Text(
        text.toUpperCase(),
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

/// Tappable swatch — copies hex to clipboard.
class _Swatch extends StatelessWidget {
  const _Swatch({
    required this.token,
    required this.color,
    this.description,
    this.bordered = false,
  });

  final String token;
  final Color color;
  final String? description;
  final bool bordered;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;
    final hex = _hex(color);
    final fg = _onColor(color);

    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: hex));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$token → $hex copied'),
          duration: const Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating,
          width: 240,
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: bordered ? Border.all(color: cs.border) : null,
            ),
            padding: const EdgeInsets.all(8),
            alignment: Alignment.bottomLeft,
            child: Text(
              hex,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
                color: fg.withAlpha(180),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            token,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: cs.foreground,
            ),
          ),
          if (description != null)
            Text(
              description!,
              style: TextStyle(fontSize: 11, color: cs.mutedForeground),
            ),
        ],
      ),
    );
  }
}

/// Paired swatch — shows base color and its foreground together with contrast preview.
class _SwatchPair extends StatelessWidget {
  const _SwatchPair({
    required this.bgToken,
    required this.fgToken,
    required this.bg,
    required this.fg,
    this.description,
  });

  final String bgToken;
  final String fgToken;
  final Color bg;
  final Color fg;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Contrast preview block
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            children: [
              Container(
                height: 72,
                color: bg,
                alignment: Alignment.center,
                child: Text(
                  'Aa',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: fg,
                  ),
                ),
              ),
              Container(height: 8, color: fg),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _TokenDot(token: bgToken, color: bg),
        const SizedBox(height: 3),
        _TokenDot(token: fgToken, color: fg, muted: true),
        if (description != null) ...[
          const SizedBox(height: 3),
          Text(
            description!,
            style: TextStyle(fontSize: 10, color: cs.mutedForeground),
          ),
        ],
      ],
    );
  }
}

class _TokenDot extends StatelessWidget {
  const _TokenDot({
    required this.token,
    required this.color,
    this.muted = false,
  });

  final String token;
  final Color color;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: cs.border, width: 1),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          token,
          style: TextStyle(
            fontSize: 11,
            fontWeight: muted ? FontWeight.w400 : FontWeight.w600,
            color: muted ? cs.mutedForeground : cs.foreground,
          ),
        ),
      ],
    );
  }
}

// ─── Semantic status banner ───────────────────────────────────────────────────

class _StatusBanner extends StatelessWidget {
  const _StatusBanner({
    required this.bgToken,
    required this.fgToken,
    required this.color,
    required this.fgColor,
    required this.icon,
    required this.title,
    required this.body,
  });

  final String bgToken;
  final String fgToken;
  final Color color;
  final Color fgColor;
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final cs = DSTheme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Token labels row
        Row(
          children: [
            _TokenDot(token: bgToken, color: color),
            const SizedBox(width: 12),
            _TokenDot(token: fgToken, color: fgColor, muted: true),
          ],
        ),
        const SizedBox(height: 10),
        // Alert banner
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: color.withAlpha(24),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withAlpha(76)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: color)),
                    const SizedBox(height: 2),
                    Text(body,
                        style: TextStyle(
                            fontSize: 13,
                            color: cs.foreground.withAlpha(204))),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Badge row
        Wrap(
          spacing: 8,
          children: [
            _Chip(label: 'Filled', bg: color, fg: fgColor),
            _Chip(
                label: 'Subtle',
                bg: color.withAlpha(20),
                fg: color,
                border: color.withAlpha(80)),
            _Chip(label: _hex(color), bg: cs.muted, fg: cs.mutedForeground),
          ],
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.bg,
    required this.fg,
    this.border,
  });

  final String label;
  final Color bg;
  final Color fg;
  final Color? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: border != null ? Border.all(color: border!) : null,
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600, color: fg)),
    );
  }
}

// ─── Scaffold wrapper ─────────────────────────────────────────────────────────

class _PageScaffold extends StatelessWidget {
  const _PageScaffold({required this.children});

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

@widgetbook.UseCase(name: 'Palette', type: DsColorTokens)
Widget colorPalette(BuildContext context) {
  final c = context.dsColors;

  return _PageScaffold(children: [
    const _SectionLabel('Brand'),
    Row(children: [
      Expanded(child: _SwatchPair(
        bgToken: 'primary', fgToken: 'primaryForeground',
        bg: c.primary, fg: c.primaryForeground,
        description: 'Main action color',
      )),
      const SizedBox(width: 12),
      Expanded(child: _SwatchPair(
        bgToken: 'secondary', fgToken: 'secondaryForeground',
        bg: c.secondary, fg: c.secondaryForeground,
        description: 'Alternative actions',
      )),
      const SizedBox(width: 12),
      Expanded(child: _SwatchPair(
        bgToken: 'destructive', fgToken: 'destructiveForeground',
        bg: c.destructive, fg: c.destructiveForeground,
        description: 'Danger / delete',
      )),
    ]),

    const _SectionLabel('Surfaces'),
    Row(children: [
      Expanded(child: _Swatch(token: 'background', color: c.background,
          description: 'App canvas', bordered: true)),
      const SizedBox(width: 12),
      Expanded(child: _Swatch(token: 'card', color: c.card,
          description: 'Cards, panels', bordered: true)),
      const SizedBox(width: 12),
      Expanded(child: _Swatch(token: 'popover', color: c.popover,
          description: 'Dropdowns, tooltips', bordered: true)),
    ]),
    const SizedBox(height: 12),
    Row(children: [
      Expanded(child: _Swatch(token: 'muted', color: c.muted,
          description: 'Subtle backgrounds')),
      const SizedBox(width: 12),
      Expanded(child: _Swatch(token: 'accent', color: c.accent,
          description: 'Hover state fill')),
      const SizedBox(width: 12),
      const Expanded(child: SizedBox()),
    ]),

    const _SectionLabel('Text'),
    Row(children: [
      Expanded(child: _Swatch(token: 'foreground', color: c.foreground,
          description: 'Primary text')),
      const SizedBox(width: 12),
      Expanded(child: _Swatch(token: 'mutedForeground', color: c.mutedForeground,
          description: 'Secondary text')),
      const SizedBox(width: 12),
      Expanded(child: _Swatch(token: 'cardForeground', color: c.cardForeground,
          description: 'Text on cards')),
    ]),

    const _SectionLabel('Structure'),
    Row(children: [
      Expanded(child: _Swatch(token: 'border', color: c.border,
          description: 'Hairlines, dividers', bordered: true)),
      const SizedBox(width: 12),
      Expanded(child: _Swatch(token: 'input', color: c.input,
          description: 'Input border', bordered: true)),
      const SizedBox(width: 12),
      Expanded(child: _Swatch(token: 'ring', color: c.ring,
          description: 'Focus ring')),
    ]),
    const SizedBox(height: 12),
    Row(children: [
      Expanded(child: _Swatch(token: 'selection', color: c.selection,
          description: 'Text selection')),
      const SizedBox(width: 12),
      const Expanded(child: SizedBox()),
      const SizedBox(width: 12),
      const Expanded(child: SizedBox()),
    ]),

    const _SectionLabel('DS Semantic'),
    Row(children: [
      Expanded(child: _SwatchPair(
        bgToken: 'success', fgToken: 'successForeground',
        bg: c.success, fg: c.successForeground,
        description: 'Positive / done',
      )),
      const SizedBox(width: 12),
      Expanded(child: _SwatchPair(
        bgToken: 'warning', fgToken: 'warningForeground',
        bg: c.warning, fg: c.warningForeground,
        description: 'Caution',
      )),
      const SizedBox(width: 12),
      Expanded(child: _SwatchPair(
        bgToken: 'info', fgToken: 'infoForeground',
        bg: c.info, fg: c.infoForeground,
        description: 'Informational',
      )),
    ]),

    const SizedBox(height: 40),
  ]);
}

@widgetbook.UseCase(name: 'Semantic', type: DsColorTokens)
Widget colorSemantic(BuildContext context) {
  final c = context.dsColors;

  return _PageScaffold(children: [
    const _SectionLabel('Status Colors in Context'),
    const SizedBox(height: 8),

    _StatusBanner(
      bgToken: 'success',
      fgToken: 'successForeground',
      color: c.success,
      fgColor: c.successForeground,
      icon: Icons.check_circle_outline_rounded,
      title: 'Changes saved',
      body: 'Your settings have been updated successfully.',
    ),
    const SizedBox(height: 28),

    _StatusBanner(
      bgToken: 'warning',
      fgToken: 'warningForeground',
      color: c.warning,
      fgColor: c.warningForeground,
      icon: Icons.warning_amber_rounded,
      title: 'Action required',
      body: 'Your session will expire in 5 minutes.',
    ),
    const SizedBox(height: 28),

    _StatusBanner(
      bgToken: 'info',
      fgToken: 'infoForeground',
      color: c.info,
      fgColor: c.infoForeground,
      icon: Icons.info_outline_rounded,
      title: 'Heads up',
      body: 'A new version of the app is available.',
    ),
    const SizedBox(height: 28),

    _StatusBanner(
      bgToken: 'destructive',
      fgToken: 'destructiveForeground',
      color: c.destructive,
      fgColor: c.destructiveForeground,
      icon: Icons.error_outline_rounded,
      title: 'Something went wrong',
      body: 'Unable to process your request. Please try again.',
    ),

    const SizedBox(height: 40),
  ]);
}

@widgetbook.UseCase(name: 'Surfaces', type: DsColorTokens)
Widget colorSurfaces(BuildContext context) {
  final c = context.dsColors;

  return _PageScaffold(children: [
    const _SectionLabel('Elevation & Layering'),
    const SizedBox(height: 4),

    // Nested surfaces demo
    Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: c.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SurfacePill(label: 'background', color: c.background),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: c.card,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: c.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SurfacePill(label: 'card', color: c.card),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: c.muted,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: _SurfacePill(label: 'muted', color: c.muted),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: c.popover,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: c.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(20),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SurfacePill(label: 'popover', color: c.popover),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: c.accent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: _SurfacePill(
                            label: 'accent (hover)', color: c.accent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),

    const _SectionLabel('Structure Tokens'),
    const SizedBox(height: 4),

    ...[
      ('border', c.border, 'Hairlines, table rows, card outlines'),
      ('input', c.input, 'Text field border'),
      ('ring', c.ring, 'Focus ring — applied as 2px offset outline'),
      ('selection', c.selection, 'Text selection highlight'),
    ].map(
      (row) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: row.$2,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: c.border),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(row.$1,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: c.foreground)),
                Text(
                  '${_hex(row.$2)} · ${row.$3}',
                  style:
                      TextStyle(fontSize: 11, color: c.mutedForeground),
                ),
              ],
            ),
          ],
        ),
      ),
    ),

    const SizedBox(height: 40),
  ]);
}

class _SurfacePill extends StatelessWidget {
  const _SurfacePill({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final cs = context.dsColors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: cs.border),
          ),
        ),
        const SizedBox(width: 6),
        Text(label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: cs.mutedForeground)),
        const SizedBox(width: 6),
        Text(_hex(color),
            style: TextStyle(
                fontSize: 10,
                color: cs.mutedForeground.withAlpha(140))),
      ],
    );
  }
}
