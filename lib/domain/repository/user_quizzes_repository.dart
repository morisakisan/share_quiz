// Project imports:
import '../../domain/models/user_quizzes/user_quizzes.dart';

abstract class UserQuizzesRepository {
    Future<UserQuizzes> getUserQuizzes(int page);
}
