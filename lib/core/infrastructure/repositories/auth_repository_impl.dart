// Project imports:
import 'package:share_quiz/core/infrastructure/firestore/user/user_firebase_store.dart';
import 'package:share_quiz/core/infrastructure/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/core/infrastructure/google_sign_in/google_signin_store.dart';
import 'package:share_quiz/core/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _googleSignInStore = GoogleSignInStore();
  final _userFirebaseStore = UserFirebaseStore();
  final _firebaseAuthStore = FirebaseAuthStore();

  @override
  Future<void> signInWithGoogle() async {
    final userCredential = await _googleSignInStore.signIn();
    if (userCredential?.additionalUserInfo?.isNewUser == true) {
      var user = userCredential?.user;
      if (user != null) {
        await _userFirebaseStore.setUserData(user);
      }
    }
  }

  @override
  Future<void> logout() async {
    await _googleSignInStore.signOut();
    await _firebaseAuthStore.signOut();
  }
}
