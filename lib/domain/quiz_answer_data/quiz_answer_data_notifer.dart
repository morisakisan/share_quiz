// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data_repository.dart';

class QuizAnswerDataNotifier extends StateNotifier<AsyncValue<QuizAnswerData>> {
  final _repository = QuizAnswerDataRepository();

  QuizAnswerDataNotifier() : super(AsyncValue.loading());

  fetch(String quizId) async {
    try {
      var value = await _repository.fetch(quizId);
      state = AsyncValue.data(value);
    } catch(error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
