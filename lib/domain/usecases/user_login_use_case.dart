// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/user/user_data.dart';
import '../repository/user_data_repository.dart';

class UserLoginUseCase extends StateNotifier<AsyncValue<UserData?>> {
  final UserDataRepository _repository;

  UserLoginUseCase(this._repository) : super(AsyncValue.loading()) {
    try {
      _repository.getCurrentUserData().then((value) {
        state = AsyncValue.data(value);
      });
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }

  signInWithGoogle() async {
    state = AsyncValue.loading();
    try {
      var value = await _repository.signInWithGoogle();
      state = AsyncValue.data(value);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }

  logout() async {
    state = AsyncValue.loading();
    _repository.signOutWithGoogle().then(
      (value) {
        state = AsyncValue.data(null);
      },
    );
  }
}
