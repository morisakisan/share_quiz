import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/quiz/quiz_notifier.dart';
import 'package:share_quiz/domain/quiz/quiz_state.dart';

class News extends HookWidget {
  final provider = StateNotifierProvider((ref) => QuizNotifier());

  @override
  Widget build(BuildContext context) {
    QuizState state = useProvider(provider.select((s) => s));
    var text = "";
    if (state is Loading) {
      text = "l";
    } else if (state is Error) {
      text = "e";
    } else if (state is Success) {
      text = "s";
    }
    return Text(text);
  }
}
