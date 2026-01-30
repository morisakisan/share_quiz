// Project imports:
import 'package:share_quiz/core/domain/models/quiz_list_order_by.dart';
import 'package:share_quiz/features/home/infrastructure/repositories/quiz_list_repository_impl.dart';
import 'package:share_quiz/features/home/application/use_cases/quiz_list_use_case.dart';
import 'package:share_quiz/features/home/presentation/providers/quiz_list_new_provider.dart';
import 'package:share_quiz/features/home/presentation/providers/quiz_list_good_count.dart';
import 'package:share_quiz/features/home/presentation/providers/quiz_list_answers_count_provider.dart';
import 'package:share_quiz/features/home/presentation/providers/quiz_list_correct_rate_provider.dart';
import 'package:share_quiz/features/home/presentation/providers/quiz_list_repository_provider.dart';

final homeOverrides = [
  quizListRepositoryProvider.overrideWith((ref) {
    return QuizListRepositoryImpl();
  }),
  quizListNewProvider.overrideWith((ref) {
    return QuizListUseCase(
            ref.read(quizListRepositoryProvider), QuizListOrderBy.createdAtDesc)
        .build();
  }),
  quizListAnswersCountProvider.overrideWith((ref) {
    return QuizListUseCase(ref.read(quizListRepositoryProvider),
            QuizListOrderBy.answerCountDesc)
        .build();
  }),
  quizListCorrectRateProvider.overrideWith((ref) {
    return QuizListUseCase(ref.read(quizListRepositoryProvider),
            QuizListOrderBy.correctAnswerRateAsc)
        .build();
  }),
  quizListGoodCountProvider.overrideWith((ref) {
    return QuizListUseCase(ref.read(quizListRepositoryProvider),
        QuizListOrderBy.goodCountDesc)
        .build();
  }),
];
