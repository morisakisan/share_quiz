// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_detail_repository_impl.dart';
import '../models/quiz_detail/quiz_detail.dart';

class QuizDetailUseCase extends StateNotifier<AsyncValue<QuizDetail>> {
  final _repository = QuizDetailRepositoryImpl();

  QuizDetailUseCase() : super(AsyncValue.loading());

  fetch(String quizId) async {
    try {
      var value = await _repository.fetch(quizId);
      state = AsyncValue.data(value);
    } catch(error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
