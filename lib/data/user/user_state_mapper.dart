import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_quiz/domain/user/user_data.dart';
import 'package:share_quiz/domain/user/user_state.dart';

class UserStateMapper {
  UserStateMapper._();

  static Future<UserState> transform(User? user) async {
    UserData? userData;
    if (user != null) {
      userData = UserData(
          name: user.displayName ?? "",
          detail: "よろしく",
          photoUrl: user.photoURL ?? "");
    }
    return UserState(
      userData,
    );
  }
}
