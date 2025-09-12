// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInStore {

  Future<UserCredential?> signIn() async {
    try {
      // GoogleSignInインスタンスの初期化（clientIdはFirebaseのWebクライアントIDを指定する場合）
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      // 新しいauthenticate()メソッドを使用（v7.0以降）
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate(
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
    } on GoogleSignInException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    return await GoogleSignIn.instance.signOut();
  }
}
