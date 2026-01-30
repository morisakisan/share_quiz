// Project imports:
import 'package:share_quiz/features/profile/infrastructure/repositories/profile_repository_impl.dart';
import 'package:share_quiz/features/profile/infrastructure/repositories/user_quizzes_repository_impl.dart';
import 'package:share_quiz/features/profile/infrastructure/repositories/delete_quiz_repository_impl.dart';
import 'package:share_quiz/features/profile/application/use_cases/profile_use_case.dart';
import 'package:share_quiz/features/profile/application/use_cases/user_quizzes_use_case.dart';
import 'package:share_quiz/features/profile/application/use_cases/delete_quiz_use_case.dart';
import 'package:share_quiz/features/profile/presentation/providers/profile_repository_provider.dart';
import 'package:share_quiz/features/profile/presentation/providers/user_quizzes_repository_provider.dart';
import 'package:share_quiz/features/profile/presentation/providers/delete_quiz_repository_provider.dart';
import 'package:share_quiz/features/profile/presentation/providers/profile_use_case_provider.dart';
import 'package:share_quiz/features/profile/presentation/providers/user_quizzes_use_case_provider.dart';
import 'package:share_quiz/features/profile/presentation/providers/delete_quiz_use_case_provider.dart';

final profileOverrides = [
  profileRepositoryProvider.overrideWith((ref) {
    return ProfileRepositoryImpl();
  }),
  profileUseCaseProvider.overrideWith((ref) {
    final repository = ref.read(profileRepositoryProvider);
    return ProfileUseCase(repository).fetch();
  }),
  userQuizzesRepositoryProvider.overrideWith((ref) {
    return UserQuizzesRepositoryImpl();
  }),
  userQuizzesUseCaseProvider.overrideWith((ref) {
    final repository = ref.read(userQuizzesRepositoryProvider);
    return UserQuizzesUseCase(repository);
  }),
  deleteQuizRepositoryProvider.overrideWith((ref) {
    return DeleteQuizRepositoryImpl();
  }),
  deleteQuizUseCaseProvider.overrideWith((ref) {
    return DeleteQuizUseCase(ref.read(deleteQuizRepositoryProvider));
  }),
];
