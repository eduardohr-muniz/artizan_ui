import 'dart:ui';

import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variants available for the [DSDatePicker] widget.
enum DSDatePickerVariant { single, range }

typedef DSDateTimeRange = ShadDateTimeRange;
typedef DSCalendarCaptionLayout = ShadCalendarCaptionLayout;

/// A customizable date picker widget with a button and popover calendar.
///
/// The [DSDatePicker] widget combines a button with a popover calendar,
/// allowing users to select a single date or a date range. It supports
/// extensive customization for both the button and calendar, integrating with
/// [DSTheme] for consistent styling. Use named constructors like
/// [DSDatePicker.range] for range selection or [DSDatePicker.raw] for full
/// control.

class DSDatePicker extends StatefulWidget {
  /// Creates a single-date picker widget with a button and popover calendar.
  const DSDatePicker({
    super.key,
    this.id,
    this.label,
    this.description,
    this.error,
    this.forceErrorText,
    this.autovalidateMode,
    this.restorationId,
    this.onReset,
    this.validator,
    this.onSaved,
    this.toValueTransformer,
    this.fromValueTransformer,
    this.placeholder,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
    this.header,
    this.footer,
    this.groupId,
    this.calendarDecoration,
    this.popoverPadding,
    this.multipleSelected,
    this.onChanged,
    this.onMultipleChanged,
    this.showOutsideDays,
    this.initialMonth,
    this.formatMonthYear,
    this.formatMonth,
    this.formatYear,
    this.formatWeekday,
    this.showWeekNumbers,
    this.weekStartsOn,
    this.fixedWeeks,
    this.hideWeekdayNames,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
    this.onRangeChanged,
    this.captionLayout,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonIconData,
    this.forwardNavigationButtonIconData,
    this.navigationButtonPadding,
    this.navigationButtonDisabledOpacity,
    this.decoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.calendarHeaderHeight,
    this.calendarHeaderPadding,
    this.captionLayoutGap,
    this.calendarHeaderTextStyle,
    this.weekdaysPadding,
    this.weekdaysTextStyle,
    this.weekdaysTextAlign,
    this.weekNumbersHeaderText,
    this.weekNumbersHeaderTextStyle,
    this.weekNumbersTextStyle,
    this.weekNumbersTextAlign,
    this.dayButtonSize,
    this.dayButtonOutsideMonthOpacity,
    this.dayButtonPadding,
    this.dayButtonDecoration,
    this.selectedDayButtonTextStyle,
    this.insideRangeDayButtonTextStyle,
    this.dayButtonTextStyle,
    this.dayButtonVariant,
    this.selectedDayButtonVariant,
    this.insideRangeDayButtonVariant,
    this.todayButtonVariant,
    this.gridMainAxisSpacing,
    this.gridCrossAxisSpacing,
    this.dayButtonOutsideMonthTextStyle,
    this.dayButtonOutsideMonthVariant,
    this.selectedDayButtonOusideMonthVariant,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.anchor,
    this.effects,
    this.shadows,
    this.popoverDecoration,
    this.filter,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
    this.onPressed,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.buttonChild,
    this.buttonVariant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.buttonFocusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.iconData,
    this.expands,
    this.popoverReverseDuration,
    this.buttonTextStyle,
  }) : variant = DSDatePickerVariant.single,
       formatDateRange = null,
       selectedRange = null,
       rangeValidator = null,
       onSavedRange = null,
       toValueTransformerRange = null,
       fromValueTransformerRange = null;

  /// Creates a date range picker widget with a button and popover calendar.
  const DSDatePicker.range({
    super.key,
    this.id,
    this.label,
    this.description,
    this.error,
    this.forceErrorText,
    this.autovalidateMode,
    this.restorationId,
    this.onReset,
    this.rangeValidator,
    this.onSavedRange,
    this.toValueTransformerRange,
    this.fromValueTransformerRange,
    this.popoverController,
    this.placeholder,
    DSDateTimeRange? selected,
    this.formatDateRange,
    this.closeOnSelection,
    this.allowDeselection,
    this.header,
    this.footer,
    this.groupId,
    this.calendarDecoration,
    this.popoverPadding,
    this.multipleSelected,
    this.onChanged,
    this.onMultipleChanged,
    this.showOutsideDays,
    this.initialMonth,
    this.formatMonthYear,
    this.formatMonth,
    this.formatYear,
    this.formatWeekday,
    this.showWeekNumbers,
    this.weekStartsOn,
    this.fixedWeeks,
    this.hideWeekdayNames,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
    this.onRangeChanged,
    this.captionLayout,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonIconData,
    this.forwardNavigationButtonIconData,
    this.navigationButtonPadding,
    this.navigationButtonDisabledOpacity,
    this.decoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.calendarHeaderHeight,
    this.calendarHeaderPadding,
    this.captionLayoutGap,
    this.calendarHeaderTextStyle,
    this.weekdaysPadding,
    this.weekdaysTextStyle,
    this.weekdaysTextAlign,
    this.weekNumbersHeaderText,
    this.weekNumbersHeaderTextStyle,
    this.weekNumbersTextStyle,
    this.weekNumbersTextAlign,
    this.dayButtonSize,
    this.dayButtonOutsideMonthOpacity,
    this.dayButtonPadding,
    this.dayButtonDecoration,
    this.selectedDayButtonTextStyle,
    this.insideRangeDayButtonTextStyle,
    this.dayButtonTextStyle,
    this.dayButtonVariant,
    this.selectedDayButtonVariant,
    this.insideRangeDayButtonVariant,
    this.todayButtonVariant,
    this.gridMainAxisSpacing,
    this.gridCrossAxisSpacing,
    this.dayButtonOutsideMonthTextStyle,
    this.dayButtonOutsideMonthVariant,
    this.selectedDayButtonOusideMonthVariant,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.anchor,
    this.effects,
    this.shadows,
    this.popoverDecoration,
    this.filter,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
    this.onPressed,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.buttonChild,
    this.buttonVariant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.buttonFocusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.iconData,
    this.expands,
    this.popoverReverseDuration,
    this.buttonTextStyle,
  }) : variant = DSDatePickerVariant.range,
       selected = null,
       formatDate = null,
       selectedRange = selected,
       validator = null,
       onSaved = null,
       toValueTransformer = null,
       fromValueTransformer = null;

