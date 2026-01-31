// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:share_quiz/generated/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/presentation/widgets/app_theme.dart';
import 'package:share_quiz/features/setting/presentation/providers/app_theme_selector_provider.dart';
import 'package:share_quiz/features/home/presentation/screens/home_screen.dart';
import 'nav.dart';

class Application extends HookConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ja')],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(appThemeSelectorProvider),
      routes: Nav.routes,
      home: const HomeScreen(),
    );
  }
}
