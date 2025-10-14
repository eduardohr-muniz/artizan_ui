import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:artizan_ui/artizan_ui.dart';

/// Typedef para o construtor da opção selecionada
typedef ArtSelectedOptionBuilder<T> = ShadSelectedOptionBuilder<T>;

/// Typedef para o construtor das opções múltiplas selecionadas
typedef ArtSelectedOptionsBuilder<T> = ShadSelectedOptionBuilder<List<T>>;

/// Base para ancoragem do popover
typedef ArtAnchorBase = ShadAnchorBase;

/// Controlador do popover
typedef ArtPopoverController = ShadPopoverController;

/// Controlador do select
typedef ArtSelectController<T> = ShadSelectController<T>;

/// Widget principal do ArtSelect
class ArtSelect<T> extends StatelessWidget {
  const ArtSelect({
    super.key,
    required this.selectedOptionBuilder,
    this.options,
    this.optionsBuilder,
    this.placeholder,
    this.onChanged,
    this.initialValue,
    this.enabled = true,
    this.validator,
    this.label,
    this.error,
    this.description,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.allowDeselection = false,
    this.closeOnSelect = true,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
    this.scrollController,
    this.anchor,
    this.filter,
    this.popoverController,
    this.header,
    this.footer,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.focusNode,
    this.controller,
    this.id,
    this.onSaved,
    this.onReset,
    this.valueTransformer,
    this.autovalidateMode,
    this.restorationId,
  });

  /// Construtor para o widget que renderiza a opção selecionada
  final ArtSelectedOptionBuilder<T> selectedOptionBuilder;

  /// Lista de opções do select
  final Iterable<Widget>? options;

  /// Construtor das opções do select
  final Widget? Function(BuildContext context, int index)? optionsBuilder;

  /// Widget de placeholder quando nenhuma opção está selecionada
  final Widget? placeholder;

  /// Callback chamado quando o valor é alterado
  final ValueChanged<T?>? onChanged;

  /// Valor inicial selecionado
  final T? initialValue;

  /// Se o select está habilitado
  final bool enabled;

  /// Função de validação
  final String? Function(T? value)? validator;

  /// Label do campo
  final Widget? label;

  /// Mensagem de erro
  final Widget? error;

  /// Descrição do campo
  final Widget? description;

  /// Se deve fechar ao clicar fora
  final bool closeOnTapOutside;

  /// Largura mínima
  final double? minWidth;

  /// Largura máxima
  final double? maxWidth;

  /// Altura máxima
  final double? maxHeight;

  /// Se permite deseleção
  final bool allowDeselection;

  /// Se deve fechar ao selecionar
  final bool closeOnSelect;

  /// Decoração personalizada
  final ArtDecoration? decoration;

  /// Widget trailing (final)
  final Widget? trailing;

  /// Padding interno
  final EdgeInsets? padding;

  /// Padding das opções
  final EdgeInsets? optionsPadding;

  /// Mostrar chevron para scroll para cima
  final bool? showScrollToTopChevron;

  /// Mostrar chevron para scroll para baixo
  final bool? showScrollToBottomChevron;

  /// Controlador de scroll
  final ScrollController? scrollController;

  /// Ancoragem do popover
  final ArtAnchorBase? anchor;

  /// Filtro de imagem
  final ImageFilter? filter;

  /// Controlador do popover
  final ArtPopoverController? popoverController;

  /// Header do select
  final Widget? header;

  /// Footer do select
  final Widget? footer;

  /// ID do grupo
  final Object? groupId;

  /// Número de itens
  final int? itemCount;

  /// Se deve encolher para caber
  final bool? shrinkWrap;

  /// Nó de foco
  final FocusNode? focusNode;

  /// Controlador do select
  final ArtSelectController<T>? controller;

  /// ID do campo
  final String? id;

  /// Callback para salvar
  final FormFieldSetter<T>? onSaved;

  /// Callback para reset
  final VoidCallback? onReset;

  /// Transformador de valor
  final ValueTransformer<T?>? valueTransformer;

  /// Modo de auto validação
  final AutovalidateMode? autovalidateMode;

