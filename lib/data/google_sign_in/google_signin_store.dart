// Package imports:
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInStore {

  var googleSignIn = GoogleSignIn(clientId: "574942560083-folgos2mn8dc5vbjo7r7264pc6c7t0rv.apps.googleusercontent.com");

  Future<GoogleSignInAccount?> signIn() {
    return googleSignIn.signIn();
  }

  Future<void> signOut() {
    return googleSignIn.signOut();
  }
}
