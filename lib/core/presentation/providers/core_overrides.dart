// Project imports:
import 'package:share_quiz/core/infrastructure/repositories/auth_repository_impl.dart';
import 'package:share_quiz/core/infrastructure/repositories/user_repository_impl.dart';
import 'package:share_quiz/core/application/use_cases/login_use_case.dart';
import 'package:share_quiz/core/application/use_cases/log_out_use_case.dart';
import 'package:share_quiz/core/presentation/providers/auth_repository_provider.dart';
import 'package:share_quiz/core/presentation/providers/current_user_provider.dart';
import 'package:share_quiz/core/presentation/providers/current_user_repository_provider.dart';
import 'package:share_quiz/core/presentation/providers/login_use_case_provider.dart';
import 'package:share_quiz/core/presentation/providers/log_out_use_case_provider.dart';
import 'package:share_quiz/features/home/application/use_cases/home_user_use_case.dart';

final coreOverrides = [
  authRepositoryProvider.overrideWith((ref) => AuthRepositoryImpl()),
  currentUserRepositoryProvider.overrideWith((ref) => UserRepositoryImpl()),
  currentUserProvider.overrideWith((ref) {
    var repository = ref.read(currentUserRepositoryProvider);
    return HomeUserUseCase(repository).build();
  }),
  loginUseCaseProvider.overrideWith((ref) {
    var repository = ref.read(authRepositoryProvider);
    return LoginUseCase(repository);
  }),
  logOutUseCaseProvider.overrideWith((ref) {
    var repository = ref.read(authRepositoryProvider);
    return LogOutUseCase(repository);
  }),
];
