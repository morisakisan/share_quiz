// Project imports:
import '../models/user/user_data.dart';

abstract class UserDataRepository {

  Future<UserData?> signInWithGoogle();

  Future<void> signOutWithGoogle();
}
