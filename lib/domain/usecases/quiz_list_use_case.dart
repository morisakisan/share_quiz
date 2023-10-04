// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_list_repository_impl.dart';
import '../models/quiz_list/quiz_list.dart';
import '../value_object/quiz_list_order_by.dart';

class QuizListUseCase extends StreamNotifier<QuizList> {
  final _repository = QuizListRepositoryImpl();
  final QuizListOrderBy order;

  QuizListUseCase(this.order) : super();

  @override
  Stream<QuizList> build() {
    return _repository.fetch(order);
  }
  
}
