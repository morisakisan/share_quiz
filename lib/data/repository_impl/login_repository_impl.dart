// Project imports:
import 'package:share_quiz/data/firestore/user/user_firebase_store.dart';
import '../../domain/repository/login_repository.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../google_sign_in/google_signin_store.dart';

class LoginRepositoryImpl extends LoginRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _googleSignInStore = GoogleSignInStore();
  final _userFirebaseStore = UserFirebaseStore();

  @override
  Future<void> login() async {
    final googleSignIn = await _googleSignInStore.signIn();
    var userCredential = await _firebaseAuthStore.signIn(googleSignIn!);
    if (userCredential.additionalUserInfo?.isNewUser == true) {
      var user = userCredential.user;
      if (user != null) {
        _userFirebaseStore.setUserData(user);
      }
    }
  }
}
