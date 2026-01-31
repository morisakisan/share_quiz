// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/domain/repositories/quiz_good_repository.dart';

class QuizGoodUseCase extends StateNotifier<AsyncValue<void>?> {
  final QuizGoodRepository _repository;

  QuizGoodUseCase(this._repository) : super(null);

  Future<void> post(String quizDocId) async {
    try {
      state = const AsyncValue.loading();
      await _repository.post(quizDocId);
      state = const AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
