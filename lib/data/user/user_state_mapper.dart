// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:share_quiz/domain/user/user_data.dart';

class UserStateMapper {
  UserStateMapper._();

  static UserData? transform(User? user) {
    UserData? userData;
    if (user != null) {
      userData = UserData(
          uid: user.uid,
          name: user.displayName ?? "",
          detail: "よろしく",
          photoUrl: user.photoURL ?? "");
    }
    return userData;
  }
}
