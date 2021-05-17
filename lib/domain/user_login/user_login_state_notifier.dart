import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/data/user/user_state_mapper.dart';
import 'package:share_quiz/domain/user_login/user_login_state.dart';

class UserLoginStateNotifier extends StateNotifier<UserLoginState> {

  final _dataStore = UserFirebaseStore();

  UserLoginStateNotifier() : super(UserLoginState.loading()) {
    () async {
      final user = await _dataStore.gerCurrentUser();
      state = await UserStateMapper.transform(user);
    }();
  }

  signInWithGoogle() async {
    final user = await _dataStore.signInWithGoogle();
    state = await UserStateMapper.transform(user);
  }

  logout() async {
    await _dataStore.signOutGoogle();
    state = await UserStateMapper.transform(null);
  }
}
