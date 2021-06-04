// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

part 'quiz_answers_count.freezed.dart';

@freezed
abstract class QuizAnswersCount with _$QuizAnswersCount {
  const factory QuizAnswersCount({
    required Stream<List<Quiz>> quizzes,
  }) = _QuizAnswersCount;
}
