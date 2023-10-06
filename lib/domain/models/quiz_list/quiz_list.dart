// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../quiz/quiz.dart';

part 'quiz_list.freezed.dart';

@freezed
abstract class QuizList with _$QuizList {
  const factory QuizList({
    required List<Quiz> quizzes,
  }) = _QuizList;
}
