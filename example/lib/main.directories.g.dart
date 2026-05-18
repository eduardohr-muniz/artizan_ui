// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/src/actions/button_usecase.dart' as _i2;
import 'package:example/src/actions/icon_button_usecase.dart' as _i3;
import 'package:example/src/feedback/alert_usecase.dart' as _i4;
import 'package:example/src/feedback/empty_state_usecase.dart' as _i5;
import 'package:example/src/feedback/progress_usecase.dart' as _i6;
import 'package:example/src/feedback/toast_usecase.dart' as _i7;
import 'package:example/src/forms/controls_usecase.dart' as _i8;
import 'package:example/src/forms/date_picker_usecase.dart' as _i9;
import 'package:example/src/forms/select_usecase.dart' as _i10;
import 'package:example/src/forms/text_field_usecase.dart' as _i11;
import 'package:example/src/foundation/colors_usecase.dart' as _i12;
import 'package:example/src/foundation/typography_usecase.dart' as _i13;
import 'package:example/src/layout/card_usecase.dart' as _i15;
import 'package:example/src/layout/separator_badge_usecase.dart' as _i14;
import 'package:example/src/navigation/breadcrumb_usecase.dart' as _i16;
import 'package:example/src/navigation/segmented_usecase.dart' as _i17;
import 'package:example/src/navigation/tabs_usecase.dart' as _i18;
import 'package:example/src/overlay/dialog_usecase.dart' as _i19;
import 'package:example/src/overlay/popover_tooltip_usecase.dart' as _i20;
import 'package:example/src/overlay/sheet_usecase.dart' as _i21;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'actions',
    children: [
      _i1.WidgetbookComponent(
        name: 'DsButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'All Variants',
            builder: _i2.buttonAllVariants,
          ),
          _i1.WidgetbookUseCase(
            name: 'Async',
            builder: _i2.buttonAsync,
          ),
          _i1.WidgetbookUseCase(
            name: 'Darken',
            builder: _i2.buttonDarken,
          ),
          _i1.WidgetbookUseCase(
            name: 'Loading',
            builder: _i2.buttonLoading,
          ),
          _i1.WidgetbookUseCase(
            name: 'Primary',
            builder: _i2.buttonPrimary,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'DsIconButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'All Variants',
            builder: _i3.iconButtonAllVariants,
          ),
          _i1.WidgetbookUseCase(
            name: 'Loading',
            builder: _i3.iconButtonLoading,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'feedback',
    children: [
      _i1.WidgetbookComponent(
        name: 'DsAlert',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'All Variants',
            builder: _i4.alertAllVariants,
          ),
          _i1.WidgetbookUseCase(
            name: 'Destructive',
            builder: _i4.alertDestructive,
          ),
          _i1.WidgetbookUseCase(
            name: 'Success',
            builder: _i4.alertSuccess,
          ),
          _i1.WidgetbookUseCase(
            name: 'Warning',
            builder: _i4.alertWarning,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'DsEmptyState',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i5.emptyStateDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'In Table',
            builder: _i5.emptyStateInTable,
          ),
          _i1.WidgetbookUseCase(
            name: 'Minimal',
            builder: _i5.emptyStateMinimal,
          ),
          _i1.WidgetbookUseCase(
            name: 'Small',
            builder: _i5.emptyStateSmall,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'DsProgress',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Determinate',
            builder: _i6.progressDeterminate,
          ),
          _i1.WidgetbookUseCase(
            name: 'Indeterminate',
            builder: _i6.progressIndeterminate,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsSonner',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i7.sonnerDefault,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsToast',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i7.toastDefault,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'forms',
    children: [
      _i1.WidgetbookComponent(
        name: 'DsControls',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Checkbox',
            builder: _i8.controlCheckbox,
          ),
          _i1.WidgetbookUseCase(
            name: 'Slider',
            builder: _i8.controlSlider,
          ),
          _i1.WidgetbookUseCase(
            name: 'Switch',
            builder: _i8.controlSwitch,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'DsDatePicker',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Range',
            builder: _i9.datePickerRange,
          ),
          _i1.WidgetbookUseCase(
            name: 'Single',
            builder: _i9.datePickerSingle,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsInputOtp',
        useCase: _i1.WidgetbookUseCase(
          name: 'OTP Input',
          builder: _i9.otpInput,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'DsSelect',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i10.selectDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'With Search',
            builder: _i10.selectWithSearch,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'DsTextField',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i11.textFieldDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'Form',
            builder: _i11.textFieldForm,
          ),
          _i1.WidgetbookUseCase(
            name: 'Underline',
            builder: _i11.textFieldUnderline,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'foundation',
    children: [
      _i1.WidgetbookComponent(
        name: 'DsColorTokens',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Palette',
            builder: _i12.colorPalette,
          ),
          _i1.WidgetbookUseCase(
            name: 'Semantic',
            builder: _i12.colorSemantic,
          ),
          _i1.WidgetbookUseCase(
            name: 'Surfaces',
            builder: _i12.colorSurfaces,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'DsTypeScale',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'All Tokens',
            builder: _i13.typeScaleAll,
          ),
          _i1.WidgetbookUseCase(
            name: 'Body',
            builder: _i13.typeScaleBody,
          ),
          _i1.WidgetbookUseCase(
            name: 'Display',
            builder: _i13.typeScaleDisplay,
          ),
          _i1.WidgetbookUseCase(
            name: 'Label',
            builder: _i13.typeScaleLabel,
          ),
          _i1.WidgetbookUseCase(
            name: 'Title',
            builder: _i13.typeScaleTitle,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'layout',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'DsBadge',
        useCase: _i1.WidgetbookUseCase(
          name: 'All Variants',
          builder: _i14.badgeAllVariants,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'DsCard',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i15.cardDefault,
          ),
          _i1.WidgetbookUseCase(
            name: 'With Leading',
            builder: _i15.cardWithLeading,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsSeparator',
        useCase: _i1.WidgetbookUseCase(
          name: 'Separator',
          builder: _i14.separatorDefault,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'navigation',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'DsBreadcrumb',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i16.breadcrumbDefault,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsSegmented',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i17.segmentedDefault,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsSegmentedBadge',
        useCase: _i1.WidgetbookUseCase(
          name: 'Badge',
          builder: _i17.segmentedBadge,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsTabs',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i18.tabsDefault,
        ),
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'overlay',
    children: [
      _i1.WidgetbookComponent(
        name: 'DsDialog',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Alert',
            builder: _i19.dialogAlert,
          ),
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i19.dialogDefault,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsPopover',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i20.popoverDefault,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'DsSheet',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Edit Profile',
            builder: _i21.sheetEditProfile,
          ),
          _i1.WidgetbookUseCase(
            name: 'Invite Member',
            builder: _i21.sheetInviteMember,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'DsTooltip',
        useCase: _i1.WidgetbookUseCase(
          name: 'Tooltip',
          builder: _i20.tooltipDefault,
        ),
      ),
    ],
  ),
];
