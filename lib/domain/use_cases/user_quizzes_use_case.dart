import 'package:state_notifier/state_notifier.dart';

import '../models/pagination_state/pagination_state.dart';
import '../models/user_quizzes/user_quizzes.dart';
import '../models/user_quizzes/user_quizzes_repository.dart';

class UserQuizzesUseCase extends StateNotifier<PaginationState<UserQuizzes>> {
  final UserQuizzesRepository repository;

  UserQuizzesUseCase(this.repository) : super(PaginationState.loading());

  Future<void> fetchQuizzes(String uid, int page) async {
    try {
      final newUserQuizzes = await repository.getUserQuizzes(uid, page);
      final updatedQuizzes = state.maybeWhen(
        success: (currentQuizzes) => newUserQuizzes.copyWith(
            quizzes: currentQuizzes.quizzes..addAll(newUserQuizzes.quizzes)),
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
}
