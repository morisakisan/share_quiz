// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:share_quiz/presentation/common/quiz_image.dart';
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
    String? formatted =
        quiz.createdAt != null ? formatter.format(quiz.createdAt!) : "";

    final correctRate = quiz.correctAnswerRate != null
        ? (quiz.correctAnswerRate! * 100).toInt()
        : null;
    final texts = <Widget>[];

    texts.add(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.thumb_up_alt,
            size: 12,
          ),
          const SizedBox(width: 4.0),
          Text(
            "${quiz.goodCount ?? 0}",
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
    texts.add(
      Text(
        appLocalizations.answerCount(quiz.answerCount ?? 0),
        style: theme.textTheme.bodySmall,
      ),
    );
    if (correctRate != null) {
      texts.add(
        Text(
          appLocalizations.answerRate(correctRate),
          style: theme.textTheme.bodySmall,
        ),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            Nav.quizDetail,
            arguments: quiz,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // 横に広げる
          children: [
            Expanded(
              child: quiz.imageUrl.isNotEmpty
                  ? QuizImage(imageSize: 125.0, imageUrl: quiz.imageUrl.first)
                  : Container(
                      color: Colors.grey, // 画像がない場合のプレースホルダー
                      child: const Icon(Icons.image,
                          size: 50, color: Colors.white),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quiz.title,
                    style: theme.textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    appLocalizations.questionText(quiz.question),
                    style: theme.textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8.0, // 横の隙間
                    runSpacing: 4.0, // 縦の隙間（改行後の隙間）
                    children: texts,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatted,
                    style: theme.textTheme.labelSmall,
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
