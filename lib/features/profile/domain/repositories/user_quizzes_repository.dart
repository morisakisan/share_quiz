// Project imports:
import 'package:share_quiz/features/profile/domain/models/user_quizzes.dart';

abstract class UserQuizzesRepository {
  Future<UserQuizzes> getUserQuizzes();
}
