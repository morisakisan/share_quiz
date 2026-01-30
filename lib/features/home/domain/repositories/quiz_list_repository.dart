// Project imports:
import 'package:share_quiz/core/domain/models/quiz_list_order_by.dart';
import 'package:share_quiz/features/home/domain/models/quiz_list.dart';

abstract class QuizListRepository {
  Stream<QuizList> fetch(QuizListOrderBy order);
}
