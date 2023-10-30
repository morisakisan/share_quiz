import 'package:share_quiz/domain/models/user_quizzes/user_quizzes.dart';

abstract class UserQuizzesRepository {
    Future<UserQuizzes> getUserQuizzes(String uid, int page);
}