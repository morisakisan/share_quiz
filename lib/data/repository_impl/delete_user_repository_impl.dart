// Project imports:
import '../../domain/repository/delete_user_repository.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../google_sign_in/google_signin_store.dart';

class DeleteUserRepositoryImpl extends DeleteUserRepository {

  @override
  Future<void> delete() async {
    await FirebaseAuthStore().signOut();
    await GoogleSignInStore().signOut();
  }
}
