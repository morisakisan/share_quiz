// Project imports:
import 'package:share_quiz/features/quiz_detail/infrastructure/repositories/quiz_answer_post_repository_impl.dart';
import 'package:share_quiz/features/quiz_detail/infrastructure/repositories/quiz_detail_repository_impl.dart';
import 'package:share_quiz/features/quiz_detail/application/use_cases/quiz_answer_post_use_case.dart';
import 'package:share_quiz/features/quiz_detail/application/use_cases/quiz_detail_use_case.dart';
import 'package:share_quiz/features/quiz_detail/application/use_cases/quiz_good_use_case.dart';
import 'package:share_quiz/core/infrastructure/repositories/quiz_good_repository_impl.dart';
import 'package:share_quiz/features/quiz_detail/presentation/providers/quiz_answer_post_repository_provider.dart';
import 'package:share_quiz/features/quiz_detail/presentation/providers/quiz_answer_post_use_case_provider.dart';
import 'package:share_quiz/features/quiz_detail/presentation/providers/quiz_detail_provider.dart';
import 'package:share_quiz/features/quiz_detail/presentation/providers/quiz_detail_repository_provider.dart';
import 'package:share_quiz/features/quiz_detail/presentation/providers/quiz_good_post_repository_provider.dart';
import 'package:share_quiz/features/quiz_detail/presentation/providers/quiz_good_post_use_case_provider.dart';

final quizDetailOverrides = [
  quizAnswerPostRepositoryProvider.overrideWith((ref) {
    return QuizAnswerPostRepositoryImpl();
  }),
  quizAnswerPostUseCaseProvider.overrideWith((ref) {
    final repo = ref.read(quizAnswerPostRepositoryProvider);
    return QuizAnswerPostUseCase(repo);
  }),
  quizDetailRepositoryProvider.overrideWith((ref) {
    return QuizDetailRepositoryImpl();
  }),
  quizDetailProvider.overrideWith((ref, quizId) {
    final repo = ref.read(quizDetailRepositoryProvider);
    return QuizDetailUseCase(repo, quizId).build();
  }),
  quizGoodRepositoryProvider.overrideWith((ref) {
    return QuizGoodRepositoryImpl();
  }),
  quizGoodPostUseCaseProvider.overrideWith((ref) {
    final repository = ref.read(quizGoodRepositoryProvider);
    return QuizGoodUseCase(repository);
  }),
];
