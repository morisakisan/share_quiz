import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/data/user/user_state_mapper.dart';
import 'package:share_quiz/domain/common/resource.dart';
import 'package:share_quiz/domain/user/user_data.dart';

class UserLoginStateNotifier extends StateNotifier<Resource<UserData?>> {

  final _dataStore = UserFirebaseStore();

  UserLoginStateNotifier() : super(Resource.loading()) {
    () async {
      final user = await _dataStore.gerCurrentUser();
      state = Resource(UserStateMapper.transform(user));
    }();
  }

  signInWithGoogle() async {
    final user = await _dataStore.signInWithGoogle();
    state = Resource(UserStateMapper.transform(user));
  }

  logout() async {
    await _dataStore.signOutGoogle();
    state = Resource(UserStateMapper.transform(null));
  }
}
