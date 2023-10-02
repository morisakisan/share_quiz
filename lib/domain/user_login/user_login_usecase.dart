// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:share_quiz/domain/user/user_data.dart';

import '../user/user_data_repository.dart';

class UserLoginUseCase extends StateNotifier<AsyncValue<UserData?>> {
  final UserDataRepository _repository;

  UserLoginUseCase(this._repository) : super(AsyncValue.loading()) {
    _repository.getCurrentUserData().then(
      (value) {
        state = AsyncValue.data(value);
      },
    ).catchError(
      (error) {
        state = AsyncValue.error(error, error);
      },
    );
  }

  signInWithGoogle() async {
    state = AsyncValue.loading();
    try {
      var value = await _repository.signInWithGoogle();
      state = AsyncValue.data(value);
    } catch(error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }

  logout() {
    _repository.signOutWithGoogle().then(
      (value) {
        state = AsyncValue.data(null);
      },
    );
  }
}
