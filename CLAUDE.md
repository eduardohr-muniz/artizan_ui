# CLAUDE.md — Design System (`artizan_ui`)

> **TL;DR**
> - Pacote Flutter de design system: encapsula [`shadcn_ui`](https://pub.dev/packages/shadcn_ui) e re-exporta tudo no namespace **`DS*`**. Apps importam só `artizan_ui` e usam `DS*` exclusivamente.
> - Todo `DS*` é um **typedef de `Shad*`** ou um **wrapper StatefulWidget** que delega ao `Shad*` e adiciona comportamento Artizan.
> - Tokens semânticos via `context.dsColors`; tipografia via `context.dsTextTheme`.
> - Catálogo de componentes + exemplos de uso: skill **`ds-ui-flutter`**.

## O que é

`artizan_ui` empacota `shadcn_ui` sob o namespace `DS*` (Design System). Path do pacote: `/Volumes/External/projects/paipfood/workspace/projects/artizan_ui`.

## Comandos

```bash
# raiz do pacote
flutter pub get && flutter analyze && dart format . && flutter test
flutter test test/artizan_ui_test.dart       # um arquivo

# Widgetbook (explorador de componentes), em example/
cd example && flutter pub get
dart run build_runner build --delete-conflicting-outputs   # regenera main.directories.g.dart (após nova @widgetbook.UseCase)
flutter run
```

## Layout do pacote

```
lib/
  artizan_ui.dart          # único barrel export (o que os consumidores importam)
  src/
    app.dart               # DSApp = ShadApp
    type_defs.dart         # DSBorder = ShadBorder, etc.
    components/            # widgets DS* (um arquivo por componente)
    themes/                # DSTheme*, DSColorScheme*, DSTextTheme, paletas
    utils/                 # extensions de BuildContext
example/                   # Widgetbook (não publicado)
test/                      # testes do pacote
```

## Padrão DS* = Shad*

Todo símbolo `DS*` é um **typedef** do `Shad*` correspondente ou um **wrapper StatefulWidget** que delega ao `Shad*` e adiciona comportamento.

| DS | Shad subjacente |
|---|---|
| `DSApp` | `ShadApp` |
| `DSTheme` / `DSThemeData` | `ShadTheme` / `ShadThemeData` |
| `DSColorScheme` | `ShadColorScheme` |
| `DSTextTheme` | `ShadTextTheme` |
| `DSDecoration` | `ShadDecoration` |

`DSButton` e `DSTextFormField` são wrappers completos com lógica extra (ex.: `DSButton` gerencia o loading sozinho quando `onPressed` retorna `Future`).

## Theming

```dart
DSApp(
  theme: DSThemeData(colorScheme: const DSZincColorScheme.light(), brightness: Brightness.light),
  darkTheme: DSThemeData(colorScheme: const DSZincColorScheme.dark(), brightness: Brightness.dark),
  themeMode: ThemeMode.system,
  home: const MyPage(),
)
```

Color schemes built-in (todos com `.light()` e `.dark()`): `DSZinc`, `DSBlue`, `DSGray`, `DSGreen`, `DSNeutral`, `DSOrange`, `DSRed`, `DSRose`, `DSSlate`, `DSStone`, `DSViolet`, `DSYellow`, `DSPaip` (sufixo `ColorScheme`). Paleta totalmente custom: estenda `DSZincCustomColorScheme` (`lib/src/themes/color_scheme/zinc_custom.dart`).

## Tokens semânticos (`lib/src/themes/color_scheme/base.dart`)

`DSColorScheme` é uma classe abstrata (não typedef) que estende `ShadColorScheme` e adiciona campos tipados de status. Todos os schemes built-in a estendem.

| Campo | Default |
|---|---|
| `success` / `successForeground` | `#22c55e` / `#fafafa` |
| `warning` / `warningForeground` | `#f59e0b` / `#fafafa` |
| `info` / `infoForeground` | `#3b82f6` / `#fafafa` |

Acesso via `context.dsColors.success`, etc. Para tokens custom, estenda `DSColorScheme` e passe os overrides ao `super()`.

## Context extensions (`lib/src/utils/context_extension.dart`)

```dart
context.dsTextTheme    // DSTextTheme    — tipografia
context.dsColors       // DSColorScheme  — tokens base Shad + tokens semânticos DS (cast tipado)
context.isDarkTheme    // bool
context.isLightTheme   // bool
```

`context.dsColors` lança em runtime se o app usar um `ShadColorScheme` puro em vez de um `DSColorScheme`.

## Adicionar um componente

1. Crie `lib/src/components/<name>.dart` com o widget `DS<Name>`.
2. Exporte em `lib/src/components/z_components_export.dart`.
3. Adicione um use-case Widgetbook em `example/lib/src/<name>/`.
4. Rode `dart run build_runner build` de `example/`.

## Pacotes re-exportados

Consumidores de `artizan_ui` ganham sem adicionar ao próprio `pubspec.yaml`: `auto_form_validate` (`FormController`), `flutter_breakpoints`, `flutter_animate`, `lucide_icons_flutter` (`LucideIcons.<name>`).
