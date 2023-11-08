// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import '../presentation/screen/home_screen.dart';
import 'nav.dart';

class Application extends HookWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja')
      ],
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.lime[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textButtonTheme: TextButtonThemeData(
          style:
              TextButton.styleFrom(disabledForegroundColor: Colors.blueAccent),
        ),
      ),
      routes: Nav.routes,
      home: const HomeScreen(),
    );
  }
}
