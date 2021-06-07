// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_quiz/data/user/user_dto.dart';

// Project imports:
import 'package:share_quiz/domain/user/user_data.dart';

class UserStateMapper {
  UserStateMapper._();

  static UserData transform(UserDto user) {
    return UserData(uid: user.uid, name: user.name, photoUrl: user.photoUrl);
  }
}
