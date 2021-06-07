// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/repository_impl/user_data_repository_impl.dart';

// Project imports:
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/data/mapper/user_state_mapper.dart';
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/user/user_data.dart';

class UserLoginStateNotifier extends StateNotifier<Resource<UserData?>> {
  final _repository = UserDataRepositoryImpl();

  UserLoginStateNotifier() : super(Resource.loading()) {
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
