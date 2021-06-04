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

    final Widget image;
    if (quiz.imageUrl != null) {
      image = AspectRatio(
        aspectRatio: 1.0,
        child: Hero(
          tag: quiz.imageUrl!,
          child: Image.network(quiz.imageUrl!, fit: BoxFit.cover),
        ),
      );
    } else {
      image = Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text("no image"),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quiz.title,
              style: theme.textTheme.headline5,
            ),
          ),
          image,
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Text(
              "問題　${quiz.question}",
              style: theme.textTheme.bodyText2,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Nav.QUIZ_ANSWER,
                    arguments: quiz.documentId,
                  );
                },
                child: const Text('クイズに答える'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
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
