// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import '../../domain/models/pagination/pagination.dart';
import '../../domain/models/user_quizzes/user_quizzes.dart';
import '../../domain/repository/user_quizzes_repository.dart';
import '../mapper/user_quizzes_mapper.dart';
import '../quiz/quiz_firebase_store.dart';

class UserQuizzesRepositoryImpl implements UserQuizzesRepository {
  final _firebaseStore = QuizFirebaseStore();
  final _firebaseAuthStore = FirebaseAuthStore();

  @override
  Future<UserQuizzes> getUserQuizzes(int page) async {
    final uid = _firebaseAuthStore.getCurrentUser()!.uid;
    final dtoList = await _firebaseStore.fetchMyQuiz(uid);
    final pagination = Pagination(currentPage: page, hasMore: dtoList.length == 10);
    return UserQuizzesMapper.transformToUserQuizzes(dtoList, pagination);
  }
}
