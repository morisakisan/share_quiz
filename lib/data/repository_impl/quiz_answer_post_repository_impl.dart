import '../../domain/repository/quiz_answer_post_repository.dart';
import '../answer/answer_firebase_store.dart';
import '../user/user_firebase_store.dart';

class QuizAnswerPostRepositoryImpl extends QuizAnswerPostRepository {
  final answerDatastore = AnswerFirebaseStore();
  final userDatastore = UserFirebaseStore();

  @override
  Future<void> post(String quizDocId, int select) {
    return userDatastore.gerCurrentUser().then((user) {
      return answerDatastore.post(
        quizDocId,
        {
          "answer": select,
          "user_id": user!.uid,
        },
      );
    });
  }
}
