import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data_repository.dart';

class QuizAnswerDataNotifier extends StateNotifier<Resource<QuizAnswerData>> {
  final repository = QuizAnswerDataRepository();

  QuizAnswerDataNotifier() : super(Resource.loading());

  fetch(String quizId) {
    repository.fetch(quizId).catchError(
      (error) {
        state = Resource.error(error);
      },
    ).then(
      (value) {
        state = Resource(value);
      },
    );
  }
}
