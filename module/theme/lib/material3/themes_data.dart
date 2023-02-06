import 'package:flutter/material.dart';
import 'package:theme/material3/color/custom_color.dart';
import 'm3_theme_lib.dart';

class AppThemes {
  static ThemeData get haloLightTheme =>
      getTheme(M3Colors.lightColorScheme, false);

  static ThemeData get haloDarkTheme =>
      getTheme(M3Colors.darkColorScheme, true);

  static ThemeData getTheme(ColorScheme colorScheme, bool isDark) {
    return ThemeData(
      useMaterial3: true,
      // fontFamily: 'Roboto',
      ///colors
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      brightness: isDark ? Brightness.dark : Brightness.light,
      backgroundColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      dialogBackgroundColor: colorScheme.surface,
      bottomAppBarColor: colorScheme.surface,
      indicatorColor: colorScheme.primary,
      // divider color is outline
      dividerColor: colorScheme.outline,
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        thickness: 1,
      ),
      extensions: [isDark ? darkCustomColors : lightCustomColors],

      ///text
      textTheme: haloTextTheme(colorScheme),

      ///buttons
      textButtonTheme: haloTextButtonTheme(colorScheme),
      outlinedButtonTheme: haloOutlinedButtonTheme(colorScheme),
      elevatedButtonTheme: haloElevatedButtonTheme(colorScheme),

      ///app bar
      appBarTheme: haloAppBarTheme(colorScheme, isDark),

      ///bottom bar
      bottomAppBarTheme: haloBottomAppBarTheme(colorScheme, isDark),
      bottomNavigationBarTheme: haloBottomNavigationBarTheme(colorScheme),

      /// chip
      chipTheme: haloChipTheme(colorScheme),

      ///others
      iconTheme: haloIconTheme(colorScheme),
      radioTheme: haloRadioTheme(colorScheme),
      checkboxTheme: haloCheckboxTheme(colorScheme),
      // switchTheme: haloSwitchTheme(colorScheme),
      ///tab bar
      tabBarTheme: haloTabBarTheme(colorScheme),

      ///FAB
      floatingActionButtonTheme: haloFABTheme(colorScheme),

      ///input, text field
      inputDecorationTheme: inputDecoration(colorScheme, isDark),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.onSurfaceVariant,
      ),

      /// card
      cardTheme: haloCardTheme(colorScheme),
    );
  }

  static inputDecoration(ColorScheme colorScheme, bool isDark) {
    return InputDecorationTheme(
      fillColor: isDark ? Colors.white : Colors.white,
      filled: true,
      contentPadding: EdgeInsets.all(HaloSize.textFieldPadding),
      hintStyle: const TextStyle().regular.copyWith(
            fontSize: HaloFontSize.bodyMedium,
            color: colorScheme.onSurface,
          ),
      labelStyle: textFocusable(colorScheme, true).copyWith(
        fontSize: HaloFontSize.bodySmall,
        color: colorScheme.onSurface,
      ),
      floatingLabelStyle: textFocusable(colorScheme, false).copyWith(
        letterSpacing: 1.3,
        fontSize: HaloFontSize.bodySmall,
      ),
      border: getTextFieldBorder(colorScheme.outline),
      enabledBorder: getTextFieldBorder(colorScheme.outline),
      // onSurface 8%
      disabledBorder:
          getTextFieldBorder(colorScheme.onSurface.withOpacity(0.08)),
      focusedBorder: getTextFieldBorder(colorScheme.primary, focused: true),
      errorBorder: getTextFieldBorder(colorScheme.error),
      errorStyle: textFocusable(colorScheme, false).copyWith(
        fontSize: HaloFontSize.bodySmall,
        color: colorScheme.error,
      ),
      focusedErrorBorder: getTextFieldBorder(colorScheme.error, focused: true),
    );
  }

  static haloCardTheme(ColorScheme colorScheme) => CardTheme(
        color: colorScheme.surface,
        margin: EdgeInsets.all(HaloSize.spacing),
        shape: HaloShape.cardShape,
        surfaceTintColor: colorScheme.surface,
        elevation: 2,
      );

  static haloSwitchTheme(ColorScheme colorScheme) => SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.disableTextColor;
        }),
        thumbColor: MaterialStateProperty.all(colorScheme.surface),
      );

  static haloRadioTheme(ColorScheme colorScheme) => RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
        overlayColor: MaterialStateProperty.all(colorScheme.secondaryContainer),
      );
  static haloIconTheme(ColorScheme colorScheme) =>
      IconThemeData(color: colorScheme.onSurface);

  static haloFABTheme(ColorScheme colorScheme) => FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      );
}

/// textFormField Base
MaterialStateTextStyle textFocusable(ColorScheme colorScheme, bool disable) {
  return MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
    final isFocus = states.contains(MaterialState.focused);
    final Color color = states.contains(MaterialState.error)
        ? colorScheme.error
        : isFocus
            ? colorScheme.primary
            : colorScheme.onSurface;
    return const TextStyle().regular.copyWith(
          fontSize: HaloFontSize.bodyMedium,
          color: disable ? color.withOpacity(0.12) : color,
        );
  });
}