  /// ID de restauração
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return ShadSelectFormField<T>(
      id: id,
      key: key,
      onSaved: onSaved,
      label: label,
      description: description,
      onChanged: onChanged,
      valueTransformer: valueTransformer,
      onReset: onReset,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      restorationId: restorationId,
      initialValue: initialValue,
      focusNode: focusNode,
      validator: validator,
      selectedOptionBuilder: selectedOptionBuilder,
      options: options,
      optionsBuilder: optionsBuilder,
      placeholder: placeholder,
      closeOnTapOutside: closeOnTapOutside,
      minWidth: minWidth,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      decoration: decoration,
      trailing: trailing,
      padding: padding,
      optionsPadding: optionsPadding,
      showScrollToTopChevron: showScrollToTopChevron,
      showScrollToBottomChevron: showScrollToBottomChevron,
      scrollController: scrollController,
      anchor: anchor,
      filter: filter,
      popoverController: popoverController,
      header: header,
      footer: footer,
      allowDeselection: allowDeselection,
      closeOnSelect: closeOnSelect,
      groupId: groupId,
      itemCount: itemCount,
      shrinkWrap: shrinkWrap,
      controller: controller,
    );
  }
}

/// Variante do ArtSelect com busca
class ArtSelectWithSearch<T> extends StatelessWidget {
  const ArtSelectWithSearch({
    super.key,
    required this.selectedOptionBuilder,
    required this.onSearchChanged,
    this.options,
    this.optionsBuilder,
    this.placeholder,
    this.onChanged,
    this.initialValue,
    this.enabled = true,
    this.validator,
    this.label,
    this.error,
    this.description,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.allowDeselection = false,
    this.closeOnSelect = true,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
    this.scrollController,
    this.anchor,
    this.filter,
    this.searchDivider,
    this.searchInputLeading,
    this.searchPlaceholder,
    this.searchPadding,
    this.search,
    this.clearSearchOnClose,
    this.popoverController,
    this.header,
    this.footer,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.focusNode,
    this.controller,
    this.id,
    this.onSaved,
    this.onReset,
    this.valueTransformer,
    this.autovalidateMode,
    this.restorationId,
  });

  final ArtSelectedOptionBuilder<T> selectedOptionBuilder;
  final ValueChanged<String> onSearchChanged;
  final Iterable<Widget>? options;
  final Widget? Function(BuildContext context, int index)? optionsBuilder;
  final Widget? placeholder;
  final ValueChanged<T?>? onChanged;
  final T? initialValue;
  final bool enabled;
  final String? Function(T?)? validator;
  final Widget? label;
  final Widget Function(String)? error;
  final Widget? description;
  final bool closeOnTapOutside;
  final double? minWidth;
  final double? maxWidth;
  final double? maxHeight;
  final bool allowDeselection;
  final bool closeOnSelect;
  final ArtDecoration? decoration;
  final Widget? trailing;
  final EdgeInsets? padding;
  final EdgeInsets? optionsPadding;
  final bool? showScrollToTopChevron;
  final bool? showScrollToBottomChevron;
  final ScrollController? scrollController;
  final ArtAnchorBase? anchor;
  final ImageFilter? filter;
  final Widget? searchDivider;
  final Widget? searchInputLeading;
  final Widget? searchPlaceholder;
  final EdgeInsets? searchPadding;
  final Widget? search;
  final bool? clearSearchOnClose;
  final ArtPopoverController? popoverController;
  final Widget? header;
  final Widget? footer;
  final Object? groupId;
  final int? itemCount;
  final bool? shrinkWrap;
  final FocusNode? focusNode;
  final ArtSelectController<T>? controller;
  final String? id;
  final FormFieldSetter<T>? onSaved;
  final VoidCallback? onReset;
  final ValueTransformer<T?>? valueTransformer;
  final AutovalidateMode? autovalidateMode;
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return ShadSelectFormField<T>.withSearch(
      id: id,
      key: key,
      onSaved: onSaved,
      label: label,
      description: description,
      onChanged: onChanged,
      valueTransformer: valueTransformer,
      onReset: onReset,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      restorationId: restorationId,
      initialValue: initialValue,
      focusNode: focusNode,
      validator: validator,
      selectedOptionBuilder: selectedOptionBuilder,
      options: options,
      optionsBuilder: optionsBuilder,
      onSearchChanged: onSearchChanged,
      placeholder: placeholder,
      closeOnTapOutside: closeOnTapOutside,
      minWidth: minWidth,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      decoration: decoration,
      trailing: trailing,
      padding: padding,
      optionsPadding: optionsPadding,
      showScrollToTopChevron: showScrollToTopChevron,
      showScrollToBottomChevron: showScrollToBottomChevron,
      scrollController: scrollController,
      anchor: anchor,
      filter: filter,
      searchDivider: searchDivider,
      searchInputLeading: searchInputLeading,
      searchPlaceholder: searchPlaceholder,
      searchPadding: searchPadding,
      search: search,
      clearSearchOnClose: clearSearchOnClose,
      popoverController: popoverController,
      header: header,
      footer: footer,
      allowDeselection: allowDeselection,
      closeOnSelect: closeOnSelect,
      groupId: groupId,
      itemCount: itemCount,
      shrinkWrap: shrinkWrap,
      controller: controller,
      error: error,
    );
  }
}

