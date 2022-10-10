// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/repository_impl/user_data_repository_impl.dart';

// Project imports:
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/user/user_data.dart';

import '../user/user_data_repository.dart';

class UserLoginUseCase extends StateNotifier<Resource<UserData?>> {
  final UserDataRepository _repository;

  UserLoginUseCase(this._repository) : super(Resource.loading()) {
    _repository.getCurrentUserData().then(
      (value) {
        state = Resource(value);
      },
    ).catchError(
      (error) {
        state = Resource.error(error);
      },
    );
  }

  signInWithGoogle() {
    _repository.signInWithGoogle().then(
      (value) {
        state = Resource(value);
      },
    ).catchError(
      (error) {
        state = Resource.error(error);
      },
    );
  }

  logout() {
    _repository.signOutWithGoogle().then(
      (value) {
        state = Resource(null);
      },
    );
  }
}
