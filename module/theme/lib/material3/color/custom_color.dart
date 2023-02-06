import 'package:flutter/material.dart';

const orange = Color(0xFFFF8002);
const green = Color(0xFF28A65A);
const yellow = Color(0xFFF9A400);


CustomColors lightCustomColors = const CustomColors(
  sourceOrange: Color(0xFFFF8002),
  orange: Color(0xFFFF8002),
  onOrange: Color(0xFFFFFFFF),
  orangeContainer: Color(0xFFFFDCC7),
  onOrangeContainer: Color(0xFF311300),
  sourceGreen: Color(0xFF28A65A),
  green: Color(0xFF006D35),
  onGreen: Color(0xFFFFFFFF),
  greenContainer: Color(0x14006D35),
  onGreenContainer: Color(0xFF00210C),
  sourceYellow: Color(0xFFF9A400),
  yellow: Color(0xFF835400),
  onYellow: Color(0xFFFFFFFF),
  yellowContainer: Color(0xFFFFDDB5),
  onYellowContainer: Color(0xFF2A1800),
);

CustomColors darkCustomColors = const CustomColors(
  sourceOrange: Color(0xFFFF8002),
  orange: Color(0xFFFFB787),
  onOrange: Color(0xFF512400),
  orangeContainer: Color(0xFF723600),
  onOrangeContainer: Color(0xFFFFDCC7),
  sourceGreen: Color(0xFF28A65A),
  green: Color(0xFF67DD8A),
  onGreen: Color(0xFF003919),
  greenContainer: Color(0xFF005227),
  onGreenContainer: Color(0xFF84FBA4),
  sourceYellow: Color(0xFFF9A400),
  yellow: Color(0xFFFFB956),
  onYellow: Color(0xFF462B00),
  yellowContainer: Color(0xFF643F00),
  onYellowContainer: Color(0xFFFFDDB5),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceOrange,
    required this.orange,
    required this.onOrange,
    required this.orangeContainer,
    required this.onOrangeContainer,
    required this.sourceGreen,
    required this.green,
    required this.onGreen,
    required this.greenContainer,
    required this.onGreenContainer,
    required this.sourceYellow,
    required this.yellow,
    required this.onYellow,
    required this.yellowContainer,
    required this.onYellowContainer,
  });

  final Color? sourceOrange;
  final Color? orange;
  final Color? onOrange;
  final Color? orangeContainer;
  final Color? onOrangeContainer;
  final Color? sourceGreen;
  final Color? green;
  final Color? onGreen;
  final Color? greenContainer;
  final Color? onGreenContainer;
  final Color? sourceYellow;
  final Color? yellow;
  final Color? onYellow;
  final Color? yellowContainer;
  final Color? onYellowContainer;

  @override
  CustomColors copyWith({
    Color? sourceOrange,
    Color? orange,
    Color? onOrange,
    Color? orangeContainer,
    Color? onOrangeContainer,
    Color? sourceGreen,
    Color? green,
    Color? onGreen,
    Color? greenContainer,
    Color? onGreenContainer,
    Color? sourceYellow,
    Color? yellow,
    Color? onYellow,
    Color? yellowContainer,
    Color? onYellowContainer,
  }) {
    return CustomColors(
      sourceOrange: sourceOrange ?? this.sourceOrange,
      orange: orange ?? this.orange,
      onOrange: onOrange ?? this.onOrange,
      orangeContainer: orangeContainer ?? this.orangeContainer,
      onOrangeContainer: onOrangeContainer ?? this.onOrangeContainer,
      sourceGreen: sourceGreen ?? this.sourceGreen,
      green: green ?? this.green,
      onGreen: onGreen ?? this.onGreen,
      greenContainer: greenContainer ?? this.greenContainer,
      onGreenContainer: onGreenContainer ?? this.onGreenContainer,
      sourceYellow: sourceYellow ?? this.sourceYellow,
      yellow: yellow ?? this.yellow,
      onYellow: onYellow ?? this.onYellow,
      yellowContainer: yellowContainer ?? this.yellowContainer,
      onYellowContainer: onYellowContainer ?? this.onYellowContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceOrange: Color.lerp(sourceOrange, other.sourceOrange, t),
      orange: Color.lerp(orange, other.orange, t),
      onOrange: Color.lerp(onOrange, other.onOrange, t),
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t),
      onOrangeContainer: Color.lerp(onOrangeContainer, other.onOrangeContainer, t),
      sourceGreen: Color.lerp(sourceGreen, other.sourceGreen, t),
      green: Color.lerp(green, other.green, t),
      onGreen: Color.lerp(onGreen, other.onGreen, t),
      greenContainer: Color.lerp(greenContainer, other.greenContainer, t),
      onGreenContainer: Color.lerp(onGreenContainer, other.onGreenContainer, t),
      sourceYellow: Color.lerp(sourceYellow, other.sourceYellow, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      onYellow: Color.lerp(onYellow, other.onYellow, t),
      yellowContainer: Color.lerp(yellowContainer, other.yellowContainer, t),
      onYellowContainer: Color.lerp(onYellowContainer, other.onYellowContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
    );
  }
}