import 'dart:math' as math;
import 'package:artizan_ui/artizan_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Controller para gerenciar a seleção de abas no [ArtTabs].
class ArtTabsController<T> extends ChangeNotifier {
  /// Cria um [ArtTabsController] com um valor inicial selecionado.
  ArtTabsController({required T value}) : selected = value;

  T selected;

  /// Seleciona o valor fornecido.
  ///
  /// Retorna true se o valor foi alterado, false caso contrário.
  bool select(T value) {
    if (value == selected) return false;
    selected = value;
    notifyListeners();
    return true;
  }
}

/// Widget que exibe uma série horizontal de abas com conteúdo associado.
///
/// Suporta layouts roláveis e não roláveis, estilização personalizada e gerenciamento de estado.
class ArtTabs<T> extends StatefulWidget implements PreferredSizeWidget {
  /// Cria um [ArtTabs].
  const ArtTabs({super.key, this.value, required this.tabs, this.controller, this.gap, this.scrollable, this.dragStartBehavior, this.physics, this.padding, this.decoration, this.tabBarConstraints, this.contentConstraints, this.expandContent, this.restorationId, this.onChanged})
    : assert((value != null) ^ (controller != null), 'Either value or controller must be provided');

  /// A aba atualmente selecionada.
  final T? value;

  /// As abas para exibir.
  final List<ArtTab<T>> tabs;

  /// O controlador das abas.
  final ArtTabsController<T>? controller;

  /// O espaçamento entre a barra de abas e o conteúdo.
  final double? gap;

  /// Se as abas devem ser roláveis, padrão é false.
  final bool? scrollable;

  /// O comportamento de início de arrasto das abas.
  final DragStartBehavior? dragStartBehavior;

  /// A física das abas.
  final ScrollPhysics? physics;

  /// O preenchimento das abas.
  final EdgeInsets? padding;

  /// A decoração das abas.
  final ShadDecoration? decoration;

  /// As restrições da barra de abas.
  final BoxConstraints? tabBarConstraints;

  /// As restrições do conteúdo.
  final BoxConstraints? contentConstraints;

  /// Se o conteúdo deve ser expandido.
  final bool? expandContent;

  /// O ID de restauração.
  final String? restorationId;

  /// O callback que é chamado quando o valor das abas muda.
  final ValueChanged<T>? onChanged;

  @override
  State<ArtTabs<T>> createState() => _ArtTabsState<T>();

  @override
  Size get preferredSize {
    var maxHeight = 0.0;
    for (final tab in tabs) {
      final itemHeight = tab.preferredSize.height;
      maxHeight = math.max(itemHeight, maxHeight);
    }
    return Size.fromHeight(maxHeight);
  }
}

class _ArtTabsState<T> extends State<ArtTabs<T>> {
  late List<GlobalKey> _tabKeys;
  late List<T> orderedValues;
  ArtTabsController<T>? _internalController;

  ArtTabsController<T> get controller => widget.controller ?? _internalController!;

  late final scrollController = ScrollController();

  bool get scrollable => widget.scrollable ?? false;

  @override
  void initState() {
    super.initState();
    _tabKeys = widget.tabs.map((_) => GlobalKey()).toList();
    if (widget.controller == null) {
      _internalController = ArtTabsController<T>(value: widget.value as T);
    }
    orderedValues = widget.tabs.map((e) => e.value).toList();
  }

  @override
  void didUpdateWidget(covariant ArtTabs<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller == null && oldWidget.controller != null) {
      _internalController = ArtTabsController<T>(value: oldWidget.controller!.selected);
    } else if (widget.controller != null && oldWidget.controller == null) {
      _internalController?.dispose();
      _internalController = null;
    }

    if (widget.tabs.length > _tabKeys.length) {
      final delta = widget.tabs.length - _tabKeys.length;
      _tabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
    } else if (widget.tabs.length < _tabKeys.length) {
      _tabKeys.removeRange(widget.tabs.length, _tabKeys.length);
    }

    if (!listEquals(widget.tabs, oldWidget.tabs)) {
      orderedValues = widget.tabs.map((e) => e.value).toList();
    }

    // Atualiza o controlador se o valor mudou.
    if (widget.value is T && widget.controller == null && controller.selected != widget.value) {
      controller.select(widget.value as T);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    _internalController?.dispose();
    super.dispose();
  }

