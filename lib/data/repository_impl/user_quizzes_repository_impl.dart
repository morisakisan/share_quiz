import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';

import '../../domain/models/pagination/pagination.dart';
import '../../domain/models/user_quizzes/user_quizzes.dart';
import '../../domain/models/user_quizzes/user_quizzes_repository.dart';
import '../mapper/user_quizzes_mapper.dart';
import '../quiz/quiz_dto.dart';
import '../quiz/quiz_firebase_store.dart';

class UserQuizzesRepositoryImpl implements UserQuizzesRepository {
  final _firebaseStore = QuizFirebaseStore();
  final _firebaseauthstore = FirebaseAuthStore();

  @override
  Future<UserQuizzes> getUserQuizzes(int page) async {
    final uid = _firebaseauthstore.getCurrentUser()!.uid;
    List<QuizDto> dtoList = await _firebaseStore.fetchMyQuiz(uid);
    Pagination pagination = Pagination(currentPage: page, hasMore: dtoList.isNotEmpty);
    return UserQuizzesMapper.transformToUserQuizzes(dtoList, pagination);
  }
}
