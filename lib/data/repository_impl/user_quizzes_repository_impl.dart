import '../../domain/models/pagination/pagination.dart';
import '../../domain/models/user_quizzes/user_quizzes.dart';
import '../../domain/models/user_quizzes/user_quizzes_repository.dart';
import '../mapper/user_quizzes_mapper.dart';
import '../quiz/quiz_dto.dart';
import '../quiz/quiz_firebase_store.dart';

class UserQuizzesRepositoryImpl implements UserQuizzesRepository {
  final QuizFirebaseStore _firebaseStore = QuizFirebaseStore();

  @override
  Future<UserQuizzes> getUserQuizzes(String uid, int page) async {
    const int limit = 10;

    List<QuizDto> dtoList = await _firebaseStore.fetchMyQuiz(uid, page, limit);
    Pagination pagination = Pagination(currentPage: page, hasMore: dtoList.isNotEmpty);

    return UserQuizzesMapper.transformToUserQuizzes(dtoList, pagination);
  }
}
