import 'package:flutter/material.dart';
import 'package:theme/material3/color/custom_color.dart';
import 'package:theme/material3/constant/sizes.dart';

class HaloSpacing {
  /// size 4
  static get xxSmall => SizedBox.square(
        dimension: HaloSize.spacingXXS * HaloSize.sizeScale,
      );

  /// size 8
  static get xSmall => SizedBox.square(
        dimension: HaloSize.spacingXS * HaloSize.sizeScale,
      );

  /// size 12
  static get small => SizedBox.square(
        dimension: HaloSize.spacingS * HaloSize.sizeScale,
      );

  /// size 16
  static get normal => SizedBox.square(dimension: HaloSize.spacing * HaloSize.sizeScale);

  /// size 20
  static get large => SizedBox.square(
        dimension: HaloSize.spacingL * HaloSize.sizeScale,
      );

  /// size 24
  static get xLarge => SizedBox.square(
        dimension: HaloSize.spacingXL * HaloSize.sizeScale,
      );

  /// size 32
  static get xxLarge => SizedBox.square(dimension: HaloSize.spacingXXL * HaloSize.sizeScale);
}

class HaloDivider {
  static get horizontal => const Divider(
        height: 1,
      );

  static get withPadding => Divider(
        height: 1,
        indent: HaloSize.padding * HaloSize.sizeScale,
        endIndent: HaloSize.padding * HaloSize.sizeScale,
      );

  static get vertical => const VerticalDivider(
        width: 1,
      );
}

/// ================================================================================================
class HaloPadding {
  static get all => EdgeInsets.all(HaloSize.padding * HaloSize.sizeScale);

  static get horizontal => EdgeInsets.symmetric(horizontal: HaloSize.padding * HaloSize.sizeScale);

  static get vertical => EdgeInsets.symmetric(vertical: HaloSize.padding * HaloSize.sizeScale);

  static get top => EdgeInsets.only(top: HaloSize.padding * HaloSize.sizeScale);

  static get bottom => EdgeInsets.only(bottom: HaloSize.padding * HaloSize.sizeScale);

  static get left => EdgeInsets.only(left: HaloSize.padding * HaloSize.sizeScale);

  static get right => EdgeInsets.only(right: HaloSize.padding * HaloSize.sizeScale);

  static get noTop => EdgeInsets.all(HaloSize.padding * HaloSize.sizeScale).copyWith(top: 0);

  static get noBottom => EdgeInsets.all(HaloSize.padding * HaloSize.sizeScale).copyWith(bottom: 0);

  static get noLeft => EdgeInsets.all(HaloSize.padding * HaloSize.sizeScale).copyWith(left: 0);

  static get noRight => EdgeInsets.all(HaloSize.padding * HaloSize.sizeScale).copyWith(right: 0);

  static paddingAll(double size) => EdgeInsets.all(size * HaloSize.sizeScale);

  static paddingHorizontal(double size) =>
      EdgeInsets.symmetric(horizontal: size * HaloSize.sizeScale);

  static paddingVertical(double size) => EdgeInsets.symmetric(vertical: size * HaloSize.sizeScale);

  static paddingTop(double size) => EdgeInsets.only(top: size * HaloSize.sizeScale);

  static paddingBottom(double size) => EdgeInsets.only(bottom: size * HaloSize.sizeScale);

  static paddingLeft(double size) => EdgeInsets.only(left: size * HaloSize.sizeScale);

  static paddingRight(double size) => EdgeInsets.only(right: size * HaloSize.sizeScale);

  static paddingNoTop(double size) => EdgeInsets.all(size * HaloSize.sizeScale).copyWith(top: 0);

  static paddingNoBottom(double size) =>
      EdgeInsets.all(size * HaloSize.sizeScale).copyWith(bottom: 0);

  static paddingNoLeft(double size) => EdgeInsets.all(size * HaloSize.sizeScale).copyWith(left: 0);

  static paddingNoRight(double size) =>
      EdgeInsets.all(size * HaloSize.sizeScale).copyWith(right: 0);
}

/// ================================================================================================
class HaloShape {
  static get cardShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HaloSize.cardRadius),
      );

  static get zeroBorderShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      );
}

/// ================================================================================================
class HaloShadow {
  static get boxShadowTop => [
        BoxShadow(
            color: Colors.black.withOpacity(0.06),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1))
      ];

  static get boxShadow =>
      [BoxShadow(color: Colors.black.withOpacity(0.06), spreadRadius: 5, blurRadius: 5)];
}
