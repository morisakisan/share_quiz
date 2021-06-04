// Dart imports:
import 'dart:async';

// Project imports:
import 'package:share_quiz/data/mapper/quiz_mapper.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';
import 'package:share_quiz/domain/quiz_new/quiz_new.dart';

class QuizNewRepository {
  final _dataStore = QuizFirebaseStore();

  QuizNew fetch() => QuizNew(
        quizzes: _dataStore.fetchOrderByCreatedAtDesc().map(
              (list) => list.map((dto) => QuizMapper.transform(dto)).toList(),
            ),
      );
}
