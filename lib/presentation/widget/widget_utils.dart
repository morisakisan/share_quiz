// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import "package:intl/intl.dart";

// Project imports:
import 'package:share_quiz/domain/quiz/quiz.dart';
import '../nav.dart';

class WidgetUtils {
  WidgetUtils._();

  static Widget getQuizView(BuildContext context, Quiz quiz) {
    final theme = Theme.of(context);
    final formatter = DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    final formatted = formatter.format(quiz.createdAt); // Dateから

    final List<Widget> list = [];

    createImage(image) => Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: image,
        );

    if (quiz.imageUrl != null) {
      list.add(
        createImage(
          Hero(
            tag: quiz.imageUrl!,
            child: Image.network(
              quiz.imageUrl!,
              fit: BoxFit.cover,
              height: 125,
              width: 125,
            ),
          ),
        ),
      );
    } else {
      list.add(
        createImage(Container(
          height: 125,
          width: 125,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
          ),
          child: Center(
            child: const Text(
              "No image",
            ),
          ),
        )),
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
            height: 8,
          ),
          Text(
            "問題　${quiz.question}",
            style: theme.textTheme.bodyText2,
          ),
          SizedBox(
            height: 4,
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
                icon: Icon(Icons.question_answer_rounded),
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

  static Widget loading() => const Center(
        child: const SizedBox(
          height: 100,
          width: 100,
          child: const CircularProgressIndicator(),
        ),
      );
}