  /// Creates a date picker widget with a specified [variant], offering full
  /// customization.
  const DSDatePicker.raw({
    required this.variant,
    super.key,
    this.id,
    this.label,
    this.description,
    this.error,
    this.forceErrorText,
    this.autovalidateMode,
    this.restorationId,
    this.onReset,
    this.validator,
    this.rangeValidator,
    this.onSaved,
    this.onSavedRange,
    this.toValueTransformer,
    this.toValueTransformerRange,
    this.fromValueTransformer,
    this.fromValueTransformerRange,
    this.popoverController,
    this.selected,
    this.closeOnSelection,
    this.formatDate,
    this.allowDeselection,
    this.selectedRange,
    this.header,
    this.footer,
    this.groupId,
    this.calendarDecoration,
    this.popoverPadding,
    this.multipleSelected,
    this.onChanged,
    this.onMultipleChanged,
    this.showOutsideDays,
    this.initialMonth,
    this.formatMonthYear,
    this.formatMonth,
    this.formatYear,
    this.formatWeekday,
    this.showWeekNumbers,
    this.weekStartsOn,
    this.fixedWeeks,
    this.hideWeekdayNames,
    this.numberOfMonths = 1,
    this.fromMonth,
    this.toMonth,
    this.onMonthChanged,
    this.reverseMonths = false,
    this.min,
    this.max,
    this.selectableDayPredicate,
    this.onRangeChanged,
    this.captionLayout,
    this.hideNavigation,
    this.yearSelectorMinWidth,
    this.monthSelectorMinWidth,
    this.yearSelectorPadding,
    this.monthSelectorPadding,
    this.navigationButtonSize,
    this.navigationButtonIconSize,
    this.backNavigationButtonIconData,
    this.forwardNavigationButtonIconData,
    this.navigationButtonPadding,
    this.navigationButtonDisabledOpacity,
    this.decoration,
    this.spacingBetweenMonths,
    this.runSpacingBetweenMonths,
    this.monthConstraints,
    this.calendarHeaderHeight,
    this.calendarHeaderPadding,
    this.captionLayoutGap,
    this.calendarHeaderTextStyle,
    this.weekdaysPadding,
    this.weekdaysTextStyle,
    this.weekdaysTextAlign,
    this.weekNumbersHeaderText,
    this.weekNumbersHeaderTextStyle,
    this.weekNumbersTextStyle,
    this.weekNumbersTextAlign,
    this.dayButtonSize,
    this.dayButtonOutsideMonthOpacity,
    this.dayButtonPadding,
    this.dayButtonDecoration,
    this.selectedDayButtonTextStyle,
    this.insideRangeDayButtonTextStyle,
    this.dayButtonTextStyle,
    this.dayButtonVariant,
    this.selectedDayButtonVariant,
    this.insideRangeDayButtonVariant,
    this.todayButtonVariant,
    this.gridMainAxisSpacing,
    this.gridCrossAxisSpacing,
    this.dayButtonOutsideMonthTextStyle,
    this.dayButtonOutsideMonthVariant,
    this.selectedDayButtonOusideMonthVariant,
    this.closeOnTapOutside = true,
    this.focusNode,
    this.anchor,
    this.effects,
    this.shadows,
    this.popoverDecoration,
    this.filter,
    this.areaGroupId,
    this.useSameGroupIdForChild = true,
    this.onPressed,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.buttonChild,
    this.buttonVariant,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.buttonPadding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.buttonFocusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.buttonShadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.buttonDecoration,
    this.enabled = true,
    this.statesController,
    this.gap,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.onFocusChange,
    this.iconData,
    this.formatDateRange,
    this.placeholder,
    this.expands,
    this.popoverReverseDuration,
    this.buttonTextStyle,
  });

  /// The placeholder of the date picker, shown when no date is selected.
  final Widget? placeholder;

  /// The [DSPopoverController] to use.
  final DSPopoverController? popoverController;

  /// The selected date, defaults to `null`.
  final DateTime? selected;

  /// The selected range, defaults to `null`.
  final DSDateTimeRange? selectedRange;

  /// Whether to close the popover when a date is selected.
  /// Defaults to `true`.
  final bool? closeOnSelection;

