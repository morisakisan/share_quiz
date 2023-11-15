import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/delete_quiz_repository.dart';

class DeleteQuizUseCase extends StateNotifier<AsyncValue<void>?> {
  final DeleteQuizRepository _deleteQuizRepository;

  DeleteQuizUseCase(this._deleteQuizRepository): super(null);

  Future<void> deleteQuiz(String quizId, Function? callback) async {
    state = const AsyncLoading();
    try {
      await _deleteQuizRepository.deleteQuiz(quizId);
      state = const AsyncValue<void>.data(null);
      callback?.call();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
