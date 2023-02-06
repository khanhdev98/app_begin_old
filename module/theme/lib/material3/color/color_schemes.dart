import 'package:flutter/material.dart';
import 'package:theme/material3/color/custom_color.dart';

import 'color_tonal_palette.dart';

class M3Colors {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF24A8D8),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFC0E8FF),
    onPrimaryContainer: Color(0xFF001E2B),
    secondary: Color(0xFF273C92),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD0E6F3),
    onSecondaryContainer: Color(0xFF273C92),
    tertiary: Color(0xFF5E5A7D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFE4DFFF),
    onTertiaryContainer: Color(0xFF1B1736),
    error: Color(0xFFEE5253),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    //todo Design không thấy định nghĩa màu này . Chỉ thấy đặt trong layout
    background: Color(0xFFE1E2E5),
    onBackground: Color(0xFF191C1E),
    outline: Color(0xFFC0C7CD),
    surface: Color(0xFFFBFCFE),
    onSurface: Color(0xFF191C1E),
    surfaceVariant: Color(0xFFDCE3E9),
    onSurfaceVariant: Color(0xFF40484C),
    onInverseSurface: Color.fromARGB(255, 240, 241, 243),
    inverseSurface: Color(0xFF2E3133),
    inversePrimary: Color(0xFF70D2FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006686),
  );

  static const ColorTonalPalette neutral = ColorTonalPalette(
    0xFF5C5F61,
    <int, Color>{
      20: Color(0xFF2E3133),
      30: Color(0xFF444749),
      40: Color(0xFF5C5F61),
      50: Color(0xFF757779),
      60: Color(0xFF8F9193),
      70: Color(0xFFAAABAD),
      80: Color(0xFFC5C6C9),
      90: Color(0xFFE1E2E5),
      95: Color(0xFFF0F1F3),
    },
  );

  static const ColorTonalPalette neutralVariant = ColorTonalPalette(
    0xFF585F64,
    <int, Color>{
      20: Color(0xFF151D21),
      40: Color(0xFF2A3136),
      50: Color(0xFF585F64),
      60: Color(0xFF8A9297),
      70: Color(0xFFA5ACB2),
      80: Color(0xFFC0C7CD),
      95: Color(0xFFEAF2F7),
    },
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF70D2FF),
    onPrimary: Color(0xFF003547),
    primaryContainer: Color(0xFF004D66),
    onPrimaryContainer: Color(0xFFC0E8FF),
    secondary: Color(0xFFB5CAD6),
    onSecondary: Color(0xFF1F333D),
    secondaryContainer: Color(0xFF364954),
    onSecondaryContainer: Color(0xFFD0E6F3),
    tertiary: Color(0xFFC8C2EA),
    onTertiary: Color(0xFF302C4C),
    tertiaryContainer: Color(0xFF464364),
    onTertiaryContainer: Color(0xFFE4DFFF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1E),
    onBackground: Color(0xFFE1E2E5),
    surface: Color(0xFF2B2E30),
    onSurface: Color(0xFFE1E2E5),
    surfaceVariant: Color(0xFF40484C),
    onSurfaceVariant: Color(0xFFC0C7CD),
    outline: Color(0xFF999999),
    onInverseSurface: Color(0xFF191C1E),
    inverseSurface: Color(0xFFE1E2E5),
    inversePrimary: Color(0xFF006686),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF70D2FF),
  );
}

extension HaloColorScheme on ColorScheme {
  Color get disableTextColor => onSurface.withOpacity(0.38);
  Color get disableColor => onSurface.withOpacity(0.02);
}

extension ColorBuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  CustomColors get customColors =>
      Theme.of(this).extension<CustomColors>() ??
      (Theme.of(this).brightness == Brightness.light
          ? lightCustomColors
          : darkCustomColors);

  Color get primaryColor => colorScheme.primary;

  Color get primaryContainerColor => colorScheme.primaryContainer;

  Color get onPrimaryColor => colorScheme.onPrimary;

  Color get surfaceColor => colorScheme.surface;

  Color get onSurfaceColor => colorScheme.onSurface;

  Color get onSurfaceVariant => colorScheme.onSurfaceVariant;

  Color get backgroundColor => colorScheme.background;

  Color get outlineColor => colorScheme.outline;

  Color get surface1 =>
      Color.alphaBlend(primaryColor.withOpacity(0.05), surfaceColor);

  Color get surface2 =>
      Color.alphaBlend(primaryColor.withOpacity(0.08), surfaceColor);

  Color get surface3 =>
      Color.alphaBlend(primaryColor.withOpacity(0.11), surfaceColor);

  Color get disableTextColor => colorScheme.disableTextColor;

  Color get disableColor => colorScheme.disableColor;

  Color get surfaceGray =>
      Color.alphaBlend(colorScheme.onSurface.withOpacity(0.04), surfaceColor);

  ///Red
  Color get red => colorScheme.error;

  Color get onRed => colorScheme.onError;

  Color get redContainer => colorScheme.errorContainer;

  Color get onRedContainer => colorScheme.onErrorContainer;

  ///Orange
  Color get orangeColor => customColors.sourceOrange!;

  Color get onOrange => customColors.onOrange!;

  Color get onOrangeContainer => customColors.onOrangeContainer!;

  Color get orangeContainer => customColors.orangeContainer!;

  ///Green
  Color get greenColor => customColors.sourceGreen!;

  Color get onGreen => customColors.onGreen!;

  Color get greenContainer => customColors.greenContainer!;

  Color get onGreenContainer => customColors.onGreenContainer!;

  ///Yellow
  Color get yellowColor => customColors.sourceYellow!;

  Color get onYellow => customColors.onYellow!;

  Color get yellowContainer => customColors.yellowContainer!;

  Color get onYellowContainer => customColors.onYellowContainer!;
}
