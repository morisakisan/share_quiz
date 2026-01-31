// Project imports:
import 'package:share_quiz/features/setting/domain/repositories/delete_user_repository.dart';
import 'package:share_quiz/core/infrastructure/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/core/infrastructure/google_sign_in/google_signin_store.dart';

class DeleteUserRepositoryImpl extends DeleteUserRepository {
  @override
  Future<void> delete() async {
    await FirebaseAuthStore().delete();
    await GoogleSignInStore().signOut();
  }
}
