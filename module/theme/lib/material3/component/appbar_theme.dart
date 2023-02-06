part of 'theme_component.dart';

AppBarTheme haloAppBarTheme(ColorScheme colorScheme, bool isDark) =>
    (isDark ? ThemeData.dark() : ThemeData.light()).appBarTheme.copyWith(
          elevation: 0.5,
          scrolledUnderElevation: 2,
          toolbarHeight: HaloSize.appBarHeight,
          shadowColor: colorScheme.shadow,
          centerTitle: true,
          systemOverlayStyle: getSystemOverlay(isDark),
          titleTextStyle: haloTextTheme(colorScheme).titleLarge?.bold,
          color: colorScheme.surface,
          surfaceTintColor: colorScheme.surface,
          iconTheme: AppThemes.haloIconTheme(colorScheme),
        );

BottomAppBarTheme haloBottomAppBarTheme(ColorScheme colorScheme, bool isDark) =>
    (isDark ? ThemeData.dark() : ThemeData.light()).bottomAppBarTheme.copyWith(
          elevation: 0.5,
          color: colorScheme.surface,
        );

BottomNavigationBarThemeData haloBottomNavigationBarTheme(ColorScheme colorScheme) =>
    BottomNavigationBarThemeData(
      elevation: 0.5,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface,
    );

SystemUiOverlayStyle getSystemOverlay(bool isDark) {
  return (isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark).copyWith(
    statusBarColor: Colors.transparent,
  );
}
