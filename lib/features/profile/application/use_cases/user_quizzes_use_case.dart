// Package imports:
import 'package:share_quiz/core/domain/models/quiz.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import 'package:share_quiz/core/domain/models/pagination_state.dart';
import 'package:share_quiz/features/profile/domain/models/user_quizzes.dart';
import 'package:share_quiz/features/profile/domain/repositories/user_quizzes_repository.dart';

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

  Future<void> deleteQuiz(String quizId) async {
    state.when(
        loading: () => {},
        success: (quizzes) {
          state = const PaginationState.loading();
          var modifiableList = List<Quiz>.from(quizzes.quizzes);
          modifiableList.removeWhere((element) => element.documentId == quizId);
          state = PaginationState.success(quizzes.copyWith(quizzes: modifiableList));
        },
        error: (error, stackTrace, previousData) => {});
  }
}
