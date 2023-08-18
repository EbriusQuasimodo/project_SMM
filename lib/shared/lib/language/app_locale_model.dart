import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  Locale _locale = const Locale('ru');
  Locale get locale => _locale;
  LocaleModel(){
    getPreferences();
  }
  void setLocale(BuildContext context, Locale newLocale){
    _locale = newLocale;
    notifyListeners();
  }

  getPreferences() async {
    _locale = const Locale('ru');
    notifyListeners();
  }
}