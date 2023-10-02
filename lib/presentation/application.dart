// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/presentation/screen/home.dart';

// Project imports:
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
