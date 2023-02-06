import 'dart:ui';

const _en = Locale('en');
const _vi = Locale('vi');

class L10n {
  L10n._();

  static L10n _instance = L10n._();

  static L10n get I => _instance;

  final List<Locale> values = [_en, _vi];

  Locale get defaultLocale => values.first;

  Locale get en => _en;

  Locale get vi => _vi;
}
