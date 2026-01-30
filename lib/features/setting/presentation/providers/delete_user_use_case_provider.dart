// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/setting/application/use_cases/delete_user_use_case.dart';

final deleteUserUseCaseProvider =
    StateNotifierProvider.autoDispose<DeleteUserUseCase, AsyncValue<void>?>(
        (ref) {
  throw UnimplementedError();
});
