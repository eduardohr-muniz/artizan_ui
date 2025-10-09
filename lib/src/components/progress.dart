import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A customizable linear progress indicator widget for Artizan UI.
///
/// The [ArtProgress] widget displays a styled progress bar with configurable
/// colors, height, and border radius. It integrates with [ShadTheme] for
/// consistent styling and wraps [LinearProgressIndicator] with additional
/// customization options.
class ArtProgress extends StatelessWidget {
  /// Creates a progress bar widget with the specified properties.
  const ArtProgress({super.key, this.value, this.backgroundColor, this.color, this.valueColor, this.minHeight, this.semanticsLabel, this.semanticsValue, this.borderRadius, this.innerBorderRadius});

  /// {@template ArtProgress.value}
  /// The progress value between 0.0 and 1.0.
  /// If null, displays an indeterminate progress animation.
  /// {@endtemplate}
  final double? value;

  /// {@template ArtProgress.backgroundColor}
  /// The background color of the progress bar.
  /// Defaults to the theme's secondary color if not specified.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template ArtProgress.color}
  /// The color of the progress indicator itself.
  /// Defaults to the theme's primary color if not specified; overridden by
  /// [valueColor] if set.
  /// {@endtemplate}
  final Color? color;

  /// {@template ArtProgress.valueColor}
  /// An animated color value for the progress indicator.
  /// Overrides [color] if provided; defaults to null (uses [color]).
  /// {@endtemplate}
  final Animation<Color?>? valueColor;

  /// {@template ArtProgress.minHeight}
  /// The minimum height of the progress bar.
  /// Defaults to 16 if not specified.
  /// {@endtemplate}
  final double? minHeight;

  /// {@template ArtProgress.semanticsLabel}
  /// The accessibility label for the progress bar.
  /// Provides context to screen readers; defaults to null.
  /// {@endtemplate}
  final String? semanticsLabel;

  /// {@template ArtProgress.semanticsValue}
  /// The accessibility value for the progress bar (e.g., percentage).
  /// Provides current progress to screen readers; defaults to null.
  /// {@endtemplate}
  final String? semanticsValue;

  /// {@template ArtProgress.borderRadius}
  /// The border radius of the progress bar's outer container.
  /// Defaults to a circular radius of 16 if not specified.
  /// {@endtemplate}
  final BorderRadius? borderRadius;

  /// {@template ArtProgress.innerBorderRadius}
  /// The border radius of the progress indicator itself.
  /// Defaults to zero (sharp edges) if not specified.
  /// {@endtemplate}
  final BorderRadius? innerBorderRadius;

  @override
  Widget build(BuildContext context) {
    return ShadProgress(value: value, backgroundColor: backgroundColor, color: color, valueColor: valueColor, minHeight: minHeight, semanticsLabel: semanticsLabel, semanticsValue: semanticsValue, borderRadius: borderRadius, innerBorderRadius: innerBorderRadius);
  }
}
