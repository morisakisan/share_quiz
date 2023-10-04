// Dart imports:
import 'dart:async';

// Project imports:
import '../models/quiz_answer_data/quiz_answer_data.dart';

abstract class QuizAnswerDataRepository {

  Future<QuizAnswerData> fetch(String quizId);

}
