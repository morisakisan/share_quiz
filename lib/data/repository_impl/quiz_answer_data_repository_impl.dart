// Project imports:
import '../../domain/exception/not_sign_In_exception.dart';
import '../../domain/models/quiz_answer_data/quiz_answer_data.dart';
import '../../domain/repository/quiz_answer_data_repository.dart';
import '../answer/answer_firebase_store.dart';
import '../mapper/quiz_mapper.dart';
import '../quiz/quiz_firebase_store.dart';
import '../user/user_firebase_store.dart';

class QuizAnswerDataRepositoryImpl extends QuizAnswerDataRepository {

  final _quizDataStore = QuizFirebaseStore();
  final _answerDataStore = AnswerFirebaseStore();
  final _userDataStore = UserFirebaseStore();

  @override
  Future<QuizAnswerData> fetch(String quizId) async {
    final quizDto = await _quizDataStore.fetchWhereByQuizId(quizId);

    final quiz = QuizMapper.transform(quizDto!);
    final user = await _userDataStore.gerCurrentUser();
    if(user == null) {
      throw NotSignInException();
    }
    final answer = await _answerDataStore.fetchMyAnswers(quizId, user.uid);
    return QuizAnswerData(quiz: quiz, select_anser: answer?.answer ?? null);
  }

}
