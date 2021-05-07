import 'package:firebase_auth/firebase_auth.dart';

class UserFirebaseStore {
  Future<User?> gerCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}
