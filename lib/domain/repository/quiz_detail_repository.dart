// Dart imports:
import 'dart:async';

// Project imports:
import '../models/quiz_detail/quiz_detail.dart';

// Project imports:

abstract class QuizDetailRepository {

  Stream<QuizDetail> fetch(String quizId);

}
