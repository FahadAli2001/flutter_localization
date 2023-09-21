import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController with ChangeNotifier {
  Locale? _applocale;
  Locale? get appLocale => _applocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (type == Locale("en")) {
      _applocale = type;
      await sp.setString("language_code", "en");
    } else if (type == Locale("ur")) {
      _applocale = type;
      await sp.setString("language_code", "ur");
    } else {
      _applocale = type;
      await sp.setString("language_code", "es");
    }

    notifyListeners();
  }
}