  /// A function that formats the selected date.
  final String Function(DateTime)? formatDate;

  /// A function that formats the selected date range.
  final String Function(DSDateTimeRange)? formatDateRange;

  /// Whether to allow deselection of the selected date.
  final bool? allowDeselection;

  /// The variant of the date picker.
  final DSDatePickerVariant variant;

  /// Optional form field id for [ShadForm] integration.
  final String? id;

  /// Label displayed above the field.
  final Widget? label;

  /// Description displayed below the field.
  final Widget? description;

  /// Custom error widget builder; receives error text when validation fails.
  final Widget Function(String error)? error;

  /// When non-null, this text is shown as the field error (e.g. for required fields).
  final String? forceErrorText;

  /// When to run validation (e.g. on change, on submit).
  final AutovalidateMode? autovalidateMode;

  /// Restoration id for state restoration.
  final String? restorationId;

  /// Called when the form field is reset.
  final VoidCallback? onReset;

  /// Validator for single-date variant. [DateTime?] → error message or null.
  final String? Function(DateTime?)? validator;

  /// Validator for range variant. [DSDateTimeRange?] → error message or null.
  final String? Function(DSDateTimeRange?)? rangeValidator;

  /// Called when form is saved (single-date value).
  final void Function(DateTime?)? onSaved;

  /// Called when form is saved (range value).
  final void Function(DSDateTimeRange?)? onSavedRange;

  /// Transforms value before save/processing (single-date).
  final dynamic Function(DateTime?)? toValueTransformer;

  /// Transforms value before save/processing (range).
  final dynamic Function(DSDateTimeRange?)? toValueTransformerRange;

  /// Transforms external value into field value (single-date).
  final DateTime? Function(dynamic)? fromValueTransformer;

  /// Transforms external value into field value (range).
  final DSDateTimeRange? Function(dynamic)? fromValueTransformerRange;

  /// The header of the date picker.
  final Widget? header;

  /// The footer of the date picker.
  final Widget? footer;

  /// {@macro ShadPopover.groupId}
  final Object? groupId;

  /// The decoration of the calendar.
  /// Defaults to `ShadDecoration.none`.
  final DSDecoration? calendarDecoration;

  /// {@macro ShadPopover.padding}
  final EdgeInsetsGeometry? popoverPadding;

  /// {@macro ShadCalendar.multipleSelected}
  final List<DateTime>? multipleSelected;

  /// {@macro ShadCalendar.onChanged}
  final ValueChanged<DateTime?>? onChanged;

  /// {@macro ShadCalendar.onMultipleChanged}
  final ValueChanged<List<DateTime>>? onMultipleChanged;

  /// {@macro ShadCalendar.showOutsideDays}
  final bool? showOutsideDays;

  /// {@macro ShadCalendar.initialMonth}
  final DateTime? initialMonth;

  /// {@macro ShadCalendar.formatMonthYear}
  final String Function(DateTime date)? formatMonthYear;

  /// {@macro ShadCalendar.formatMonth}
  final String Function(DateTime date)? formatMonth;

  /// {@macro ShadCalendar.formatYear}
  final String Function(DateTime date)? formatYear;

  /// {@macro ShadCalendar.formatWeekday}
  final String Function(DateTime date)? formatWeekday;

  /// {@macro ShadCalendar.showWeekNumbers}
  final bool? showWeekNumbers;

  /// {@macro ShadCalendar.weekStartsOn}
  final int? weekStartsOn;

  /// {@macro ShadCalendar.fixedWeeks}
  final bool? fixedWeeks;

  /// {@macro ShadCalendar.hideWeekdayNames}
  final bool? hideWeekdayNames;

  /// {@macro ShadCalendar.numberOfMonths}
  final int numberOfMonths;

  /// {@macro ShadCalendar.fromMonth}
  final DateTime? fromMonth;

  /// {@macro ShadCalendar.toMonth}
  final DateTime? toMonth;

  /// {@macro ShadCalendar.onMonthChanged}
  final ValueChanged<DateTime>? onMonthChanged;

  /// {@macro ShadCalendar.reverseMonths}
  final bool reverseMonths;

  /// {@macro ShadCalendar.min}
  final int? min;

  /// {@macro ShadCalendar.max}
  final int? max;

  /// {@macro ShadCalendar.selectableDayPredicate}
  final bool Function(DateTime day)? selectableDayPredicate;

  /// {@macro ShadCalendar.onRangeChanged}
  final ValueChanged<DSDateTimeRange?>? onRangeChanged;

  /// {@macro ShadCalendar.captionLayout}
  final DSCalendarCaptionLayout? captionLayout;

  /// {@macro ShadCalendar.hideNavigation}
  final bool? hideNavigation;

  /// {@macro ShadCalendar.yearSelectorMinWidth}
  final double? yearSelectorMinWidth;

  /// {@macro ShadCalendar.monthSelectorMinWidth}
  final double? monthSelectorMinWidth;

  /// {@macro ShadCalendar.yearSelectorPadding}
  final EdgeInsetsGeometry? yearSelectorPadding;

  /// {@macro ShadCalendar.monthSelectorPadding}
  final EdgeInsetsGeometry? monthSelectorPadding;

