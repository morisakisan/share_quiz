import 'package:share_quiz/provider/quiz_list_repository_provider.dart';

import '../data/repository_impl/quiz_list_repository_impl.dart';
import '../domain/use_cases/quiz_list_use_case.dart';
import '../domain/value_object/quiz_list_order_by.dart';
import 'quiz_new_list_provider.dart';
import 'quiz_answers_count_list_provider.dart';
import 'quiz_correct_rate_list_provider.dart';

// You can define global overrides here if needed
final globalOverrides = [
  quizListRepositoryProvider.overrideWithValue(QuizListRepositoryImpl()),
  quizNewListProvider.overrideWith((ref) {
    return QuizListUseCase(
            ref.read(quizListRepositoryProvider), QuizListOrderBy.createdAtDesc)
        .build();
  }),
  quizAnswersCountListProvider.overrideWith((ref) {
    return QuizListUseCase(ref.read(quizListRepositoryProvider),
            QuizListOrderBy.answerCountDesc)
        .build();
  }),
  quizCorrectRateListProvider.overrideWith((ref) {
    return QuizListUseCase(ref.read(quizListRepositoryProvider),
            QuizListOrderBy.correctAnswerRateAsc)
        .build();
  }),
  // Add other overrides here
];
