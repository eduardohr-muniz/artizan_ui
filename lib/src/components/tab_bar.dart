import 'package:ds_ui/ds_ui.dart';
import 'package:flutter/material.dart';

/// Provê o [TabController] para os [DSTabBar]/[DSTabBarView] descendentes —
/// alias de [DefaultTabController] do Material.
typedef DSDefaultTabBarController = DefaultTabController;

/// Área de conteúdo que troca conforme a aba selecionada — alias de [TabBarView]
/// do Material. Pareie com o [DSTabBar].
typedef DSTabBarView = TabBarView;

/// Um item de aba do [DSTabBar]. Recebe apenas o [text] (e, opcionalmente, um
/// [icon]). É mapeado internamente para um [Tab] do Material.
///
/// > Nome distinto de `DSTab` de propósito: `DSTab` já pertence ao [DSTabs]
/// > (estilo pílula/segmentado).
class DSTabBarItem {
  const DSTabBarItem(this.text, {this.icon});

  /// O rótulo da aba.
  final String text;

  /// Ícone opcional exibido junto ao rótulo.
  final Widget? icon;
}

/// Barra de abas no estilo Material (indicador inferior deslizante) com a
/// identidade do design system: indicador arredondado com um leve **glow**
/// (brilho sutil) na cor de destaque, sem divisória nem efeito de toque (ripple).
///
/// Diferente do [DSTabs] — que tem aparência de "pílula"/segmentada e gerencia o
/// próprio conteúdo —, o [DSTabBar] é para **navegação por abas no topo** de uma
/// tela, com o conteúdo trocado por um [DSTabBarView]. Como o [TabBar] do
/// Material, requer um [TabController] (via [controller]) ou um
/// [DSDefaultTabBarController] ancestral.
///
/// ```dart
/// DSDefaultTabBarController(
///   length: 2,
///   child: Column(
///     children: [
///       const DSTabBar(tabs: [DSTabBarItem('Overview'), DSTabBarItem('History')]),
///       const Expanded(
///         child: DSTabBarView(children: [OverviewPage(), HistoryPage()]),
///       ),
///     ],
///   ),
/// )
/// ```
class DSTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DSTabBar({
    required this.tabs,
    this.controller,
    this.onTap,
    this.isScrollable = true,
    this.tabAlignment = TabAlignment.start,
    this.indicatorColor,
    this.labelColor,
    this.labelStyle,
    this.labelPadding = const EdgeInsets.only(right: 21),
    this.padding = const EdgeInsets.only(right: 21),
    this.indicatorPadding = const EdgeInsets.symmetric(vertical: 4),
    this.indicatorWeight = 2.3,
    this.indicatorRadius = 4,
    this.glow = true,
    this.height,
    super.key,
  });

  /// As abas a exibir.
  final List<DSTabBarItem> tabs;

  /// Controla a aba selecionada. Se nulo, usa o [DSDefaultTabBarController] ancestral.
  final TabController? controller;

  /// Chamado quando uma aba é tocada, com o índice tocado.
  final ValueChanged<int>? onTap;

  /// Se as abas rolam horizontalmente. Padrão `true` (necessário para alinhar à
  /// esquerda via [tabAlignment]).
  final bool isScrollable;

  /// Alinhamento das abas. Padrão [TabAlignment.start] (à esquerda).
  final TabAlignment tabAlignment;

  /// Cor do indicador (e do glow). Padrão: `ring`.
  final Color? indicatorColor;

  /// Cor do rótulo selecionado. Padrão: `foreground`.
  final Color? labelColor;

  /// Estilo do rótulo selecionado. Padrão: `dsTextTheme.titleSmall`.
  final TextStyle? labelStyle;

  /// Espaçamento horizontal de cada rótulo. Padrão: `EdgeInsets.only(right: 21)`.
  final EdgeInsetsGeometry? labelPadding;

  /// Preenchimento da barra de abas. Padrão: `EdgeInsets.only(right: 21)`.
  final EdgeInsetsGeometry? padding;

  /// Preenchimento aplicado ao indicador. Padrão: `EdgeInsets.symmetric(vertical: 4)`.
  final EdgeInsets indicatorPadding;

  /// Espessura da linha do indicador. Padrão `2.3`.
  final double indicatorWeight;

  /// Raio das pontas arredondadas do indicador. Padrão `4`.
  final double indicatorRadius;

  /// Liga o brilho sutil sob o indicador. Padrão `true`.
  final bool glow;

  /// Altura preferida da barra (para uso como `AppBar.bottom`). Padrão
  /// [kTextTabBarHeight].
  final double? height;

  @override
  Size get preferredSize => Size.fromHeight(height ?? kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    final accent = indicatorColor ?? context.dsColors.ring;
    return TabBar(
      controller: controller,
      onTap: onTap,
      isScrollable: isScrollable,
      tabAlignment: tabAlignment,
      tabs: [for (final item in tabs) Tab(text: item.text, icon: item.icon)],
      // Identidade do DS: sem divisória, sem ripple, sem ajuste automático de cor.
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      enableFeedback: false,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      automaticIndicatorColorAdjustment: false,
      labelColor: labelColor ?? context.dsColors.foreground,
      labelStyle: labelStyle ?? context.dsTextTheme.titleSmall,
      labelPadding: labelPadding,
      padding: padding,
      indicatorPadding: indicatorPadding,
      indicator: DSTabBarIndicator(color: accent, strokeWidth: indicatorWeight, radius: Radius.circular(indicatorRadius), glow: glow),
    );
  }
}

/// Indicador de aba do [DSTabBar]: linha inferior arredondada com um glow sutil.
/// Exposto para quem quiser usar um [TabBar] do Material com o mesmo indicador.
class DSTabBarIndicator extends Decoration {
  const DSTabBarIndicator({required this.color, this.strokeWidth = 2.3, this.radius = const Radius.circular(4), this.glow = true});

  /// Cor da linha (e do glow).
  final Color color;

  /// Espessura da linha.
  final double strokeWidth;

  /// Raio das pontas.
  final Radius radius;

  /// Liga o brilho sutil sob a linha.
  final bool glow;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _DSTabBarIndicatorPainter(this);
}

class _DSTabBarIndicatorPainter extends BoxPainter {
  _DSTabBarIndicatorPainter(this.decoration);

  final DSTabBarIndicator decoration;

  /// Opacidade do glow — baixa de propósito, para um brilho discreto.
  static const _glowAlpha = 0.35;

  /// Sigma do blur do glow — pequeno, para não "vazar" além da linha.
  static const _glowBlur = 3.0;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size ?? Size.zero;
    final top = offset.dy + size.height - decoration.strokeWidth;
    final rect = Rect.fromLTWH(offset.dx, top, size.width, decoration.strokeWidth);
    final line = RRect.fromRectAndRadius(rect, decoration.radius);

    if (decoration.glow) {
      canvas.drawRRect(
        line,
        Paint()
          ..color = decoration.color.withValues(alpha: _glowAlpha)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, _glowBlur),
      );
    }
    canvas.drawRRect(line, Paint()..color = decoration.color);
  }
}
