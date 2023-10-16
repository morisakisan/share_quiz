import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthStore {
  Future<void> signIn(GoogleSignInAccount account) async {
    final googleSignInAuthentication = await account.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

  Stream<User?> listenToUserChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> updateProfilePhoto(String photoURL) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.updatePhotoURL(photoURL);
      await user.reload();  // ユーザー情報を再読み込み
    }
  }
}
