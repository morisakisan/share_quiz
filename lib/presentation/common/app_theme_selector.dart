// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeSelector extends StateNotifier<ThemeMode> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const _themePrefsKey = "theme_key";

  AppThemeSelector() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final SharedPreferences prefs = await _prefs;
    final themeIndex = prefs.getInt(_themePrefsKey);
    if (themeIndex == null) {
      return;
    }
    final themeMode = ThemeMode.values.firstWhere(
          (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
    state = themeMode;
  }

  /// テーマの変更と保存を行う
  Future<void> changeAndSave(ThemeMode theme) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}
