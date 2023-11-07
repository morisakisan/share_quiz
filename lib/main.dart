// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

// Project imports:
import 'package:share_quiz/presentation/application.dart';
import 'package:share_quiz/provider/app_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('ja_JP');
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(() {
    runApp(
      ProviderScope(overrides: globalOverrides, child: const Application()),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
