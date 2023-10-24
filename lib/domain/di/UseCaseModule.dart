// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/use_cases/user_login_use_case.dart';
import '../../data/di/repository_module.dart';
import '../models/user/user_data.dart';

final userLoginUseCaseProvider = StateNotifierProvider.autoDispose<UserLoginUseCase, AsyncValue<UserData?>>(
      (ref) => UserLoginUseCase(ref.read(userDataRepositoryProvider)),
);
