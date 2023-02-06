import 'package:content/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  String _languageCodeLocale = L10n.I.defaultLocale.languageCode;

  String get languageCode => _languageCodeLocale;

  String get languageCodeLocale => _languageCodeLocale;

  LocaleProvider() {
    updateLanguageCode();
  }

  setLanguageCode(String languageCode) {
    _languageCodeLocale = languageCode;
    notifyListeners();
    saveLanguageCodePrefs(languageCode);
  }

  updateLanguageCode() async {
    _languageCodeLocale = await getLanguageCodePrefs();
    notifyListeners();
  }

  /// Cache to SharedPreferences
  static String languageCodeKey = "language_code";

  Future<String> getLanguageCodePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageCodeKey) ?? L10n.I.defaultLocale.languageCode;
  }

  Future saveLanguageCodePrefs(String code) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(languageCodeKey, code);
  }

  static String getLanguageName(String code) {
    return languageNames[code] ?? code;
  }

  static Map<String, String> languageNames = {
    "en": 'English',
    'vi': 'Tiếng Việt',
  };


}
