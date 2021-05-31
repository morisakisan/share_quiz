// Dart imports:
import 'dart:async';

// Project imports:
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/data/quiz/quiz_state_mapper.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

class QuizNewRepository {
  final _dataStore = QuizFirebaseStore();

  Stream<List<Quiz>> fetch() =>
    QuizNewStateMapper.transform(_dataStore.fetchOrderByCreatedAtDesc());
}