  ShadButtonSize? _mapSize(ArtButtonSize? size) {
    if (size == null) return null;
    return switch (size) {
      ArtButtonSize.regular => ShadButtonSize.regular,
      ArtButtonSize.sm => ShadButtonSize.sm,
      ArtButtonSize.lg => ShadButtonSize.lg,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ShadTabs<T>(
      value: controller.selected,
      tabs:
          widget.tabs
              .map(
                (artTab) => ShadTab<T>(
                  value: artTab.value,
                  content: artTab.content,
                  leading: artTab.leading,
                  trailing: artTab.trailing,
                  enabled: artTab.enabled,
                  flex: artTab.flex,
                  height: artTab.height,
                  width: artTab.width,
                  backgroundColor: artTab.backgroundColor,
                  selectedBackgroundColor: artTab.selectedBackgroundColor,
                  hoverBackgroundColor: artTab.hoverBackgroundColor,
                  selectedHoverBackgroundColor: artTab.selectedHoverBackgroundColor,
                  padding: artTab.padding,
                  decoration: artTab.decoration,
                  selectedDecoration: artTab.selectedDecoration,
                  foregroundColor: artTab.foregroundColor,
                  selectedForegroundColor: artTab.selectedForegroundColor,
                  textStyle: artTab.textStyle,
                  shadows: artTab.shadows,
                  selectedShadows: artTab.selectedShadows,
                  focusNode: artTab.focusNode,
                  onPressed: artTab.onPressed,
                  onLongPress: artTab.onLongPress,
                  size: _mapSize(artTab.size),
                  cursor: artTab.cursor,
                  hoverForegroundColor: artTab.hoverForegroundColor,
                  autofocus: artTab.autofocus,
                  pressedBackgroundColor: artTab.pressedBackgroundColor,
                  pressedForegroundColor: artTab.pressedForegroundColor,
                  gradient: artTab.gradient,
                  textDecoration: artTab.textDecoration,
                  hoverTextDecoration: artTab.hoverTextDecoration,
                  statesController: artTab.statesController,
                  mainAxisAlignment: artTab.mainAxisAlignment,
                  crossAxisAlignment: artTab.crossAxisAlignment,
                  hoverStrategies: artTab.hoverStrategies,
                  onHoverChange: artTab.onHoverChange,
                  onTapDown: artTab.onTapDown,
                  onTapUp: artTab.onTapUp,
                  onTapCancel: artTab.onTapCancel,
                  onLongPressStart: artTab.onLongPressStart,
                  onLongPressCancel: artTab.onLongPressCancel,
                  onLongPressUp: artTab.onLongPressUp,
                  onLongPressDown: artTab.onLongPressDown,
                  onLongPressEnd: artTab.onLongPressEnd,
                  onDoubleTap: artTab.onDoubleTap,
                  onDoubleTapDown: artTab.onDoubleTapDown,
                  onDoubleTapCancel: artTab.onDoubleTapCancel,
                  longPressDuration: artTab.longPressDuration,
                  child: artTab.child,
                ),
              )
              .toList(),
      gap: widget.gap,
      scrollable: widget.scrollable,
      dragStartBehavior: widget.dragStartBehavior,
      physics: widget.physics,
      padding: widget.padding,
      decoration: widget.decoration,
      tabBarConstraints: widget.tabBarConstraints,
      contentConstraints: widget.contentConstraints,
      expandContent: widget.expandContent,
      restorationId: widget.restorationId,
      onChanged: (value) {
        controller.select(value);
        widget.onChanged?.call(value);
      },
    );
  }
}

/// Representa um único item de aba dentro de um widget [ArtTabs].
///
/// Inclui propriedades para estilização, conteúdo e manipulação de interação.
class ArtTab<T> extends StatelessWidget implements PreferredSizeWidget {
  /// Cria um [ArtTab].
  const ArtTab({
    super.key,
    required this.value,
    required this.child,
    this.content,
    this.leading,
    this.trailing,
    this.enabled = true,
    this.flex = 1,
    this.height,
    this.width,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.hoverBackgroundColor,
    this.selectedHoverBackgroundColor,
    this.padding,
    this.decoration,
    this.selectedDecoration,
    this.foregroundColor,
    this.selectedForegroundColor,
    this.textStyle,
    this.shadows,
    this.selectedShadows,
    this.focusNode,
    this.onPressed,
    this.onLongPress,
    this.size,
    this.cursor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
  });

  /// O valor associado a esta aba, usado para seleção e identificação.
  final T value;

  /// O widget para exibir como o rótulo da aba, tipicamente um widget [Text].
  final Widget child;

  /// O widget para exibir como o conteúdo associado a esta aba.
  ///
  /// Exibido quando a aba está selecionada.
  final Widget? content;

  /// Um widget para exibir no início da aba, frequentemente um [Icon].
  final Widget? leading;

  /// Um widget para exibir no final da aba.
  final Widget? trailing;

  /// Se a aba está habilitada e pode ser selecionada.
  ///
  /// Padrão é true.
  final bool enabled;

  /// Fator flex para a aba quando faz parte de um [Row] em um [ArtTabs] não rolável.
  ///
  /// Ignorado quando [ArtTabs] é rolável. Padrão é 1.
  final int flex;

  /// Altura da aba.
  ///
  /// Padrão é 32.
  final double? height;

  /// Largura da aba.
  ///
  /// Em [ArtTabs] não rolável, padrão é `double.infinity`. Em [ArtTabs] rolável,
  /// padrão é null, permitindo que a aba se ajuste ao seu conteúdo.
  final double? width;

