// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:share_quiz/data/user/user_dto.dart';

class UserFirebaseStore {
  Stream<User?> listenToUserChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<User?> getCurrentUser() async {
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

    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    return user;
  }

  Future<void> signOutGoogle() {
    return GoogleSignIn().signOut();
  }

  CollectionReference<Map<String, dynamic>> _getCollection() =>
      FirebaseFirestore.instance.collection('user');

  Future<bool> isAlreadyUser(User user) async {
    final data = await _getCollection().where('uid', isEqualTo: user.uid).get();
    return data.docs.isNotEmpty;
  }

  setUserData(User user) async {
    final dto = UserDto(
        uid: user.uid,
        name: user.displayName!,
        photoUrl: user.photoURL!,
        createdAt: DateTime.now());

    var userJson = dto.toJson();
    userJson['created_at'] = FieldValue.serverTimestamp();

    return await _getCollection().doc().set(
          userJson,
        );
  }

  Future<UserDto> fetchWhereUid(String uid) async {
    final doc = await _getCollection().where("uid", isEqualTo: uid).get();
    final json = doc.docs.first.data();
    return UserDto.fromJson(json);
  }
}
