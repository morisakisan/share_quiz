// Project imports:
import '../models/quiz_list/quiz_list.dart';
import '../value_object/quiz_list_order_by.dart';

abstract class QuizListRepository {
  Stream<QuizList> fetch(QuizListOrderBy order);
}
