// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/firestore/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/data/mapper/user_quizzes_mapper.dart';
import 'package:share_quiz/domain/models/user_quizzes/user_quizzes.dart';
import 'package:share_quiz/domain/repository/user_quizzes_repository.dart';

class UserQuizzesRepositoryImpl implements UserQuizzesRepository {
  final _firebaseStore = QuizFirebaseStore();
  final _firebaseAuthStore = FirebaseAuthStore();

  @override
  Future<UserQuizzes> getUserQuizzes() async {
    final uid = _firebaseAuthStore.getCurrentUser()!.uid;
    final dtoList = await _firebaseStore.fetchMyQuiz(uid);
    return UserQuizzesMapper.transformToUserQuizzes(dtoList);
  }
}
