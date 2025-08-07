import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes disponíveis para o widget ArtSeparator
enum ArtSeparatorVariant {
  vertical(ShadSeparatorVariant.vertical),
  horizontal(ShadSeparatorVariant.horizontal);

  final ShadSeparatorVariant shadVariant;

  const ArtSeparatorVariant(this.shadVariant);
}

/// Widget personalizável que suporta separadores horizontais e verticais
///
/// Tipicamente usado para separar conteúdo ou seções de linhas, colunas ou listas.
class ArtSeparator extends StatelessWidget {
  /// Cria um separador vertical
  const ArtSeparator.vertical({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ArtSeparatorVariant.vertical;

  /// Cria um separador horizontal
  const ArtSeparator.horizontal({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = ArtSeparatorVariant.horizontal;

  /// Cria um separador com uma variante especificada
  const ArtSeparator.raw({
    this.margin,
    this.thickness,
    this.color,
    required this.variant,
    this.radius,
    super.key,
  });

  /// A margem (ou espaço) ao redor do separador
  final EdgeInsets? margin;

  /// A espessura do separador
  /// Controla a altura do separador horizontal e a largura do separador vertical
  final double? thickness;

  /// A cor do separador
  final Color? color;

  /// A variante do separador
  final ArtSeparatorVariant variant;

  /// A quantidade de raio para a borda do separador
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    return ShadSeparator.raw(
      margin: margin,
      thickness: thickness,
      color: color,
      variant: variant.shadVariant,
      radius: radius,
    );
  }
}
