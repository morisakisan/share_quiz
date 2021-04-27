import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_quiz/data/user/user_firebase_storage.dart';
import 'package:share_quiz/data/user/user_state_mapper.dart';
import 'package:share_quiz/domain/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState.loading()) {
        () async {
      await UserFirebaseStorage().dummy();
      state = await UserStateMapper.transform();
    }();
  }

}