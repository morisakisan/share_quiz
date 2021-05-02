import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

class QuizDetail extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final quiz = ModalRoute.of(context)!.settings.arguments as Quiz;
    return Scaffold(
      appBar: AppBar(
        title: Text('クイズ詳細'),
      ),
      body: Text(
        quiz.toString(),
      ),
    );
  }
}
