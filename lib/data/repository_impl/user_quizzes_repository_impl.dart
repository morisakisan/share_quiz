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
    final stream = _firebaseStore.fetchMyQuizStream(uid, page);
    var quizzesStream = UserQuizzesMapper.transformList(stream);
    var pagination = quizzesStream.map((quizzes) {
      return Pagination(hasMore: quizzes.length % 10 == 0, currentPage: page);
    }).first;
    UserQuizzes q = UserQuizzes(quizzes: quizzesStream, pagination: await pagination);
    return q;
  }
}
