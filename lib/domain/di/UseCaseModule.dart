import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/usecases/user_login_usecase.dart';

import '../../data/di/repository_module.dart';
import '../models/user/user_data.dart';

final userLoginUseCaseProvider = StateNotifierProvider.autoDispose<UserLoginUseCase, AsyncValue<UserData?>>(
      (ref) => UserLoginUseCase(ref.read(userDataRepositoryProvider)),
);