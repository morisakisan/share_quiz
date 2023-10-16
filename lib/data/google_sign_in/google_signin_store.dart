import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInStore {

  Future<GoogleSignInAccount?> signIn() {
    return GoogleSignIn().signIn();
  }

  Future<void> signOut() {
    return GoogleSignIn().signOut();
  }
}