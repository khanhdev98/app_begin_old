part of 'theme_component.dart';

ChipThemeData haloChipTheme(ColorScheme colorScheme) => ChipThemeData(
  elevation: 0,
  pressElevation: 0,
  labelStyle: haloTextTheme(colorScheme).labelLarge?.copyWith(color: colorScheme.onSecondaryContainer),
  labelPadding: EdgeInsets.symmetric(horizontal: HaloSize.chipPadding),
  padding: EdgeInsets.symmetric(horizontal: HaloSize.chipPadding,
      vertical: HaloSize.chipPadding),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(HaloSize.chipRadius),
  ),
  side: MaterialStateBorderSide.resolveWith(((Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const BorderSide(color: Colors.transparent);
    }
    if (states.contains(MaterialState.disabled)) {
      return BorderSide(color: colorScheme.disableColor);
    }
    return BorderSide(color: colorScheme.outline);
  })),
);