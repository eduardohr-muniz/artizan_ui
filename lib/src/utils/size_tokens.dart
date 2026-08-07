// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/widgets.dart';

/// Design tokens de dimensão.
/// Grade base 4px: s04=4 · s08=8 · s12=12 · s16=16 · s20=20 · s24=24 ·
/// s32=32 · s36=36 · s40=40 · s44=44 · s48=48 · s52=52 · s64=64 · s68=68 · s72=72 · s80=80
/// Passos Fibonacci (legado): s21=21 (spacer) · s34=34 · s55=55 · s89=89 · s144=144
/// none=0

class DSSize {
  DSSize._();
  static double none = 0;
  static double s04 = 4;
  static double s08 = 8;
  static double s12 = 12;
  static double s16 = 16;
  static double s20 = 20;
  static double s21 = 21;
  static double spacer = 21;
  static double s24 = 24;
  static double s32 = 32;
  static double s34 = 34;
  static double s36 = 36;
  static double s40 = 40;
  static double s44 = 44;
  static double s48 = 48;
  static double s52 = 52;
  static double s55 = 55;
  static double s64 = 64;
  static double s68 = 68;
  static double s72 = 72;
  static double s80 = 80;
  static double s89 = 89;
  static double s144 = 144;
}

const double _spacerValue = 1;

extension ExtensionFromDouble on num {
  double get value => this * _spacerValue;

  SizedBox get sizedBoxH => SizedBox(height: _spacerValue * this);
  SizedBox get sizedBoxW => SizedBox(width: _spacerValue * this);
  SizedBox get sizedBoxHW =>
      SizedBox(height: _spacerValue * this, width: _spacerValue * this);

  EdgeInsets get paddingLeft => EdgeInsets.fromLTRB(_spacerValue * this, 0, 0, 0);
  EdgeInsets get paddingTop => EdgeInsets.fromLTRB(0, _spacerValue * this, 0, 0);
  EdgeInsets get paddingRight => EdgeInsets.fromLTRB(0, 0, _spacerValue * this, 0);
  EdgeInsets get paddingBottom => EdgeInsets.fromLTRB(0, 0, 0, _spacerValue * this);
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: _spacerValue * this);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: _spacerValue * this);
  EdgeInsets get paddingAll => EdgeInsets.all(_spacerValue * this);

  BorderRadius get borderRadiusTopLeft =>
      BorderRadius.only(topLeft: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusTopRight =>
      BorderRadius.only(topRight: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusBottomLeft =>
      BorderRadius.only(bottomLeft: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusBottomRight =>
      BorderRadius.only(bottomRight: Radius.circular(_spacerValue * this));
  BorderRadius get borderRadiusAll =>
      BorderRadius.all(Radius.circular(_spacerValue * this));
}
