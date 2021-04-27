import 'package:share_quiz/domain/user/user.dart';
import 'package:share_quiz/domain/user/user_state.dart';

class UserStateMapper {
  static Future<UserState> transform() async {
    return UserState(
      User(
          id: 1,
          name: "たかし",
          detail: "よろしく",
          photoUrl:
              "https://i.pinimg.com/originals/bd/27/d9/bd27d92d14c0b460fb103f24ddf09f09.jpg"),
    );
  }
}
