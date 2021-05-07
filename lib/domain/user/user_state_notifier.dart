import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/data/user/user_state_mapper.dart';
import 'package:share_quiz/domain/user/user_data.dart';
import 'package:share_quiz/domain/user/user_state.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier() : super(UserState.loading()) {
    () async {
      final user = await UserFirebaseStore().gerCurrentUser();
      state = await UserStateMapper.transform(user);
    }();
  }

  signInGoogle() async {
    var userData = UserData(name: "たかし", detail: "よろしく", photoUrl: "");
    state = UserState(
      userData,
    );
  }
}
