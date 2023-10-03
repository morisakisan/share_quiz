// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz.dart';



part 'quiz_list.freezed.dart';

@freezed
abstract class QuizList with _$QuizList {
  const factory QuizList({
    required Stream<List<Quiz>> quizzes,
  }) = _QuizList;
}
