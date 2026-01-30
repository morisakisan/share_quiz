// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/domain/repositories/auth_repository.dart';

class LogOutUseCase extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _repository;

  LogOutUseCase(this._repository) : super(const AsyncValue.data(null));

  Future<void> logout() async {
    try {
      state = const AsyncValue.loading();
      await _repository.logout();
      state = const AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
