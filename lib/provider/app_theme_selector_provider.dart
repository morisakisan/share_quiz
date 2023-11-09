import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/presentation/common/app_theme_selector.dart';

final appThemeSelectorProvider = StateNotifierProvider<AppThemeSelector, ThemeMode>(
      (ref) => AppThemeSelector(),
);