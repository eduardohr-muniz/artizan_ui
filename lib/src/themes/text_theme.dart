import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

typedef DSTextTheme = ShadTextTheme;

// Keys for DS semantic tokens stored in the ShadTextTheme custom map
const _kDisplayLarge = '_ds_displayLarge';
const _kDisplaySmall = '_ds_displaySmall';
const _kTitleLarge = '_ds_titleLarge';
const _kTitleMedium = '_ds_titleMedium';
const _kTitleSmall = '_ds_titleSmall';
const _kBodyLarge = '_ds_bodyLarge';
const _kBodyMedium = '_ds_bodyMedium';
const _kBodySmall = '_ds_bodySmall';
const _kLabelLarge = '_ds_labelLarge';
const _kLabelMedium = '_ds_labelMedium';
const _kLabelSmall = '_ds_labelSmall';

/// Typed accessors for the DS semantic type scale on top of [DSTextTheme].
///
/// All tokens are pre-populated when you use [createDSTextTheme].
/// Each getter falls back to a sensible default using the theme's own [family]
/// if the token is absent (e.g. when using a raw [ShadTextTheme]).
///
/// ```dart
/// // access in widgets
/// context.dsTextTheme.titleLarge
/// context.dsTextTheme.bodyMedium
/// context.dsTextTheme.labelSmall
/// ```
extension DSTextThemeTokens on DSTextTheme {
  // ── Display ──────────────────────────────────────────────────────────────

  /// 30px / w700 / ls -0.3 — hero text, splash screens, empty states
  TextStyle get displayLarge => custom[_kDisplayLarge] ?? _fallback(fontSize: 30, fontWeight: FontWeight.w700, height: 1.2, letterSpacing: -0.3);

  /// 24px / w700 / ls -0.24 — large modal titles, prominent page headers
  TextStyle get displaySmall => custom[_kDisplaySmall] ?? _fallback(fontSize: 24, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.24);

  // ── Title ─────────────────────────────────────────────────────────────────

  /// 20px / w700 — screen titles, top-level section headers
  TextStyle get titleLarge => custom[_kTitleLarge] ?? _fallback(fontSize: 20, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.2);

  /// 18px / w600 — panel headings, card titles, dialog titles
  TextStyle get title => custom[_kTitleMedium] ?? _fallback(fontSize: 18, fontWeight: FontWeight.w600, height: 1.375, letterSpacing: 0);

  /// 16px / w600 — sub-section headings, list group headers
  TextStyle get titleSmall => custom[_kTitleSmall] ?? _fallback(fontSize: 16, fontWeight: FontWeight.w600, height: 1.375, letterSpacing: 0);

  // ── Body ──────────────────────────────────────────────────────────────────

  /// 16px / w400 — primary readable text, descriptions
  TextStyle get bodyLarge => custom[_kBodyLarge] ?? _fallback(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0);

  /// 14px / w400 — default body text, list items, inputs
  TextStyle get body => custom[_kBodyMedium] ?? _fallback(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0);

  /// 12px / w400 — secondary text, captions, helper copy, timestamps
  TextStyle get bodySmall => custom[_kBodySmall] ?? _fallback(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0);

  // ── Label ─────────────────────────────────────────────────────────────────

  /// 14px / w600 — button labels, tabs, navigation items, form labels
  TextStyle get labelLarge => custom[_kLabelLarge] ?? _fallback(fontSize: 14, fontWeight: FontWeight.w600, height: 1.43, letterSpacing: 0);

  /// 12px / w600 — chip labels, badge text, compact buttons
  TextStyle get label => custom[_kLabelMedium] ?? _fallback(fontSize: 12, fontWeight: FontWeight.w600, height: 1.33, letterSpacing: 0.1);

  /// 11px / w500 — status tags, compact badges, micro-labels
  /// Use `.toUpperCase()` on the string when displaying as an uppercase label.
  TextStyle get labelSmall => custom[_kLabelSmall] ?? _fallback(fontSize: 11, fontWeight: FontWeight.w500, height: 1.18, letterSpacing: 0.4);

  TextStyle _fallback({required double fontSize, required FontWeight fontWeight, required double height, double letterSpacing = 0}) => TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: height,
    letterSpacing: letterSpacing,
    fontFamily: family,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  );
}

