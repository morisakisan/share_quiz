// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import '../../domain/models/user/user_data.dart';
import '../firestore/user/user_dto.dart';

class UserDataMapper {
  UserDataMapper._();

  static UserData transform(UserDto user) {
    return UserData(uid: user.uid, name: user.name, photoUrl: user.photoUrl);
  }
}
