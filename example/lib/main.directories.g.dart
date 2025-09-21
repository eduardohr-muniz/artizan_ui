// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/src/buttons/buttons_usecase.dart' as _i2;
import 'package:example/src/buttons/icon_buttons_usecase.dart' as _i4;
import 'package:example/src/empty_state/exmpty_state_usecase.dart' as _i3;
import 'package:example/src/field/form_field.dart' as _i5;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookComponent(
        name: 'ArtButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Destructive',
            builder: _i2.destructiveButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Ghost',
            builder: _i2.ghostButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Icon',
            builder: _i2.iconButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Link',
            builder: _i2.linkButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Outline',
            builder: _i2.outlineButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Primary',
            builder: _i2.primaryButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Raw',
            builder: _i2.rawButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Secondary',
            builder: _i2.secondaryButton,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'ArtEmptyState',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'InTable',
            builder: _i3.emptyStateInTable,
          ),
          _i1.WidgetbookUseCase(
            name: 'Minimal',
            builder: _i3.emptyStateMinimal,
          ),
          _i1.WidgetbookUseCase(
            name: 'Non Table',
            builder: _i3.emptyStateInList,
          ),
          _i1.WidgetbookUseCase(
            name: 'Small',
            builder: _i3.emptyStateInCard,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'ArtIconButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Destructive',
            builder: _i4.destructiveButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Ghost',
            builder: _i4.ghostButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Icon',
            builder: _i4.iconButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Outline',
            builder: _i4.outlineButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Primary',
            builder: _i4.primaryButton,
          ),
          _i1.WidgetbookUseCase(
            name: 'Secondary',
            builder: _i4.secondaryButton,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'ArtTextFormField',
        useCase: _i1.WidgetbookUseCase(
          name: 'FormField',
          builder: _i5.emptyStateInTable,
        ),
      ),
    ],
  )
];
