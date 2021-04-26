import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/quiz/quiz_repository.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';

class News extends HookWidget {

  final provider = StateNotifierProvider<QuizNotifier, QuizState>(
        (ref) => QuizNotifier(ref.read),
  );

  @override
  Widget build(BuildContext context) {
    final state = useProvider(provider.select((s) => s));
    final String text;
    switch(state.runtimeType) {
      case Loading:
        text = "l";
        break;
      case Error:
        text = "e";
        break;
      default:
        text = "s";
        break;
    }
    return Text(text);
  }
}
