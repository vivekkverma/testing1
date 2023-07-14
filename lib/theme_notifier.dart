import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentTheme => _currentTheme;

  void setTheme(ThemeMode themeMode) {
    _currentTheme = themeMode;
    notifyListeners();
  }
}
