// Project imports:
import '../../domain/exception/not_sign_In_exception.dart';
import '../../domain/models/quiz_detail/quiz_detail.dart';
import '../../domain/repository/quiz_detail_repository.dart';
import '../answer/answer_firebase_store.dart';
import '../mapper/quiz_mapper.dart';
import '../quiz/quiz_firebase_store.dart';
import '../user/user_firebase_store.dart';

class QuizDetailRepositoryImpl extends QuizDetailRepository {

  final _quizDataStore = QuizFirebaseStore();
  final _answerDataStore = AnswerFirebaseStore();
  final _userDataStore = UserFirebaseStore();

  @override
  Future<QuizDetail> fetch(String quizId) async {
    final quizDto = await _quizDataStore.fetchWhereByQuizId(quizId);

    final quiz = QuizMapper.transform(quizDto!);
    final user = await _userDataStore.gerCurrentUser();
    if(user == null) {
      throw NotSignInException();
    }
    final answer = await _answerDataStore.fetchMyAnswers(quizId, user.uid);
    return QuizDetail(quiz: quiz, select_anser: answer?.answer ?? null);
  }

}
