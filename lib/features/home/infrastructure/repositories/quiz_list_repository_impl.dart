// Project imports:
import 'package:share_quiz/core/domain/models/quiz_list_order_by.dart';
import 'package:share_quiz/core/infrastructure/firestore/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/core/infrastructure/mappers/quiz_mapper.dart';
import 'package:share_quiz/features/home/domain/repositories/quiz_list_repository.dart';
import 'package:share_quiz/features/home/domain/models/quiz_list.dart';

class QuizListRepositoryImpl extends QuizListRepository {
  final _dataStore = QuizFirebaseStore();

  @override
  Stream<QuizList> fetch(QuizListOrderBy order) => _dataStore
      .fetchList(order.name, order.desc)
      .map((list) => list.map((dto) => QuizMapper.transform(dto)).toList())
      .map((event) => QuizList(quizzes: event));
}