  /// {@macro ShadCalendar.navigationButtonSize}
  final double? navigationButtonSize;

  /// {@macro ShadCalendar.navigationButtonIconSize}
  final double? navigationButtonIconSize;

  /// {@macro ShadCalendar.backNavigationButtonIconData}
  final IconData? backNavigationButtonIconData;

  /// {@macro ShadCalendar.forwardNavigationButtonIconData}
  final IconData? forwardNavigationButtonIconData;

  /// {@macro ShadCalendar.navigationButtonPadding}
  final EdgeInsetsGeometry? navigationButtonPadding;

  /// {@macro ShadCalendar.navigationButtonDisabledOpacity}
  final double? navigationButtonDisabledOpacity;

  /// {@macro ShadCalendar.decoration}
  final DSDecoration? decoration;

  /// {@macro ShadCalendar.spacingBetweenMonths}
  final double? spacingBetweenMonths;

  /// {@macro ShadCalendar.runSpacingBetweenMonths}
  final double? runSpacingBetweenMonths;

  /// {@macro ShadCalendar.monthConstraints}
  final BoxConstraints? monthConstraints;

  /// {@macro ShadCalendar.headerHeight}
  final double? calendarHeaderHeight;

  /// {@macro ShadCalendar.headerPadding}
  final EdgeInsetsGeometry? calendarHeaderPadding;

  /// {@macro ShadCalendar.captionLayoutGap}
  final double? captionLayoutGap;

  /// {@macro ShadCalendar.headerTextStyle}
  final TextStyle? calendarHeaderTextStyle;

  /// {@macro ShadCalendar.weekdaysPadding}
  final EdgeInsetsGeometry? weekdaysPadding;

  /// {@macro ShadCalendar.weekdaysTextStyle}
  final TextStyle? weekdaysTextStyle;

  /// {@macro ShadCalendar.weekdaysTextAlign}
  final TextAlign? weekdaysTextAlign;

  /// {@macro ShadCalendar.weekNumbersHeaderText}
  final String? weekNumbersHeaderText;

  /// {@macro ShadCalendar.weekNumbersHeaderTextStyle}
  final TextStyle? weekNumbersHeaderTextStyle;

  /// {@macro ShadCalendar.weekNumbersTextStyle}
  final TextStyle? weekNumbersTextStyle;

  /// {@macro ShadCalendar.weekNumbersTextAlign}
  final TextAlign? weekNumbersTextAlign;

  /// {@macro ShadCalendar.dayButtonSize}
  final double? dayButtonSize;

  /// {@macro ShadCalendar.dayButtonOutsideMonthOpacity}
  final double? dayButtonOutsideMonthOpacity;

  /// {@macro ShadCalendar.dayButtonPadding}
  final EdgeInsetsGeometry? dayButtonPadding;

  /// {@macro ShadCalendar.dayButtonDecoration}
  final DSDecoration? dayButtonDecoration;

  /// {@macro ShadCalendar.selectedDayButtonTextStyle}
  final TextStyle? selectedDayButtonTextStyle;

  /// {@macro ShadCalendar.insideRangeDayButtonTextStyle}
  final TextStyle? insideRangeDayButtonTextStyle;

  /// {@macro ShadCalendar.dayButtonTextStyle}
  final TextStyle? dayButtonTextStyle;

  /// {@macro ShadCalendar.dayButtonVariant}
  final DSButtonVariant? dayButtonVariant;

  /// {@macro ShadCalendar.selectedDayButtonVariant}
  final DSButtonVariant? selectedDayButtonVariant;

  /// {@macro ShadCalendar.insideRangeDayButtonVariant}
  final DSButtonVariant? insideRangeDayButtonVariant;

  /// {@macro ShadCalendar.todayButtonVariant}
  final DSButtonVariant? todayButtonVariant;

  /// {@macro ShadCalendar.gridMainAxisSpacing}
  final double? gridMainAxisSpacing;

  /// {@macro ShadCalendar.gridCrossAxisSpacing}
  final double? gridCrossAxisSpacing;

  /// {@macro ShadCalendar.dayButtonOutsideMonthTextStyle}
  final TextStyle? dayButtonOutsideMonthTextStyle;

  /// {@macro ShadCalendar.dayButtonOutsideMonthVariant}
  final DSButtonVariant? dayButtonOutsideMonthVariant;

  /// {@macro ShadCalendar.selectedDayButtonOusideMonthVariant}
  final DSButtonVariant? selectedDayButtonOusideMonthVariant;

  // ---
  // POPOVER
  // ---

  /// {@macro ShadPopover.closeOnTapOutside}
  final bool closeOnTapOutside;

  /// {@macro ShadPopover.focusNode}
  final FocusNode? focusNode;

  ///{@macro ShadPopover.anchor}
  final DSAnchorBase? anchor;

  /// {@macro ShadPopover.effects}
  final List<Effect<dynamic>>? effects;

  /// {@macro ShadPopover.shadows}
  final List<BoxShadow>? shadows;

  /// {@macro ShadPopover.decoration}
  final DSDecoration? popoverDecoration;

  /// {@macro ShadPopover.filter}
  final ImageFilter? filter;

  /// {@macro ShadMouseArea.groupId}
  final Object? areaGroupId;

