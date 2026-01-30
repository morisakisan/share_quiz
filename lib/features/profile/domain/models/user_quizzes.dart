// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:share_quiz/core/domain/models/pagination.dart';
import 'package:share_quiz/core/domain/models/quiz.dart';

part 'user_quizzes.freezed.dart';

@freezed
abstract class UserQuizzes with _$UserQuizzes {
  const factory UserQuizzes({
    required List<Quiz> quizzes,
    required Pagination pagination,
  }) = _UserQuizzes;
}
