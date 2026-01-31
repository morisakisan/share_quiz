// Project imports:
import 'package:share_quiz/core/infrastructure/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/core/infrastructure/firestore/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/features/profile/infrastructure/mappers/user_quizzes_mapper.dart';
import 'package:share_quiz/features/profile/domain/models/user_quizzes.dart';
import 'package:share_quiz/features/profile/domain/repositories/user_quizzes_repository.dart';

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
