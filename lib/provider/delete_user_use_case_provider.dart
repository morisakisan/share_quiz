import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/use_cases/delete_user_use_case.dart';

final deleteUserUseCaseProvider =
    StateNotifierProvider.autoDispose<DeleteUserUseCase, AsyncValue<void>?>(
        (ref) {
  throw UnimplementedError();
});
