// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

part 'quiz_answer_data.freezed.dart';

@freezed
abstract class QuizAnswerData with _$QuizAnswerData {
  const factory QuizAnswerData({
    required Quiz quiz,
    required int? select_anser
  }) = _QuizAnswerData;
}
