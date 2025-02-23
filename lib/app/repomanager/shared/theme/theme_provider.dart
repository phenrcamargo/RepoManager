import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;
  bool _isInitialized = false;

  ThemeProvider() {
    _loadThemePreference();
  }

  bool get isDarkTheme => _isDarkTheme;

  bool get isInitialized => _isInitialized;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveThemePreference(_isDarkTheme);
    notifyListeners();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool('isDarkTheme') ?? true;
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> _saveThemePreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', value);
  }
}