/// Creates a [DSTextTheme] with the full DS semantic type scale pre-populated.
///
/// The base Shad tokens (h1–h4, p, small, muted…) are also set to a compact
/// scale suited for mobile/app contexts. Every token can be overridden:
///
/// ```dart
/// DSThemeData(
///   textTheme: createDSTextTheme(
///     family: 'Inter',
///     package: 'my_pkg',
///     titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
///   ),
/// )
/// ```
DSTextTheme createDSTextTheme({
  String? family,
  String? package,
  GoogleFontBuilder? googleFontBuilder,
  // ── Shad base overrides ─────────────────────────────────────────────────
  TextStyle? h1Large,
  TextStyle? h1,
  TextStyle? h2,
  TextStyle? h3,
  TextStyle? h4,
  TextStyle? p,
  TextStyle? blockquote,
  TextStyle? table,
  TextStyle? list,
  TextStyle? lead,
  TextStyle? large,
  TextStyle? small,
  TextStyle? muted,
  // ── DS token overrides ──────────────────────────────────────────────────
  TextStyle? displayLarge,
  TextStyle? displaySmall,
  TextStyle? titleLarge,
  TextStyle? titleMedium,
  TextStyle? titleSmall,
  TextStyle? bodyLarge,
  TextStyle? bodyMedium,
  TextStyle? bodySmall,
  TextStyle? labelLarge,
  TextStyle? labelMedium,
  TextStyle? labelSmall,
  Map<String, TextStyle> extraCustom = const {},
}) {
  var effectiveFamily = family ?? kDefaultFontFamily;
  if (package != null && package.isNotEmpty) {
    effectiveFamily = 'packages/$package/$effectiveFamily';
  }

  TextStyle mk({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double letterSpacing = 0,
    FontStyle fontStyle = FontStyle.normal,
    List<FontFeature>? fontFeatures,
  }) => TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    height: height,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    fontFamily: effectiveFamily,
    fontFeatures: fontFeatures,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  );

  return DSTextTheme(
    family: family,
    package: package,
    googleFontBuilder: googleFontBuilder,
    // Shad base tokens — compact scale for app/mobile contexts
    h1Large: h1Large ?? mk(fontSize: 30, fontWeight: FontWeight.w700, height: 1.2, letterSpacing: -0.3),
    h1: h1 ?? mk(fontSize: 24, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.24),
    h2: h2 ?? mk(fontSize: 20, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.2),
    h3: h3 ?? mk(fontSize: 18, fontWeight: FontWeight.w600, height: 1.375),
    h4: h4 ?? mk(fontSize: 16, fontWeight: FontWeight.w600, height: 1.375),
    lead: lead ?? mk(fontSize: 18, fontWeight: FontWeight.w400, height: 1.5),
    large: large ?? mk(fontSize: 16, fontWeight: FontWeight.w600, height: 1.5),
    p: p ?? mk(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
    blockquote: blockquote ?? mk(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, fontStyle: FontStyle.italic),
    table: table ?? mk(fontSize: 14, fontWeight: FontWeight.w700, height: 1.5),
    list: list ?? mk(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
    small: small ?? mk(fontSize: 12, fontWeight: FontWeight.w500, height: 1.43),
    muted: muted ?? mk(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5),
    custom: {
      // ── Display ───────────────────────────────────────────────────────
      _kDisplayLarge: displayLarge ?? mk(fontSize: 30, fontWeight: FontWeight.w700, height: 1.2, letterSpacing: -0.3),
      _kDisplaySmall: displaySmall ?? mk(fontSize: 24, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.24),
      // ── Title ─────────────────────────────────────────────────────────
      _kTitleLarge: titleLarge ?? mk(fontSize: 20, fontWeight: FontWeight.w700, height: 1.25, letterSpacing: -0.2),
      _kTitleMedium: titleMedium ?? mk(fontSize: 18, fontWeight: FontWeight.w600, height: 1.375),
      _kTitleSmall: titleSmall ?? mk(fontSize: 16, fontWeight: FontWeight.w600, height: 1.375),
      // ── Body ──────────────────────────────────────────────────────────
      _kBodyLarge: bodyLarge ?? mk(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
      _kBodyMedium: bodyMedium ?? mk(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
      _kBodySmall: bodySmall ?? mk(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5),
      // ── Label ─────────────────────────────────────────────────────────
      _kLabelLarge: labelLarge ?? mk(fontSize: 14, fontWeight: FontWeight.w600, height: 1.43),
      _kLabelMedium: labelMedium ?? mk(fontSize: 12, fontWeight: FontWeight.w600, height: 1.33, letterSpacing: 0.1),
      _kLabelSmall: labelSmall ?? mk(fontSize: 11, fontWeight: FontWeight.w500, height: 1.18, letterSpacing: 0.4),
      ...extraCustom,
    },
  );
}
