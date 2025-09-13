// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInStore {
  Future<UserCredential?> signIn() async {
    try {

      await GoogleSignIn.instance.initialize(
        serverClientId: '1:225826406409:android:e45b90e5dd989c4391b8d8',
      );

      // 新しいauthenticate()メソッドを使用（v7.0以降）
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email'], // スコープヒント（オプション）
      );

      // 認証情報を取得（v7.0では同期的にアクセス可能）
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Firebase credentialを作成
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      // Firebase Authにサインイン
      return FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    return await GoogleSignIn.instance.signOut();
  }
}
