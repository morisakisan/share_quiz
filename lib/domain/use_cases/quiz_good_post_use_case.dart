import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repository/quiz_good_post_repository.dart';

class QuizGoodPostUseCase extends StateNotifier<AsyncValue<void>?> {
  final QuizGoodPostRepository _repository;

  QuizGoodPostUseCase(this._repository) : super(null);

  Future<void> post(String quizDocId, bool isGood) async {
    try {
      state = const AsyncValue.loading();
      await _repository.post(quizDocId, isGood);
      state = const AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}