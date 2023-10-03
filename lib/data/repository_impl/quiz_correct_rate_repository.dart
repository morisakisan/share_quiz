// Dart imports:
import 'dart:async';

// Project imports:
import 'package:share_quiz/data/mapper/quiz_mapper.dart';
import 'package:share_quiz/data/quiz/quiz_firebase_store.dart';
import 'package:share_quiz/domain/repository/quiz_list_repository.dart';

import '../../domain/models/quiz_list/quiz_list.dart';

class QuizCorrectRateRepository extends QuizListRepository {
  final _dataStore = QuizFirebaseStore();

  @override
  QuizList fetch() => QuizList(
        quizzes: _dataStore.fetchOrderByCorrectRateDesc().map(
              (list) => list
                  .map(
                    (dto) => QuizMapper.transform(dto),
                  )
                  .toList(),
            ),
      );
}
