// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/repository/login_repository.dart';

// Project imports:

class LoginUseCase extends StateNotifier<AsyncValue<void>> {
  final LoginRepository _repository;

  LoginUseCase(this._repository) : super(const AsyncValue.data(null));

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      var value = await _repository.login();
      state = AsyncValue.data(value);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }

}
