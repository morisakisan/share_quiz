// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/user_quizzes/user_quizzes.dart';
import '../repository/user_quizzes_repository.dart';

class UserQuizzesUseCase extends StateNotifier<UserQuizzes?> {
  final UserQuizzesRepository repository;

  UserQuizzesUseCase(this.repository) : super(null);

  Future<void> fetchQuizzes() async {
    var currentPage = state?.pagination.currentPage ?? 0;
    var nextQuizzes = await repository.getUserQuizzes(currentPage + 1);
    state = nextQuizzes;
  }

  Future<void> loadMoreQuizzes() async {
    fetchQuizzes();
  }
}
