// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_list/quiz_list_repository.dart';
import 'package:share_quiz/presentation/widget/widget_utils.dart';
import '../nav.dart';

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
                return _getQuizView(context, value);
              },
            ).toList(),
            padding: const EdgeInsets.all(8.0),
          );
        }
      },
    );
  }

  Widget _getQuizView(BuildContext context, Quiz quiz) {
    final theme = Theme.of(context);
    final formatter = DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    final formatted = formatter.format(quiz.createdAt); // Dateから

    final List<Widget> list = [];

    createImage(image) => Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: image,
        );

    const imageSize = 125.0;
    if (quiz.imageUrl != null) {
      list.add(
        createImage(
          WidgetUtils.getQuizImage(imageSize, quiz.imageUrl!)
        ),
      );
    } else {
      list.add(
        createImage(WidgetUtils.getNoImage(imageSize)),
      );
    }

    final String correctRate;
    if (quiz.car != null) {
      correctRate = "正解率：${(quiz.car! * 100).toInt()}％";
    } else {
      correctRate = "";
    }

    list.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            quiz.title,
            style: theme.textTheme.headline5,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "問題　${quiz.question}",
            style: theme.textTheme.headline6,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "回答数：${quiz.answerCount}　$correctRate",
            style: theme.textTheme.bodyText2,
          ),
        ],
      ),
    );

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.question_answer_rounded),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Nav.QUIZ_ANSWER,
                    arguments: quiz.documentId,
                  );
                },
                label: const Text('クイズに答える'),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Text(
              formatted,
              style: theme.textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
