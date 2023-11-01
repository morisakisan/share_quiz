// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../quiz/quiz.dart';

// Project imports:

part 'quiz_detail.freezed.dart';

@freezed
abstract class QuizDetail with _$QuizDetail {
  const factory QuizDetail({
    required Quiz quiz,
    required int? selectAnswer,
    required bool isLogin,
  }) = _QuizDetail;
}