  /// {@macro ShadPopover.useSameGroupIdForChild}
  final bool useSameGroupIdForChild;

  /// {@macro ShadPopover.reverseDuration}
  final Duration? popoverReverseDuration;

  // ---
  // BUTTON
  // ---

  /// {@macro ShadButton.onPressed}
  final VoidCallback? onPressed;

  /// {@macro ShadButton.onLongPress}
  final VoidCallback? onLongPress;

  /// {@macro ShadButton.icon}
  final Widget? leading;

  /// {@macro ShadButton.trailing}
  final Widget? trailing;

  /// The icon of the date picker button, defaults to [LucideIcons.calendar].
  final IconData? iconData;

  /// {@macro ShadButton.child}
  final Widget? buttonChild;

  /// {@macro ShadButton.variant}
  final DSButtonVariant? buttonVariant;

  /// {@macro ShadButton.size}
  final DSButtonSize? size;

  /// {@macro ShadButton.cursor}
  final MouseCursor? cursor;

  /// {@macro ShadButton.width}
  final double? width;

  /// {@macro ShadButton.height}
  final double? height;

  /// {@macro ShadButton.padding}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@macro ShadButton.backgroundColor}
  final Color? backgroundColor;

  /// {@macro ShadButton.hoverBackgroundColor}
  final Color? hoverBackgroundColor;

  /// {@macro ShadButton.foregroundColor}
  final Color? foregroundColor;

  /// {@macro ShadButton.hoverForegroundColor}
  final Color? hoverForegroundColor;

  /// {@macro ShadButton.autofocus}
  final bool autofocus;

  /// {@macro ShadButton.focusNode}
  final FocusNode? buttonFocusNode;

  /// {@macro ShadButton.pressedBackgroundColor}
  final Color? pressedBackgroundColor;

  /// {@macro ShadButton.pressedForegroundColor}
  final Color? pressedForegroundColor;

  /// {@macro ShadButton.shadows}
  final List<BoxShadow>? buttonShadows;

  /// {@macro ShadButton.gradient}
  final Gradient? gradient;

  /// {@macro ShadButton.textDecoration}
  final TextDecoration? textDecoration;

  /// {@macro ShadButton.hoverTextDecoration}
  final TextDecoration? hoverTextDecoration;

  /// {@macro ShadButton.decoration}
  final DSDecoration? buttonDecoration;

  /// {@macro ShadButton.enabled}
  final bool enabled;

  /// {@macro ShadButton.statesController}
  final ShadStatesController? statesController;

  /// {@macro ShadButton.gap}
  final double? gap;

  /// {@macro ShadButton.mainAxisAlignment}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@macro ShadButton.crossAxisAlignment}
  final CrossAxisAlignment? crossAxisAlignment;

  /// {@macro ShadButton.hoverStrategies}
  final DSHoverStrategies? hoverStrategies;

  /// {@macro ShadButton.onHoverChange}
  final ValueChanged<bool>? onHoverChange;

  /// {@macro ShadButton.onTapDown}
  final ValueChanged<TapDownDetails>? onTapDown;

  /// {@macro ShadButton.onTapUp}
  final ValueChanged<TapUpDetails>? onTapUp;

  /// {@macro ShadButton.onTapCancel}
  final VoidCallback? onTapCancel;

  /// {@macro ShadButton.onSecondaryTapDown}
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;

  /// {@macro ShadButton.onSecondaryTapUp}
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;

  /// {@macro ShadButton.onSecondaryTapCancel}
  final VoidCallback? onSecondaryTapCancel;

  /// {@macro ShadButton.onLongPressStart}
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// {@macro ShadButton.onLongPressCancel}
  final VoidCallback? onLongPressCancel;

  /// {@macro ShadButton.onLongPressUp}
  final VoidCallback? onLongPressUp;

  /// {@macro ShadButton.onLongPressDown}
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// {@macro ShadButton.onLongPressEnd}
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// {@macro ShadButton.onDoubleTap}
  final VoidCallback? onDoubleTap;

  /// {@macro ShadButton.onDoubleTapDown}
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// {@macro ShadButton.onDoubleTapCancel}
  final VoidCallback? onDoubleTapCancel;

  /// {@macro ShadButton.longPressDuration}
  final Duration? longPressDuration;

  /// {@macro ShadButton.textDirection}
  final TextDirection? textDirection;

  /// {@macro ShadButton.onFocusChange}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro ShadButton.expands}
  final bool? expands;

  /// {@macro ShadButton.textStyle}
  final TextStyle? buttonTextStyle;

  @override
  State<DSDatePicker> createState() => _DSDatePickerState();
}

class _DSDatePickerState extends State<DSDatePicker> {
  ShadButtonVariant? _mapButtonVariant(DSButtonVariant? variant) {
    if (variant == null) return null;
    return variant.shadVariant;
  }

