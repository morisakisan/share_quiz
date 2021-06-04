// Dart imports:
import 'dart:async';

// Project imports:
import 'package:share_quiz/data/mapper/quiz_mapper.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/quiz_answers_count/quiz_answers_count.dart';

class QuizAnswersCountRepository {
  final _dataStore = QuizFirebaseStore();

  QuizAnswersCount fetch() => QuizAnswersCount(
        quizzes: _dataStore.fetchOrderByAnswerCountDesc().map(
              (list) => list.map((dto) => QuizMapper.transform(dto)).toList(),
            ),
      );
}
