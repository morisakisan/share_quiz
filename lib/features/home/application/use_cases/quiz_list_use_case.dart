// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/core/domain/models/quiz_list_order_by.dart';

// Project imports:
import 'package:share_quiz/features/home/domain/models/quiz_list.dart';
import 'package:share_quiz/features/home/domain/repositories/quiz_list_repository.dart';

class QuizListUseCase extends StreamNotifier<QuizList> {
  final QuizListRepository _repository;
  final QuizListOrderBy order;

  QuizListUseCase(this._repository, this.order) : super();

  @override
  Stream<QuizList> build() {
    return _repository.fetch(order);
  }
}
