// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_list_repository_impl.dart';
import '../models/quiz_list/quiz_list.dart';
import '../repository/quiz_list_repository.dart';
import '../value_object/quiz_list_order_by.dart';

class QuizListUseCase extends StreamNotifier<QuizList> {
  final QuizListRepository _repository;
  final QuizListOrderBy order;

  QuizListUseCase(this._repository, this.order) : super();

  @override
  Stream<QuizList> build() {
    return _repository.fetch(order);
  }
}
