// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

import '../quiz/quiz.dart';

// Project imports:

part 'quiz_answer_data.freezed.dart';

@freezed
abstract class QuizAnswerData with _$QuizAnswerData {
  const factory QuizAnswerData({
    required Quiz quiz,
    required int? select_anser
  }) = _QuizAnswerData;
}
