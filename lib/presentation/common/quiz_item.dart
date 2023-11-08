
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../domain/models/quiz/quiz.dart';
import '../nav.dart';
import '../utility/widget_utils.dart';

class QuizItem extends StatelessWidget {

  final Quiz quiz;

  const QuizItem(this.quiz, {super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final formatter = DateFormat(appLocalizations.dateFormat, "ja_JP");
    String? formatted;
    if (quiz.createdAt != null) {
      formatted = formatter.format(quiz.createdAt!);
    }

    final List<Widget> list = [];

    createImage(image) => Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      child: image,
    );

    const imageSize = 125.0;
    if (quiz.imageUrl != null) {
      list.add(
        createImage(WidgetUtils.getQuizImage(imageSize, quiz.imageUrl!)),
      );
    } else {
      list.add(
        createImage(WidgetUtils.getNoImage(context, imageSize)),
      );
    }

    final String correctRate;
    if (quiz.correctAnswerRate != null) {
      correctRate = appLocalizations
          .correctRateWithPercent((quiz.correctAnswerRate! * 100).toInt());
    } else {
      correctRate = "";
    }

    list.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            quiz.title,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            appLocalizations.questionText(quiz.question),
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            appLocalizations.answerCountWithRate(
                quiz.answerCount ?? 0, correctRate),
            style: theme.textTheme.bodyMedium,
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
                    Nav.quizDetail,
                    arguments: quiz.documentId,
                  );
                },
                label: Text(appLocalizations.answerTheQuiz),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Text(
              formatted ?? "",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

}