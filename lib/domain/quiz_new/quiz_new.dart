// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:share_quiz/domain/quiz/quiz.dart';

part 'quiz_new.freezed.dart';

@freezed
abstract class QuizNew with _$QuizNew {
  const factory QuizNew({
    required Stream<List<Quiz>> quizzes,
  }) = _QuizNew;
}
