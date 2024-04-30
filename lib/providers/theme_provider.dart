import 'package:flutter/material.dart';

enum ThemeModeType {
  light,
  dark,
}

class ThemeProvider with ChangeNotifier {
  ThemeModeType _themeMode = ThemeModeType.light;

  ThemeModeType get themeMode => _themeMode;

  set themeMode(ThemeModeType mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
