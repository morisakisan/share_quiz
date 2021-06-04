// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_answers_count/quiz_ansewers_count_repository.dart';
import 'package:share_quiz/presentation/widget/widget_utils.dart';

class AnswersCount extends HookWidget {
  final _repository = QuizAnswersCountRepository();

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
            padding: EdgeInsets.all(16.0),
          );
        }
      },
    );
  }
}
