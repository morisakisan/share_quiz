import 'package:share_quiz/provider/profile_repository_provider.dart';
import 'package:share_quiz/provider/profile_use_case_provider.dart';
import 'package:share_quiz/provider/quiz_answer_post_repository_provider.dart';
import 'package:share_quiz/provider/quiz_answer_post_use_case_provider.dart';
import 'package:share_quiz/provider/quiz_detail_provider.dart';
import 'package:share_quiz/provider/quiz_detail_repository_provider.dart';
import 'package:share_quiz/provider/quiz_form_use_case_provider.dart';
import 'package:share_quiz/provider/quiz_good_post_repository_provider.dart';
import 'package:share_quiz/provider/quiz_good_post_use_case_provider.dart';
import 'package:share_quiz/provider/quiz_list_repository_provider.dart';
import 'package:share_quiz/provider/quiz_post_repository_provider.dart';
import 'package:share_quiz/provider/quiz_post_use_case_provider.dart';
import 'package:share_quiz/provider/user_quizzes_repository_provider.dart';
import 'package:share_quiz/provider/user_quizzes_use_case_provider.dart';

import '../data/repository_impl/current_user_data_repository_impl.dart';
import '../data/repository_impl/log_out_repository_impl.dart';
import '../data/repository_impl/login_repository_impl.dart';
import '../data/repository_impl/profile_repository_impl.dart';
import '../data/repository_impl/quiz_answer_post_repository_impl.dart';
import '../data/repository_impl/quiz_detail_repository_impl.dart';
import '../data/repository_impl/quiz_good_post_repository_impl.dart';
import '../data/repository_impl/quiz_list_repository_impl.dart';
import '../data/repository_impl/quiz_post_repository_impl.dart';
import '../data/repository_impl/user_quizzes_repository_impl.dart';
import '../domain/use_cases/current_user_data_use_case.dart';
import '../domain/use_cases/log_out_use_case.dart';
import '../domain/use_cases/login_use_case.dart';
import '../domain/use_cases/profile_use_case.dart';
import '../domain/use_cases/quiz_answer_post_use_case.dart';
import '../domain/use_cases/quiz_detail_use_case.dart';
import '../domain/use_cases/quiz_form_use_case.dart';
import '../domain/use_cases/quiz_good_post_use_case.dart';
import '../domain/use_cases/quiz_list_use_case.dart';
import '../domain/use_cases/quiz_post_use_case.dart';
import '../domain/use_cases/user_quizzes_use_case.dart';
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
  currentUserRepositoryProvider
      .overrideWithValue(CurrentUserDataRepositoryImpl()),
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
  profileRepositoryProvider.overrideWithValue(ProfileRepositoryImpl()),
  profileUseCaseProvider.overrideWith((ref) {
    final repository = ref.read(profileRepositoryProvider);
    return ProfileUseCase(repository).fetch();
  }),
  userQuizzesRepositoryProvider.overrideWithValue(UserQuizzesRepositoryImpl()),
  userQuizzesUseCaseProvider.overrideWith((ref) {
    final repository = ref.read(userQuizzesRepositoryProvider);
    return UserQuizzesUseCase(repository);
  }),
  quizAnswerPostRepositoryProvider
      .overrideWithValue(QuizAnswerPostRepositoryImpl()),
  quizAnswerPostUseCaseProvider.overrideWith((ref) {
    final repo = ref.read(quizAnswerPostRepositoryProvider);
    return QuizAnswerPostUseCase(repo);
  }),
  quizDetailRepositoryProvider.overrideWithValue(QuizDetailRepositoryImpl()),
  quizDetailProvider.overrideWith((ref, quizId) {
    final repo = ref.read(quizDetailRepositoryProvider);
    return QuizDetailUseCase(repo, quizId).build();
  }),
  quizGoodPostRepositoryProvider
      .overrideWithValue(QuizGoodPostRepositoryImpl()),
  quizGoodPostUseCaseProvider.overrideWith((ref) {
    final repository = ref.read(quizGoodPostRepositoryProvider);
    return QuizGoodPostUseCase(repository);
  }),
  quizPostRepositoryProvider.overrideWithValue(QuizPostRepositoryImpl()),
  quizPostUseCaseProvider.overrideWith((ref) {
    return QuizPostUseCase(ref.read(quizPostRepositoryProvider));
  }),
  quizFormUseCaseProvider.overrideWith((ref) {
    return QuizFormUseCase();
  }),
];
