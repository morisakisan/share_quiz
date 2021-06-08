// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:share_quiz/presentation/page/home.dart';
import 'nav.dart';

class Application extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lime[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: Colors.blueAccent),
        ),
      ),
      routes: Nav.routes,
      home: Home(),
    );
  }
}
