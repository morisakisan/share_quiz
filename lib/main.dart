import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_quiz/presentation/application.dart';

void main() {
  runApp(
    ProviderScope(
      child: Application(),
    ),
  );
}
