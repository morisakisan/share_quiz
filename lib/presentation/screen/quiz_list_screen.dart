// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_list/quiz_list_repository.dart';
import 'package:share_quiz/presentation/widget/widget_utils.dart';

class QuizListScreen extends HookWidget {
  final QuizListRepository _repository;

  QuizListScreen(this._repository);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _repository.fetch().quizzes,
      builder: (BuildContext context, AsyncSnapshot<List<Quiz>> snapShot) {
        if (snapShot.hasError) {
          return Text("error");
        } else if (!snapShot.hasData) {
          return WidgetUtils.loading();
        } else {
          return ListView(
            children: snapShot.data!.map(
              (value) {
                return WidgetUtils.getQuizView(context, value);
              },
            ).toList(),
            padding: const EdgeInsets.all(8.0),
          );
        }
      },
    );
  }
}
