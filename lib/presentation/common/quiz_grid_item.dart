import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:share_quiz/presentation/utility/widget_utils.dart';

import '../../domain/models/quiz/quiz.dart';
import '../nav.dart';

class QuizGridItem extends StatelessWidget {
  final Quiz quiz;

  const QuizGridItem(this.quiz, {super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final formatter = DateFormat(appLocalizations.dateFormat, "ja_JP");
    String? formatted = quiz.createdAt != null ? formatter.format(quiz.createdAt!) : "";

    final correctRate = quiz.correctAnswerRate != null
        ? appLocalizations.correctRateWithPercent((quiz.correctAnswerRate! * 100).toInt())
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // 横に広げる
          children: [
            Expanded(
              child: quiz.imageUrl != null
                  ? WidgetUtils.getQuizImage(125.0, quiz.imageUrl!)
                  : Container(
                color: Colors.grey, // 画像がない場合のプレースホルダー
                child: const Icon(Icons.image, size: 50, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quiz.title,
                    style: theme.textTheme.headlineSmall?.copyWith(fontSize: 14), // 小さくする
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    appLocalizations.questionText(quiz.question),
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12), // 小さくする
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    appLocalizations.answerCountWithRate(quiz.answerCount ?? 0, correctRate),
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 10), // 小さくする
                  ),
                  const SizedBox(height: 2),
                  Text(
                    formatted,
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 8), // 小さくする
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}