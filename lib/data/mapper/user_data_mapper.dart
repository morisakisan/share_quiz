// Project imports:
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/models/user/user_data.dart';

class UserDataMapper {
  UserDataMapper._();

  static UserData transform(User user) {
    return UserData(uid: user.uid, name: user.displayName, photoUrl: user.photoURL);
  }
}
