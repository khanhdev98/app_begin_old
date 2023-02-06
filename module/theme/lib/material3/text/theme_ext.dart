import 'package:flutter/material.dart';
import 'package:theme/material3/color/color_schemes.dart';
import 'package:theme/material3/constant/sizes.dart';

extension FontStyleExtension on TextStyle {
  //BuildContext? get context => HaloSize.context;

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get regular => copyWith(fontWeight: FontWeight.normal);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle setColor(Color color) => copyWith(color: color);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get priceSmall => copyWith(fontSize: HaloFontSize.priceSmall);

  TextStyle get priceMedium => copyWith(fontSize: HaloFontSize.priceMedium);

  TextStyle get priceLarge => copyWith(fontSize: HaloFontSize.priceLarge);

  /// set color for Text
  TextStyle get notice => copyWith(color: M3Colors.lightColorScheme.error);

  TextStyle get onNotice => copyWith(color: M3Colors.lightColorScheme.onError);

  TextStyle get primary => copyWith(color: M3Colors.lightColorScheme.primary);

  TextStyle get onPrimary => copyWith(color: M3Colors.lightColorScheme.onPrimary);

  TextStyle get secondary => copyWith(color: M3Colors.lightColorScheme.secondary);

  ///black text
  TextStyle get normal => copyWith(color: M3Colors.lightColorScheme.onSurface);

  ///gray text
  TextStyle get body => copyWith(color: M3Colors.lightColorScheme.onSurfaceVariant);

  TextStyle get disable => copyWith(color: M3Colors.lightColorScheme.disableTextColor);

  TextStyle get red => copyWith(color: M3Colors.lightColorScheme.error);

  TextStyle get onRed => copyWith(color: M3Colors.lightColorScheme.onError);

  TextStyle get onRedContainer => copyWith(color: M3Colors.lightColorScheme.onErrorContainer);

}

extension TextBuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get _colorScheme => Theme.of(this).colorScheme;

  TextStyle? get displayLarge => textTheme.displayLarge;

  TextStyle? get displayMedium => textTheme.displayMedium;

  TextStyle? get displaySmall => textTheme.displaySmall;

  TextStyle? get headlineLarge => textTheme.headlineLarge;

  TextStyle? get headlineMedium => textTheme.headlineMedium;

  TextStyle? get headlineSmall => textTheme.headlineSmall;

  TextStyle? get titleLarge => textTheme.titleLarge;

  TextStyle? get titleMedium => textTheme.titleMedium;

  TextStyle? get titleSmall => textTheme.titleSmall;

  TextStyle? get bodyLarge => textTheme.bodyLarge;

  TextStyle? get bodyMedium => textTheme.bodyMedium;

  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get labelLarge => textTheme.labelLarge;

  TextStyle? get labelMedium => textTheme.labelMedium;

  TextStyle? get labelSmall => textTheme.labelSmall;

  TextStyle? get buttonText => textTheme.labelLarge;

  TextStyle? get priceText => textTheme.titleMedium?.copyWith(fontSize: HaloFontSize.priceMedium);

  TextStyle? get chip => textTheme.labelLarge;

  TextStyle? get fab => textTheme.labelLarge;

  TextStyle? get cardHeader => textTheme.titleMedium;

  TextStyle? get cardSubhead => textTheme.bodyMedium;

  TextStyle? get cardTitle => textTheme.bodyLarge?.copyWith(color: _colorScheme.onSurface);

  TextStyle? get cardSubTitle => textTheme.bodyMedium;

  TextStyle? get cardContent => textTheme.bodyMedium;

  TextStyle? get listTile => cardTitle;

  TextStyle? get listSubTitle => cardSubTitle;

  TextStyle? get inputField => textTheme.bodyLarge;

  TextStyle? get inputFieldHint => textTheme.bodyMedium?.copyWith(color: _colorScheme.onSurface);

  TextStyle? get inputFieldLabel => textTheme.bodySmall?.copyWith(color: _colorScheme.onSurface);

  TextStyle? get appBarTitle => textTheme.titleLarge;

  TextStyle? get appBarSubtitle => textTheme.bodyLarge;

  TextStyle? get navigationBar => textTheme.labelMedium;

  TextStyle? get drawerMenu => textTheme.labelLarge?.bold;

  TextStyle? get menuItem => textTheme.bodyLarge;

  TextStyle? get dialogTitle => textTheme.titleLarge;

  TextStyle? get dialogSubTitle => textTheme.titleMedium;

  TextStyle? get dialogMessage => textTheme.bodyLarge;

  TextStyle? get dialogItem => textTheme.bodyLarge;

  TextStyle? get dialogAction => textTheme.labelLarge;

  TextStyle? get primaryText => textTheme.bodyMedium?.setColor(_colorScheme.primary);
}
