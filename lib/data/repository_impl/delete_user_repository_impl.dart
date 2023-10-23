// Project imports:
import '../../domain/repository/delete_user_repository.dart';
import '../delete_user/delete_user_data_store.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../google_sign_in/google_signin_store.dart';

class DeleteUserRepositoryImpl extends DeleteUserRepository {

  @override
  Future<void> delete() async {
    await DeleteUserDataStore().deleteUserAccount();
    await FirebaseAuthStore().signOut();
    await GoogleSignInStore().signOut();
  }
}
