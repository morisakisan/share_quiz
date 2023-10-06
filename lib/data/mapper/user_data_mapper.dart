// Project imports:
import 'package:share_quiz/data/user/user_dto.dart';
import '../../domain/models/user/user_data.dart';

class UserDataMapper {
  UserDataMapper._();

  static UserData transform(UserDto user) {
    return UserData(uid: user.uid, name: user.name, photoUrl: user.photoUrl);
  }
}
