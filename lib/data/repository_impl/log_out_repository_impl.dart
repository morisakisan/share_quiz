// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/google_sign_in/google_signin_store.dart';
import 'package:share_quiz/domain/repository/log_out_repository.dart';

class LogOutRepositoryImpl extends LogOutRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _googleSignInStore = GoogleSignInStore();

  @override
  Future<void> logout() async {
    await _googleSignInStore.signOut();
    await _firebaseAuthStore.signOut();
  }
}
