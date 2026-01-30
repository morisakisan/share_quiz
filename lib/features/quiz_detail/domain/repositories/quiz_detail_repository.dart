// Dart imports:
import 'dart:async';

// Project imports:
import 'package:share_quiz/features/quiz_detail/domain/models/quiz_detail.dart';

abstract class QuizDetailRepository {
  Stream<QuizDetail> fetch(String quizId);
}
