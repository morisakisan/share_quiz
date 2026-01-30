// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'google_signin_config.dart';

class GoogleSignInStore {
  Future<UserCredential?> signIn() async {
    try {
      final sign = GoogleSignIn.instance;
      await sign.initialize(
        serverClientId: GoogleSignInConfig.serverClientId,
      );

      // ユーザー選択UIを表示
      final googleUser = await sign.authenticate();

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
