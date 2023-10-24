// Project imports:

abstract class QuizAnswerPostRepository {
  Future<void> post(String quizDocId, int select);
}
