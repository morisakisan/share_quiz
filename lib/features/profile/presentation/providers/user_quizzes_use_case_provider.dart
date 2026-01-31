// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/domain/models/pagination_state.dart';
import 'package:share_quiz/features/profile/domain/models/user_quizzes.dart';
import 'package:share_quiz/features/profile/application/use_cases/user_quizzes_use_case.dart';

final userQuizzesUseCaseProvider = StateNotifierProvider.autoDispose<
    UserQuizzesUseCase, PaginationState<UserQuizzes>>((ref) {
  throw UnimplementedError();
});
