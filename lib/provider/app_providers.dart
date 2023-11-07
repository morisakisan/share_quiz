import 'package:share_quiz/provider/quiz_list_repository_provider.dart';

import '../data/repository_impl/current_user_data_repository_impl.dart';
import '../data/repository_impl/log_out_repository_impl.dart';
import '../data/repository_impl/login_repository_impl.dart';
import '../data/repository_impl/quiz_list_repository_impl.dart';
import '../domain/use_cases/current_user_data_use_case.dart';
import '../domain/use_cases/log_out_use_case.dart';
import '../domain/use_cases/login_use_case.dart';
import '../domain/use_cases/quiz_list_use_case.dart';
import '../domain/value_object/quiz_list_order_by.dart';
import 'quiz_new_list_provider.dart';
import 'quiz_answers_count_list_provider.dart';
import 'quiz_correct_rate_list_provider.dart';
import 'current_user_provider.dart';
import 'current_user_repository_provider.dart';
import 'login_repository_provider.dart';
import 'login_use_case_provider.dart';
import 'log_out_repository_provider.dart';
import 'log_out_use_case_provider.dart';

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
  currentUserRepositoryProvider.overrideWithValue(CurrentUserDataRepositoryImpl()),
  currentUserProvider.overrideWith((ref) {
    var repository = ref.read(currentUserRepositoryProvider);
    return CurrentUserDataUseCase(repository).build();
  }),
  loginRepositoryProvider.overrideWithValue(LoginRepositoryImpl()),
  loginUseCaseProvider.overrideWith((ref) {
    var repository = ref.read(loginRepositoryProvider);
    return LoginUseCase(repository);
  }),
  logOutRepositoryProvider.overrideWithValue(LogOutRepositoryImpl()),
  logOutUseCaseProvider.overrideWith((ref) {
    var repository = ref.read(logOutRepositoryProvider);
    return LogOutUseCase(repository);
  }),
];
