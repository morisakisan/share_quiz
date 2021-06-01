import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data.dart';
import 'package:share_quiz/domain/quiz_answer_data/quiz_answer_data_repository.dart';

class QuizAnswerDataNotifier extends StateNotifier<Resource<QuizAnswerData>> {
  final _repository = QuizAnswerDataRepository();

  QuizAnswerDataNotifier() : super(Resource.loading());

  fetch(String quizId) {
    _repository.fetch(quizId).catchError(
      (error) {
        print(error);
        state = Resource.error(error);
      },
    ).then(
      (value) {
        print(value);
        state = Resource(value);
      },
    );
  }
}
