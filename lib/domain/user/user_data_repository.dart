
import 'package:share_quiz/domain/user/user_data.dart';

abstract class UserDataRepository {
  Future<UserData?> getCurrentUserData();
  Future<UserData?> signInWithGoogle();
  Future<void> signOutWithGoogle();
}