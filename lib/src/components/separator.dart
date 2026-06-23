import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Variantes disponíveis para o widget DSSeparator
enum DSSeparatorVariant {
  vertical(ShadSeparatorVariant.vertical),
  horizontal(ShadSeparatorVariant.horizontal);

  final ShadSeparatorVariant shadVariant;

  const DSSeparatorVariant(this.shadVariant);
}

/// Widget personalizável que suporta separadores horizontais e verticais
///
/// Tipicamente usado para separar conteúdo ou seções de linhas, colunas ou listas.
class DSSeparator extends StatelessWidget {
  /// Cria um separador vertical
  const DSSeparator.vertical({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = DSSeparatorVariant.vertical;

  /// Cria um separador horizontal
  const DSSeparator.horizontal({
    this.margin,
    this.thickness,
    this.color,
    this.radius,
    super.key,
  }) : variant = DSSeparatorVariant.horizontal;

  /// Cria um separador com uma variante especificada
  const DSSeparator.raw({
    required this.variant,
    this.margin,
    this.thickness,
    this.color,
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
  final DSSeparatorVariant variant;

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
