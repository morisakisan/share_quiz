// Project imports:
import 'package:share_quiz/data/answer/answer_firebase_store.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';

class QuizAnswerPostRepository {
  final answerDatastore = AnswerFirebaseStore();
  final userDatastore = UserFirebaseStore();

  Future<void> post(String quizDocId, int select) async {
    final user = await userDatastore.gerCurrentUser();
    await answerDatastore.post(
      quizDocId,
      {
        "answer": select,
        "user_id": user!.uid,
      },
    );
  }
}