  /// Cor de fundo da aba quando não selecionada.
  ///
  /// Padrão é `Colors.transparent`.
  final Color? backgroundColor;

  /// Cor de fundo da aba quando selecionada.
  ///
  /// Padrão é a cor de fundo do tema.
  final Color? selectedBackgroundColor;

  /// Cor de fundo quando hover.
  ///
  /// Padrão é [backgroundColor].
  final Color? hoverBackgroundColor;

  /// Cor de fundo quando selecionada e hover.
  ///
  /// Padrão é [selectedBackgroundColor].
  final Color? selectedHoverBackgroundColor;

  /// Preenchimento dentro da aba.
  ///
  /// Padrão é `EdgeInsets.symmetric(horizontal: 12, vertical: 6)`.
  final EdgeInsets? padding;

  /// Decoração para a aba quando não selecionada.
  ///
  /// Usa [ShadDecoration].
  final ArtDecoration? decoration;

  /// Decoração para a aba quando selecionada.
  ///
  /// Padrão é [decoration]. Usa [ShadDecoration].
  final ArtDecoration? selectedDecoration;

  /// Cor do primeiro plano (cor do texto/ícone) quando não selecionada.
  ///
  /// Padrão é a cor do primeiro plano do tema.
  final Color? foregroundColor;

  /// Cor do primeiro plano quando selecionada.
  ///
  /// Padrão é [foregroundColor].
  final Color? selectedForegroundColor;

  /// Estilo de texto para o rótulo da aba.
  ///
  /// Padrão é o estilo de texto pequeno do tema.
  final TextStyle? textStyle;

  /// Sombras para a aba quando não selecionada.
  ///
  /// Padrão são sombras pequenas ([ShadShadows.sm]).
  final List<BoxShadow>? shadows;

  /// Sombras para a aba quando selecionada.
  ///
  /// Padrão são sombras pequenas ([ShadShadows.sm]).
  final List<BoxShadow>? selectedShadows;

  /// Nó de foco para controlar o estado de foco da aba.
  ///
  /// Se null, um [FocusNode] interno é criado.
  final FocusNode? focusNode;

  /// Callback para eventos de toque na aba.
  final VoidCallback? onPressed;

  /// Callback para eventos de toque longo na aba.
  final VoidCallback? onLongPress;

  /// Configuração de tamanho para a aba, usa [ShadButtonSize].
  final ArtButtonSize? size;

  /// Cursor do mouse ao passar o mouse sobre a aba.
  final MouseCursor? cursor;

  /// Cor do primeiro plano quando hover.
  final Color? hoverForegroundColor;

  /// Se a aba deve focar automaticamente na construção.
  ///
  /// Padrão é false.
  final bool autofocus;

  /// Cor de fundo quando pressionada.
  final Color? pressedBackgroundColor;

  /// Cor do primeiro plano quando pressionada.
  final Color? pressedForegroundColor;

  /// Gradiente de fundo para a aba.
  final Gradient? gradient;

  /// Decoração de texto para o rótulo da aba.
  final TextDecoration? textDecoration;

  /// Decoração de texto quando hover.
  final TextDecoration? hoverTextDecoration;

  /// Controlador de estados personalizado para gerenciar estados da aba.
  final ShadStatesController? statesController;

  /// Alinhamento principal do botão.
  final MainAxisAlignment? mainAxisAlignment;

  /// Alinhamento cruzado do botão.
  final CrossAxisAlignment? crossAxisAlignment;

  /// Estratégias de hover do botão.
  final ShadHoverStrategies? hoverStrategies;

  /// Callback para mudanças de hover.
  final ValueChanged<bool>? onHoverChange;

  /// Callback para toque para baixo.
  final ValueChanged<TapDownDetails>? onTapDown;

  /// Callback para toque para cima.
  final ValueChanged<TapUpDetails>? onTapUp;

  /// Callback para cancelamento de toque.
  final VoidCallback? onTapCancel;

  /// Callback para início de toque longo.
  final ValueChanged<LongPressStartDetails>? onLongPressStart;

  /// Callback para cancelamento de toque longo.
  final VoidCallback? onLongPressCancel;

  /// Callback para toque longo para cima.
  final VoidCallback? onLongPressUp;

  /// Callback para toque longo para baixo.
  final ValueChanged<LongPressDownDetails>? onLongPressDown;

  /// Callback para fim de toque longo.
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;

  /// Callback para duplo toque.
  final VoidCallback? onDoubleTap;

  /// Callback para duplo toque para baixo.
  final ValueChanged<TapDownDetails>? onDoubleTapDown;

  /// Callback para cancelamento de duplo toque.
  final VoidCallback? onDoubleTapCancel;

  /// Duração do toque longo.
  final Duration? longPressDuration;

  @override
  Widget build(BuildContext context) {
    // Este widget é apenas uma definição de dados
    // A renderização real é feita pelo ArtTabs
    return const SizedBox.shrink();
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(height ?? 32);
  }
}
