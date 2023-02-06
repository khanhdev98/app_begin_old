part of 'theme_component.dart';

TabBarTheme haloTabBarTheme(ColorScheme colorScheme) => ThemeData.fallback().tabBarTheme.copyWith(
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      labelColor: colorScheme.primary,
      labelStyle: haloTextTheme(colorScheme).titleMedium,
      unselectedLabelStyle: haloTextTheme(colorScheme).titleMedium,
      indicator: HaloTabIndicator(
        borderSide: BorderSide(color: colorScheme.primary, width: 3),
        indicatorWidth: 40,
      ),
    );
