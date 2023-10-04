// Dart imports:

// Project imports:
import 'package:share_quiz/data/mapper/quiz_mapper.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/repository/quiz_list_repository.dart';

import '../../domain/models/quiz_list/quiz_list.dart';
import '../../domain/value_object/quiz_list_order_by.dart';

class QuizListRepositoryImpl extends QuizListRepository {
  final _dataStore = QuizFirebaseStore();

  @override
  Stream<QuizList> fetch(QuizListOrderBy order) => _dataStore
      .fetchList(order.name, order.desc)
      .map(
        (list) => list
            .map(
              (dto) => QuizMapper.transform(dto),
            )
            .toList(),
      )
      .map((event) => QuizList(quizzes: event));
}
