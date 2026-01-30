// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_quiz/core/domain/models/quiz.dart';


part 'quiz_list.freezed.dart';

@freezed
abstract class QuizList with _$QuizList {
  const factory QuizList({
    required List<Quiz> quizzes,
  }) = _QuizList;
}
