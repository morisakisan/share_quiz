// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import '../../domain/models/pagination/pagination.dart';
import '../../domain/models/user_quizzes/user_quizzes.dart';
import '../../domain/repository/user_quizzes_repository.dart';
import '../mapper/user_quizzes_mapper.dart';
import '../quiz/quiz_dto.dart';
import '../quiz/quiz_firebase_store.dart';

class UserQuizzesRepositoryImpl implements UserQuizzesRepository {
  final _firebaseStore = QuizFirebaseStore();
  final _firebaseAuthStore = FirebaseAuthStore();

  @override
  Future<UserQuizzes> getUserQuizzes(int page) async {
    final uid = _firebaseAuthStore.getCurrentUser()!.uid;
    final stream = _firebaseStore.fetchMyQuizStream(uid, page);
    var quizzesStream = UserQuizzesMapper.transformList(stream);
    var pagination = computePagination(stream, page);
    UserQuizzes q = UserQuizzes(quizzes: quizzesStream, pagination: await pagination);
    return q;
  }

  Future<Pagination> computePagination(Stream<List<QuizDto>> quizzesStream, int page) async {
    await for (var quizzes in quizzesStream) {
      // 最初の要素のみを使用してページネーションを計算します。
      // 必要に応じて、ストリームのさらなる要素を処理するロジックを追加できます。
      bool hasMore = quizzes.length % 10 == 0;
      return Pagination(hasMore: hasMore, currentPage: page);
    }
    // ストリームが空の場合やエラーが発生した場合のデフォルトのページネーション状態を返します。
    return Pagination(hasMore: false, currentPage: page);
  }
}
