// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_quiz/core/domain/models/quiz.dart';
import 'package:share_quiz/features/quiz_detail/domain/models/user_quiz_interaction.dart';


part 'quiz_detail.freezed.dart';

@freezed
abstract class QuizDetail with _$QuizDetail {
  const factory QuizDetail({
    required Quiz quiz,
    required UserQuizInteraction userQuizInteraction,
  }) = _QuizDetail;
}
