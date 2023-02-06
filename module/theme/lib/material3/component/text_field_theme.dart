part of 'theme_component.dart';

@Deprecated('message')
InputDecorationTheme haloInputDecorationTheme(ColorScheme colorScheme) =>
    InputDecorationTheme(
      contentPadding: EdgeInsets.all(HaloSize.textFieldPadding),
      hintStyle: const TextStyle().regular.copyWith(
            fontSize: HaloFontSize.bodyMedium,
            color: colorScheme.onSurface,
          ),
      labelStyle: const TextStyle().regular.copyWith(
            fontSize: HaloFontSize.bodyMedium,
            color: colorScheme.onSurface,
          ),
      border: getTextFieldBorder(colorScheme.outline),
      enabledBorder: getTextFieldBorder(colorScheme.outline),
      disabledBorder:
          getTextFieldBorder(colorScheme.onSurfaceVariant.withOpacity(0.12)),
      focusedBorder: getTextFieldBorder(colorScheme.primary, focused: true),
      errorBorder: getTextFieldBorder(colorScheme.error),
      focusedErrorBorder: getTextFieldBorder(colorScheme.error, focused: true),
      errorStyle: const TextStyle().regular.copyWith(
            fontSize: HaloFontSize.bodySmall,
            color: colorScheme.error,
          ),
      floatingLabelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        final isFocus = states.contains(MaterialState.focused);
        final Color color = states.contains(MaterialState.error)
            ? colorScheme.error
            : isFocus
                ? colorScheme.primary
                : colorScheme.onSurface;
        return TextStyle(color: color, letterSpacing: 1.3);
      }),
    );

@Deprecated('message')
InputDecoration get textFieldNoBorder => InputDecoration(
      contentPadding: EdgeInsets.all(HaloSize.textFieldPadding),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    );

@Deprecated('message')
InputBorder? getTextFieldBorder(Color borderColor, {bool focused = false}) =>
    OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: (focused ? 2 : 1) * HaloSize.outlineWidth,
      ),
      borderRadius: BorderRadius.circular(HaloSize.outlineRadius),
    );

@Deprecated('message')
InputDecoration textFieldCircleBorder(ColorScheme colorScheme) =>
    InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          horizontal: HaloSize.textFieldPadding, vertical: 13),
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.outline, width: HaloSize.outlineWidth),
        borderRadius: BorderRadius.circular(HaloSize.outlineRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.outline, width: HaloSize.outlineWidth),
        borderRadius: BorderRadius.circular(HaloSize.outlineRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.outline.withOpacity(0.06),
            width: HaloSize.outlineWidth),
        borderRadius: BorderRadius.circular(HaloSize.outlineRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.primary, width: HaloSize.outlineWidth * 2),
        borderRadius: BorderRadius.circular(HaloSize.outlineRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: colorScheme.error, width: HaloSize.outlineWidth),
        borderRadius: BorderRadius.circular(HaloSize.outlineRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: colorScheme.error, width: HaloSize.outlineWidth * 2),
        borderRadius: BorderRadius.circular(HaloSize.outlineRadius),
      ),
    );
