part of 'theme_component.dart';

/// Evaluated button style
/// ** Padding  **
///[HaloSize.buttonPadding] padding of btn
/// ** Shape **
///[RoundedRectangleBorder] button shape with border
/// radius [HaloSize.buttonRadius]
/// ** Color **
/// active color [ColorScheme.primary] ,
/// disable color [ColorScheme.disableColor]
/// text Color [ColorScheme.onPrimary]
ButtonStyle getElevatedButtonStyle(
        ColorScheme colorScheme, Color backgroundColor) =>
    getHaloButtonStyle(colorScheme).copyWith(
        padding: buttonPadding,
        shape: buttonShape,
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableColor;
          } else if (states.contains(MaterialState.pressed)) {
            return Color.alphaBlend(
              colorScheme.onPrimary.withOpacity(0.12),
              backgroundColor,
            );
          }
          return backgroundColor;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableTextColor;
          }
          return colorScheme.onPrimary;
        }),
        overlayColor:
            MaterialStateProperty.all(backgroundColor.withOpacity(0.06)));

/// OutlineButton button style
/// ** Padding  **
///[HaloSize.buttonPadding] padding of btn
/// ** Shape **
///[RoundedRectangleBorder] button shape with border
/// radius [HaloSize.buttonRadius]
/// ** Color **
/// active color [ColorScheme.primary] ,
/// disable color [ColorScheme.disableColor]
/// text Color [ColorScheme.onPrimary]
ButtonStyle getOutlinedButtonStyle(ColorScheme colorScheme, Color color) =>
    getHaloButtonStyle(colorScheme).copyWith(
        padding: buttonPadding,
        shape: buttonShape,
        side: MaterialStateProperty.resolveWith<BorderSide?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) return null;
          return BorderSide(color: color);
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableTextColor;
          }
          return color;
        }),
        overlayColor: MaterialStateProperty.all(color.withOpacity(0.06)));

/// ========================== Component ============================
TextButtonThemeData haloTextButtonTheme(ColorScheme colorScheme) =>
    TextButtonThemeData(
      style: getHaloButtonStyle(colorScheme),
    );

OutlinedButtonThemeData haloOutlinedButtonTheme(ColorScheme colorScheme) =>
    OutlinedButtonThemeData(
        style: getHaloButtonStyle(colorScheme).copyWith(
      padding: buttonPadding,
      shape: buttonShape,
      side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return null;
        return BorderSide(color: colorScheme.outline);
      }),
    ));

ElevatedButtonThemeData haloElevatedButtonTheme(ColorScheme colorScheme) =>
    ElevatedButtonThemeData(
      style: getHaloButtonStyle(colorScheme).copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableColor;
          } else if (states.contains(MaterialState.pressed)) {
            return Color.alphaBlend(
                colorScheme.onPrimary.withOpacity(0.12), colorScheme.primary);
          }
          return colorScheme.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.disableTextColor;
          }
          return colorScheme.onPrimary;
        }),
        padding: buttonPadding,
        shape: buttonShape,
      ),
    );

ButtonStyle getHaloButtonStyle(ColorScheme colorScheme) => ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0.0),
      textStyle:
          MaterialStateProperty.all(haloTextTheme(colorScheme).labelLarge),
    );

MaterialStateProperty<EdgeInsetsGeometry?> get buttonPadding =>
    MaterialStateProperty.all(EdgeInsets.symmetric(
      horizontal: HaloSize.buttonPadding,
    ));

MaterialStateProperty<RoundedRectangleBorder?> get buttonShape =>
    MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(HaloSize.buttonRadius),
    ));

ButtonStyle getTextButtonStyle(ColorScheme colorScheme,
        {Color? foregroundColor,
        EdgeInsetsGeometry padding =
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        Size? minimumSize}) =>
    getHaloButtonStyle(colorScheme).copyWith(
      padding: MaterialStateProperty.all(padding),
      minimumSize: MaterialStateProperty.all(minimumSize),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.disableTextColor;
        }
        return foregroundColor ?? colorScheme.primary;
      }),
    );
