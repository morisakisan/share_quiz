// Project imports:
import 'package:share_quiz/data/answer/answer_firebase_store.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';

abstract class QuizAnswerPostRepository {

  Future<void> post(String quizDocId, int select);
}
