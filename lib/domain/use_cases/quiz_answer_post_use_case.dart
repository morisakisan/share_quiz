// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../repository/quiz_answer_post_repository.dart';

class QuizAnswerPostUseCase extends StateNotifier<AsyncValue<void>?> {
  final QuizAnswerPostRepository _repository;

  QuizAnswerPostUseCase(this._repository) : super(null);

  Future<void> post(String quizDocId, int select) async {
    try {
      state = const AsyncValue.loading();
      await _repository.post(quizDocId, select);
      state = const AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
