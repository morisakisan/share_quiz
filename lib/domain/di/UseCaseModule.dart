import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/user_login/user_login_usecase.dart';

import '../../data/di/repository_module.dart';

final userLoginUseCaseProvider = StateNotifierProvider.autoDispose(
      (ref) => UserLoginUseCase(ref.read(userDataRepositoryProvider)),
);