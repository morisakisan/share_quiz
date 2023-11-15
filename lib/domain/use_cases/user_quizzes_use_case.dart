// Package imports:
import 'package:share_quiz/domain/models/quiz/quiz.dart';
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../models/pagination_state/pagination_state.dart';
import '../models/user_quizzes/user_quizzes.dart';
import '../repository/user_quizzes_repository.dart';

class UserQuizzesUseCase extends StateNotifier<PaginationState<UserQuizzes>> {
  final UserQuizzesRepository repository;

  UserQuizzesUseCase(this.repository) : super(const PaginationState.loading());

  final deleteQuizIds = <String>[];

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
          var modifiableList = List<Quiz>.from(quizzes.quizzes);
          modifiableList.removeWhere((element) => element.documentId == quizId);
          state = PaginationState.success(quizzes.copyWith(quizzes: modifiableList));
        },
        error: (error, stackTrace, previousData) => {});
  }
}
