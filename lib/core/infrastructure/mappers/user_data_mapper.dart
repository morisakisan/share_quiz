// Project imports:
import 'package:share_quiz/core/infrastructure/firestore/user/user_dto.dart';
import 'package:share_quiz/core/domain/models/user_data.dart';

class UserDataMapper {
  UserDataMapper._();

  static UserData transform(UserDto user) {
    return UserData(uid: user.uid, name: user.name, photoUrl: user.photoUrl);
  }
}
