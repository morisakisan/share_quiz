// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/models/pagination_state/pagination_state.dart';
import '../domain/models/user_quizzes/user_quizzes.dart';
import '../domain/use_cases/user_quizzes_use_case.dart';

final userQuizzesUseCaseProvider = StateNotifierProvider.autoDispose<
    UserQuizzesUseCase, UserQuizzes?>((ref) {
  throw UnimplementedError();
});
