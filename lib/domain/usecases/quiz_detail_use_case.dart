// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/quiz_detail/quiz_detail.dart';
import '../repository/quiz_detail_repository.dart';

class QuizDetailUseCase extends StateNotifier<AsyncValue<QuizDetail>> {
  final QuizDetailRepository _repository;

  QuizDetailUseCase(this._repository) : super(AsyncValue.loading());

  fetch(String quizId) async {
    try {
      var value = await _repository.fetch(quizId);
      state = AsyncValue.data(value);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
