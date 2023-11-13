// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../pagination/pagination.dart';
import '../quiz/quiz.dart';

part 'user_quizzes.freezed.dart';

@freezed
abstract class UserQuizzes with _$UserQuizzes {
  const factory UserQuizzes({
    required Stream<List<Quiz>> quizzes,
    required Pagination pagination,
  }) = _UserQuizzes;
}
