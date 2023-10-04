// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_answer_post_repository_impl.dart';

class QuizAnswerPostUseCase extends StateNotifier<AsyncValue<void>> {
  final _repository = QuizAnswerPostRepositoryImpl();

  QuizAnswerPostUseCase() : super(AsyncValue.loading());

  post(String quizDocId, int select) async {
    try {
      await _repository.post(quizDocId, select);
      state = AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
