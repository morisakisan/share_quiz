// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthStore {
  Future<void> delete() async {
    return FirebaseAuth.instance.currentUser?.delete();
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
      await user.reload(); // ユーザー情報を再読み込み
    }
  }
}
