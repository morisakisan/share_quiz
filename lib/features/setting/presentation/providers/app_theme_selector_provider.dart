// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/presentation/widgets/app_theme_selector.dart';

final appThemeSelectorProvider =
    StateNotifierProvider<AppThemeSelector, ThemeMode>((ref) {
  return AppThemeSelector();
});
