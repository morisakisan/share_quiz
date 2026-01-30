// Project imports:
import 'package:share_quiz/features/post/infrastructure/repositories/quiz_post_repository_impl.dart';
import 'package:share_quiz/features/post/application/use_cases/quiz_post_use_case.dart';
import 'package:share_quiz/features/post/application/use_cases/quiz_form_use_case.dart';
import 'package:share_quiz/features/post/presentation/providers/quiz_post_use_case_provider.dart';
import 'package:share_quiz/features/post/presentation/providers/quiz_form_use_case_provider.dart';
import 'package:share_quiz/features/post/presentation/providers/quiz_post_repository_provider.dart';

final postOverrides = [
  quizPostRepositoryProvider.overrideWith((ref) {
    return QuizPostRepositoryImpl();
  }),
  quizPostUseCaseProvider.overrideWith((ref) {
    return QuizPostUseCase(ref.read(quizPostRepositoryProvider));
  }),
  quizFormUseCaseProvider.overrideWith((ref) {
    return QuizFormUseCase();
  }),
];
