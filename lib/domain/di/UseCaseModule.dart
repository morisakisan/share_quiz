import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/domain/user_login/user_login_usecase.dart';

import '../../data/di/repository_module.dart';
import '../common/resource.dart';
import '../user/user_data.dart';

final userLoginUseCaseProvider = StateNotifierProvider.autoDispose<UserLoginUseCase, Resource<UserData?>>(
      (ref) => UserLoginUseCase(ref.read(userDataRepositoryProvider)),
);