import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_quiz/domain/user/user_data.dart';
import 'package:share_quiz/domain/user/user_state.dart';

class UserStateMapper {
  UserStateMapper._();
  static Future<UserState> transform(User? user) async {
    return UserState(
      UserData(
          name: "たかし",
          detail: "よろしく",
          photoUrl:
              "https://i.pinimg.com/originals/bd/27/d9/bd27d92d14c0b460fb103f24ddf09f09.jpg"),
    );
  }
}
