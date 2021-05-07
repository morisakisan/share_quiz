import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserFirebaseStore {
  Future<User?> gerCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<User?> signInWithGoogle() async {
    final googleSignInAccount = await GoogleSignIn().signIn();
    final googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    if (googleSignInAuthentication == null) {
      return null;
    }

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    return user;
  }
}
