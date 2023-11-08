import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../domain/models/quiz/quiz.dart';
import '../nav.dart';

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

    final correctRate = quiz.correctAnswerRate != null
        ? appLocalizations
            .correctRateWithPercent((quiz.correctAnswerRate! * 100).toInt())
        : "";

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            Nav.quizDetail,
            arguments: quiz.documentId,
          );
        },
        child: Stack(
          children: [
            Row(
              children: [
                if (quiz.imageUrl != null)
                  Image.network(
                    quiz.imageUrl!,
                    width: 125.0,
                    height: 125.0,
                    fit: BoxFit.cover,
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quiz.title,
                          style: theme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          appLocalizations.questionText(quiz.question),
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          appLocalizations.answerCountWithRate(
                              quiz.answerCount ?? 0, correctRate),
                          style: theme.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatted ?? "",
                          style: theme.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
