abstract class QuizGoodPostRepository {
  Future<void> post(String quizId, bool isGood);
}