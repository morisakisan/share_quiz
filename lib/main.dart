import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_quiz/presentation/application.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting("ja_JP");
  runZonedGuarded(() {
    runApp(
      ProviderScope(
        child: Application(),
      ),
    );
  }, FirebaseCrashlytics.instance.recordError);
}
