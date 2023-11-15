// Package imports:
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../models/pagination_state/pagination_state.dart';
import '../models/user_quizzes/user_quizzes.dart';
import '../repository/delete_quiz_repository.dart';
import '../repository/user_quizzes_repository.dart';

class UserQuizzesUseCase extends StateNotifier<PaginationState<UserQuizzes>> {
  final UserQuizzesRepository repository;


  UserQuizzesUseCase(this.repository) : super(const PaginationState.loading());

  Future<void> fetchQuizzes() async {
    try {
      final newUserQuizzes = await repository.getUserQuizzes();
      final updatedQuizzes = state.maybeWhen(
        success: (currentQuizzes) => newUserQuizzes.copyWith(
            quizzes: [...currentQuizzes.quizzes, ...newUserQuizzes.quizzes]),
        orElse: () => newUserQuizzes,
      );
      state = PaginationState.success(updatedQuizzes);
    } catch (e, stackTrace) {
      final previousData = state.maybeWhen(
        success: (quizzes) => quizzes,
        orElse: () => null,
      );
      state = PaginationState.error(e, stackTrace, previousData);
    }
  }

  Future<void> loadMoreQuizzes() async {
    state.when(
        loading: () => {},
        success: (quizzes) {
          fetchQuizzes();
        },
        error: (error, stackTrace, previousData) => {});
  }

}
