// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/src/foundation/colors_usecase.dart' as _i2;
import 'package:example/src/foundation/typography_usecase.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'foundation',
    children: [
      _i1.WidgetbookComponent(
        name: 'ColorTokens',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Palette',
            builder: _i2.colorPalette,
          ),
          _i1.WidgetbookUseCase(
            name: 'Semantic',
            builder: _i2.colorSemantic,
          ),
          _i1.WidgetbookUseCase(
            name: 'Surfaces',
            builder: _i2.colorSurfaces,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'Typography',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'All Tokens',
            builder: _i3.typographyAll,
          ),
          _i1.WidgetbookUseCase(
            name: 'Body',
            builder: _i3.typographyBody,
          ),
          _i1.WidgetbookUseCase(
            name: 'Display',
            builder: _i3.typographyDisplay,
          ),
          _i1.WidgetbookUseCase(
            name: 'Label',
            builder: _i3.typographyLabel,
          ),
          _i1.WidgetbookUseCase(
            name: 'Title',
            builder: _i3.typographyTitle,
          ),
        ],
      ),
    ],
  )
];
