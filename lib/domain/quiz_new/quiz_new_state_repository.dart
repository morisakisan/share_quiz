import 'dart:async';

import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/data/quiz/quiz_state_mapper.dart';
import 'package:share_quiz/domain/quiz_new/quiz_new_state.dart';

class QuizNewStateRepository {
  final _dataStore = QuizFirebaseStore();

  Stream<QuizNewState> fetch() {
    return _dataStore.fetchNews()
        .map((event) {
      return QuizNewStateMapper.transform(event);
    }).handleError((error) {
      return QuizNewState.error(error);
    });
  }
}