  ShadButtonSize? _mapSize(DSButtonSize? size) {
    if (size == null) return null;
    return switch (size) {
      DSButtonSize.regular => ShadButtonSize.regular,
      DSButtonSize.sm => ShadButtonSize.sm,
      DSButtonSize.lg => ShadButtonSize.lg,
    };
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.variant) {
      case DSDatePickerVariant.single:
        return ShadDatePickerFormField(
          key: widget.key,
          id: widget.id,
          label: widget.label,
          description: widget.description,
          error: widget.error,
          forceErrorText: widget.forceErrorText,
          autovalidateMode: widget.autovalidateMode,
          restorationId: widget.restorationId,
          onReset: widget.onReset,
          validator: widget.validator,
          onSaved: widget.onSaved,
          toValueTransformer: widget.toValueTransformer,
          fromValueTransformer: widget.fromValueTransformer,
          initialValue: widget.selected,
          onChanged: widget.onChanged,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          placeholder: widget.placeholder,
          popoverController: widget.popoverController,
          closeOnSelection: widget.closeOnSelection,
          formatDate: widget.formatDate,
          allowDeselection: widget.allowDeselection,
          header: widget.header,
          footer: widget.footer,
          groupId: widget.groupId,
          calendarDecoration: widget.calendarDecoration,
          popoverPadding:
              widget.popoverPadding is EdgeInsets
                  ? widget.popoverPadding! as EdgeInsets
                  : null,
          multipleSelected: widget.multipleSelected,
          onMultipleChanged: widget.onMultipleChanged,
          showOutsideDays: widget.showOutsideDays,
          initialMonth: widget.initialMonth,
          formatMonthYear: widget.formatMonthYear,
          formatMonth: widget.formatMonth,
          formatYear: widget.formatYear,
          formatWeekday: widget.formatWeekday,
          showWeekNumbers: widget.showWeekNumbers,
          weekStartsOn: widget.weekStartsOn,
          fixedWeeks: widget.fixedWeeks,
          hideWeekdayNames: widget.hideWeekdayNames,
          numberOfMonths: widget.numberOfMonths,
          fromMonth: widget.fromMonth,
          toMonth: widget.toMonth,
          onMonthChanged: widget.onMonthChanged,
          reverseMonths: widget.reverseMonths,
          min: widget.min,
          max: widget.max,
          selectableDayPredicate: widget.selectableDayPredicate,
          captionLayout: widget.captionLayout,
          hideNavigation: widget.hideNavigation,
          yearSelectorMinWidth: widget.yearSelectorMinWidth,
          monthSelectorMinWidth: widget.monthSelectorMinWidth,
          yearSelectorPadding: widget.yearSelectorPadding,
          monthSelectorPadding: widget.monthSelectorPadding,
          navigationButtonSize: widget.navigationButtonSize,
          navigationButtonIconSize: widget.navigationButtonIconSize,
          backNavigationButtonIconData: widget.backNavigationButtonIconData,
          forwardNavigationButtonIconData: widget.forwardNavigationButtonIconData,
          navigationButtonPadding: widget.navigationButtonPadding,
          navigationButtonDisabledOpacity: widget.navigationButtonDisabledOpacity,
          spacingBetweenMonths: widget.spacingBetweenMonths,
          runSpacingBetweenMonths: widget.runSpacingBetweenMonths,
          monthConstraints: widget.monthConstraints,
          calendarHeaderHeight: widget.calendarHeaderHeight,
          calendarHeaderPadding:
              widget.calendarHeaderPadding is EdgeInsets
                  ? widget.calendarHeaderPadding! as EdgeInsets
                  : null,
          captionLayoutGap: widget.captionLayoutGap,
          calendarHeaderTextStyle: widget.calendarHeaderTextStyle,
          weekdaysPadding:
              widget.weekdaysPadding is EdgeInsets
                  ? widget.weekdaysPadding! as EdgeInsets
                  : null,
          weekdaysTextStyle: widget.weekdaysTextStyle,
          weekdaysTextAlign: widget.weekdaysTextAlign,
          weekNumbersHeaderText: widget.weekNumbersHeaderText,
          weekNumbersHeaderTextStyle: widget.weekNumbersHeaderTextStyle,
          weekNumbersTextStyle: widget.weekNumbersTextStyle,
          weekNumbersTextAlign: widget.weekNumbersTextAlign,
          dayButtonSize: widget.dayButtonSize,
          dayButtonOutsideMonthOpacity: widget.dayButtonOutsideMonthOpacity,
          dayButtonPadding: widget.dayButtonPadding,
          dayButtonDecoration: widget.dayButtonDecoration,
          selectedDayButtonTextStyle: widget.selectedDayButtonTextStyle,
          dayButtonTextStyle: widget.dayButtonTextStyle,
          dayButtonVariant: _mapButtonVariant(widget.dayButtonVariant),
          selectedDayButtonVariant: _mapButtonVariant(widget.selectedDayButtonVariant),
          todayButtonVariant: _mapButtonVariant(widget.todayButtonVariant),
          gridMainAxisSpacing: widget.gridMainAxisSpacing,
          gridCrossAxisSpacing: widget.gridCrossAxisSpacing,
          dayButtonOutsideMonthTextStyle: widget.dayButtonOutsideMonthTextStyle,
          dayButtonOutsideMonthVariant: _mapButtonVariant(
            widget.dayButtonOutsideMonthVariant,
          ),
          selectedDayButtonOusideMonthVariant: _mapButtonVariant(
            widget.selectedDayButtonOusideMonthVariant,
          ),
          closeOnTapOutside: widget.closeOnTapOutside,
          anchor: widget.anchor,
          effects: widget.effects,
          shadows: widget.shadows,
          popoverDecoration: widget.popoverDecoration,
          filter: widget.filter,
          areaGroupId: widget.areaGroupId,
          useSameGroupIdForChild: widget.useSameGroupIdForChild,
          onPressed: widget.onPressed,
          onLongPress: widget.onLongPress,
          leading: widget.leading,
          trailing: widget.trailing,
          iconData: widget.iconData,
          buttonChild: widget.buttonChild,
          buttonVariant: _mapButtonVariant(widget.buttonVariant),
          size: _mapSize(widget.size),
          cursor: widget.cursor,
          width: widget.width,
          height: widget.height,
          buttonPadding: widget.buttonPadding,
          backgroundColor: widget.backgroundColor,
          hoverBackgroundColor: widget.hoverBackgroundColor,
          foregroundColor: widget.foregroundColor,
          hoverForegroundColor: widget.hoverForegroundColor,
          autofocus: widget.autofocus,
          buttonFocusNode: widget.buttonFocusNode,
          pressedBackgroundColor: widget.pressedBackgroundColor,
          pressedForegroundColor: widget.pressedForegroundColor,
          buttonShadows: widget.buttonShadows,
          gradient: widget.gradient,
          textDecoration: widget.textDecoration,
          hoverTextDecoration: widget.hoverTextDecoration,
          buttonDecoration: widget.buttonDecoration,
          statesController: widget.statesController,
          gap: widget.gap,
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          hoverStrategies: widget.hoverStrategies,
          onHoverChange: widget.onHoverChange,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onSecondaryTapDown: widget.onSecondaryTapDown,
          onSecondaryTapUp: widget.onSecondaryTapUp,
          onSecondaryTapCancel: widget.onSecondaryTapCancel,
          onLongPressStart: widget.onLongPressStart,
          onLongPressCancel: widget.onLongPressCancel,
          onLongPressUp: widget.onLongPressUp,
          onLongPressDown: widget.onLongPressDown,
          onLongPressEnd: widget.onLongPressEnd,
          onDoubleTap: widget.onDoubleTap,
          onDoubleTapDown: widget.onDoubleTapDown,
          onDoubleTapCancel: widget.onDoubleTapCancel,
          longPressDuration: widget.longPressDuration,
          textDirection: widget.textDirection,
          onFocusChange: widget.onFocusChange,
          expands: widget.expands,
          buttonTextStyle: widget.buttonTextStyle,
        );
      case DSDatePickerVariant.range:
        return ShadDateRangePickerFormField(
          key: widget.key,
          id: widget.id,
          label: widget.label,
          description: widget.description,
          error: widget.error,
          forceErrorText: widget.forceErrorText,
          autovalidateMode: widget.autovalidateMode,
          restorationId: widget.restorationId,
          onReset: widget.onReset,
          validator: widget.rangeValidator,
          onSaved: widget.onSavedRange,
          toValueTransformer: widget.toValueTransformerRange,
          fromValueTransformer: widget.fromValueTransformerRange,
          initialValue: widget.selectedRange,
          onChanged: widget.onRangeChanged,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          placeholder: widget.placeholder,
          popoverController: widget.popoverController,
          closeOnSelection: widget.closeOnSelection,
          formatDateRange: widget.formatDateRange,
          allowDeselection: widget.allowDeselection,
          header: widget.header,
          footer: widget.footer,
          groupId: widget.groupId,
          calendarDecoration: widget.calendarDecoration,
          popoverPadding:
              widget.popoverPadding is EdgeInsets
                  ? widget.popoverPadding! as EdgeInsets
                  : null,
          multipleSelected: widget.multipleSelected,
          onMultipleChanged: widget.onMultipleChanged,
          showOutsideDays: widget.showOutsideDays,
          initialMonth: widget.initialMonth,
          formatMonthYear: widget.formatMonthYear,
          formatMonth: widget.formatMonth,
          formatYear: widget.formatYear,
          formatWeekday: widget.formatWeekday,
          showWeekNumbers: widget.showWeekNumbers,
          weekStartsOn: widget.weekStartsOn,
          fixedWeeks: widget.fixedWeeks,
          hideWeekdayNames: widget.hideWeekdayNames,
          numberOfMonths: widget.numberOfMonths,
          fromMonth: widget.fromMonth,
          toMonth: widget.toMonth,
          onMonthChanged: widget.onMonthChanged,
          reverseMonths: widget.reverseMonths,
          min: widget.min,
          max: widget.max,
          selectableDayPredicate: widget.selectableDayPredicate,
          captionLayout: widget.captionLayout,
          hideNavigation: widget.hideNavigation,
          yearSelectorMinWidth: widget.yearSelectorMinWidth,
          monthSelectorMinWidth: widget.monthSelectorMinWidth,
          yearSelectorPadding: widget.yearSelectorPadding,
          monthSelectorPadding: widget.monthSelectorPadding,
          navigationButtonSize: widget.navigationButtonSize,
          navigationButtonIconSize: widget.navigationButtonIconSize,
          backNavigationButtonIconData: widget.backNavigationButtonIconData,
          forwardNavigationButtonIconData: widget.forwardNavigationButtonIconData,
          navigationButtonPadding: widget.navigationButtonPadding,
          navigationButtonDisabledOpacity: widget.navigationButtonDisabledOpacity,
          spacingBetweenMonths: widget.spacingBetweenMonths,
          runSpacingBetweenMonths: widget.runSpacingBetweenMonths,
          monthConstraints: widget.monthConstraints,
          calendarHeaderHeight: widget.calendarHeaderHeight,
          calendarHeaderPadding:
              widget.calendarHeaderPadding is EdgeInsets
                  ? widget.calendarHeaderPadding! as EdgeInsets
                  : null,
          captionLayoutGap: widget.captionLayoutGap,
          calendarHeaderTextStyle: widget.calendarHeaderTextStyle,
          weekdaysPadding:
              widget.weekdaysPadding is EdgeInsets
                  ? widget.weekdaysPadding! as EdgeInsets
                  : null,
          weekdaysTextStyle: widget.weekdaysTextStyle,
          weekdaysTextAlign: widget.weekdaysTextAlign,
          weekNumbersHeaderText: widget.weekNumbersHeaderText,
          weekNumbersHeaderTextStyle: widget.weekNumbersHeaderTextStyle,
          weekNumbersTextStyle: widget.weekNumbersTextStyle,
          weekNumbersTextAlign: widget.weekNumbersTextAlign,
          dayButtonSize: widget.dayButtonSize,
          dayButtonOutsideMonthOpacity: widget.dayButtonOutsideMonthOpacity,
          dayButtonPadding: widget.dayButtonPadding,
          dayButtonDecoration: widget.dayButtonDecoration,
          selectedDayButtonTextStyle: widget.selectedDayButtonTextStyle,
          insideRangeDayButtonTextStyle: widget.insideRangeDayButtonTextStyle,
          dayButtonTextStyle: widget.dayButtonTextStyle,
          dayButtonVariant: _mapButtonVariant(widget.dayButtonVariant),
          selectedDayButtonVariant: _mapButtonVariant(widget.selectedDayButtonVariant),
          insideRangeDayButtonVariant: _mapButtonVariant(
            widget.insideRangeDayButtonVariant,
          ),
          todayButtonVariant: _mapButtonVariant(widget.todayButtonVariant),
          gridMainAxisSpacing: widget.gridMainAxisSpacing,
          gridCrossAxisSpacing: widget.gridCrossAxisSpacing,
          dayButtonOutsideMonthTextStyle: widget.dayButtonOutsideMonthTextStyle,
          dayButtonOutsideMonthVariant: _mapButtonVariant(
            widget.dayButtonOutsideMonthVariant,
          ),
          selectedDayButtonOusideMonthVariant: _mapButtonVariant(
            widget.selectedDayButtonOusideMonthVariant,
          ),
          closeOnTapOutside: widget.closeOnTapOutside,
          anchor: widget.anchor,
          effects: widget.effects,
          shadows: widget.shadows,
          popoverDecoration: widget.popoverDecoration,
          filter: widget.filter,
          areaGroupId: widget.areaGroupId,
          useSameGroupIdForChild: widget.useSameGroupIdForChild,
          onPressed: widget.onPressed,
          onLongPress: widget.onLongPress,
          leading: widget.leading,
          trailing: widget.trailing,
          iconData: widget.iconData,
          buttonChild: widget.buttonChild,
          buttonVariant: _mapButtonVariant(widget.buttonVariant),
          size: _mapSize(widget.size),
          cursor: widget.cursor,
          width: widget.width,
          height: widget.height,
          buttonPadding: widget.buttonPadding,
          backgroundColor: widget.backgroundColor,
          hoverBackgroundColor: widget.hoverBackgroundColor,
          foregroundColor: widget.foregroundColor,
          hoverForegroundColor: widget.hoverForegroundColor,
          autofocus: widget.autofocus,
          buttonFocusNode: widget.buttonFocusNode,
          pressedBackgroundColor: widget.pressedBackgroundColor,
          pressedForegroundColor: widget.pressedForegroundColor,
          buttonShadows: widget.buttonShadows,
          gradient: widget.gradient,
          textDecoration: widget.textDecoration,
          hoverTextDecoration: widget.hoverTextDecoration,
          buttonDecoration: widget.buttonDecoration,
          statesController: widget.statesController,
          gap: widget.gap,
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          hoverStrategies: widget.hoverStrategies,
          onHoverChange: widget.onHoverChange,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onSecondaryTapDown: widget.onSecondaryTapDown,
          onSecondaryTapUp: widget.onSecondaryTapUp,
          onSecondaryTapCancel: widget.onSecondaryTapCancel,
          onLongPressStart: widget.onLongPressStart,
          onLongPressCancel: widget.onLongPressCancel,
          onLongPressUp: widget.onLongPressUp,
          onLongPressDown: widget.onLongPressDown,
          onLongPressEnd: widget.onLongPressEnd,
          onDoubleTap: widget.onDoubleTap,
          onDoubleTapDown: widget.onDoubleTapDown,
          onDoubleTapCancel: widget.onDoubleTapCancel,
          longPressDuration: widget.longPressDuration,
          textDirection: widget.textDirection,
          onFocusChange: widget.onFocusChange,
          expands: widget.expands,
          buttonTextStyle: widget.buttonTextStyle,
        );
    }
  }
}
