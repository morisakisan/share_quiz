// Project imports:
import '../../domain/repository/login_repository.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../google_sign_in/google_signin_store.dart';

class LoginRepositoryImpl extends LoginRepository {

  final _firebaseAuthStore = FirebaseAuthStore();
  final _googleSignInStore = GoogleSignInStore();

  @override
  Future<void> login() async {
    final googleSignIn = await _googleSignInStore.signIn();
    await _firebaseAuthStore.signIn(googleSignIn!);
  }

}
