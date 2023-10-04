// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_answer_data_repository_impl.dart';
import '../models/quiz_answer_data/quiz_answer_data.dart';

class QuizAnswerUseCase extends StateNotifier<AsyncValue<QuizAnswerData>> {
  final _repository = QuizAnswerDataRepositoryImpl();

  QuizAnswerUseCase() : super(AsyncValue.loading());

  fetch(String quizId) async {
    try {
      var value = await _repository.fetch(quizId);
      state = AsyncValue.data(value);
    } catch(error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
