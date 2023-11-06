// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import '../quiz/quiz.dart';
import '../user_quiz_interaction/user_quiz_interaction.dart';

part 'quiz_detail.freezed.dart';

@freezed
abstract class QuizDetail with _$QuizDetail {
  const factory QuizDetail({
    required Quiz quiz,
    required UserQuizInteraction userQuizInteraction
  }) = _QuizDetail;
}