/// Variante do ArtSelect para seleção múltipla
class ArtSelectMultiple<T> extends StatelessWidget {
  const ArtSelectMultiple({
    super.key,
    required this.selectedOptionsBuilder,
    this.options,
    this.optionsBuilder,
    this.placeholder,
    this.onChanged,
    this.initialValue,
    this.enabled = true,
    this.validator,
    this.label,
    this.error,
    this.description,
    this.closeOnTapOutside = true,
    this.minWidth,
    this.maxWidth,
    this.maxHeight,
    this.allowDeselection = true,
    this.closeOnSelect = true,
    this.decoration,
    this.trailing,
    this.padding,
    this.optionsPadding,
    this.showScrollToTopChevron,
    this.showScrollToBottomChevron,
    this.scrollController,
    this.anchor,
    this.filter,
    this.popoverController,
    this.header,
    this.footer,
    this.groupId,
    this.itemCount,
    this.shrinkWrap,
    this.focusNode,
    this.controller,
    this.id,
    this.onSaved,
    this.onReset,
    this.valueTransformer,
    this.autovalidateMode,
    this.restorationId,
  });

  final ArtSelectedOptionsBuilder<T> selectedOptionsBuilder;
  final Iterable<Widget>? options;
  final Widget? Function(BuildContext context, int index)? optionsBuilder;
  final Widget? placeholder;
  final ValueChanged<List<T>?>? onChanged;
  final List<T>? initialValue;
  final bool enabled;
  final String? Function(List<T>? value)? validator;
  final Widget? label;
  final Widget Function(String error)? error;
  final Widget? description;
  final bool closeOnTapOutside;
  final double? minWidth;
  final double? maxWidth;
  final double? maxHeight;
  final bool allowDeselection;
  final bool closeOnSelect;
  final ArtDecoration? decoration;
  final Widget? trailing;
  final EdgeInsets? padding;
  final EdgeInsets? optionsPadding;
  final bool? showScrollToTopChevron;
  final bool? showScrollToBottomChevron;
  final ScrollController? scrollController;
  final ArtAnchorBase? anchor;
  final ImageFilter? filter;
  final ArtPopoverController? popoverController;
  final Widget? header;
  final Widget? footer;
  final Object? groupId;
  final int? itemCount;
  final bool? shrinkWrap;
  final FocusNode? focusNode;
  final ArtSelectController<T>? controller;
  final String? id;
  final FormFieldSetter<List<T>>? onSaved;
  final VoidCallback? onReset;
  final ValueTransformer<List<T>?>? valueTransformer;
  final AutovalidateMode? autovalidateMode;
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return ShadSelectMultipleFormField<T>(
      id: id,
      key: key,
      onSaved: onSaved,
      label: label,
      description: description,
      onChanged: onChanged,
      valueTransformer: valueTransformer,
      onReset: onReset,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      restorationId: restorationId,
      initialValue: initialValue,
      focusNode: focusNode,
      validator: validator,
      selectedOptionsBuilder: selectedOptionsBuilder,
      options: options,
      optionsBuilder: optionsBuilder,
      placeholder: placeholder,
      closeOnTapOutside: closeOnTapOutside,
      minWidth: minWidth,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      decoration: decoration,
      trailing: trailing,
      padding: padding,
      optionsPadding: optionsPadding,
      showScrollToTopChevron: showScrollToTopChevron,
      showScrollToBottomChevron: showScrollToBottomChevron,
      scrollController: scrollController,
      anchor: anchor,
      filter: filter,
      popoverController: popoverController,
      header: header,
      footer: footer,
      closeOnSelect: closeOnSelect,
      allowDeselection: allowDeselection,
      controller: controller,
      error: error,
    );
  }
}

class ArtOption<T> extends StatelessWidget {
  final T value;
  final Widget child;
  final Color? hoveredBackgroundColor;
  final EdgeInsets? padding;
  final Widget? selectedIcon;
  final BorderRadius? radius;
  final OrderPolicy<Widget>? orderPolicy;
  final TextDirection? direction;

  const ArtOption({super.key, required this.value, required this.child, this.hoveredBackgroundColor, this.padding, this.selectedIcon, this.radius, this.orderPolicy, this.direction});

  @override
  Widget build(BuildContext context) {
    return ShadOption<T>(value: value, hoveredBackgroundColor: hoveredBackgroundColor, padding: padding, selectedIcon: selectedIcon, radius: radius, orderPolicy: orderPolicy, direction: direction, child: child);
  }
}
