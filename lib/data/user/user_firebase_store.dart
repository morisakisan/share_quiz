// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:share_quiz/data/user/user_dto.dart';

class UserFirebaseStore {
  CollectionReference<Map<String, dynamic>> _getCollection() =>
      FirebaseFirestore.instance.collection('user');

  Future<bool> isAlreadyUser(User user) async {
    final data = await _getCollection().where('uid', isEqualTo: user.uid).get();
    return data.docs.isNotEmpty;
  }

  Future<void> setUserData(User user) async {
    final dto = UserDto(
        uid: user.uid,
        name: user.displayName!,
        photoUrl: user.photoURL!,
        createdAt: DateTime.now());

    var userJson = dto.toJson();
    userJson['created_at'] = FieldValue.serverTimestamp();

    return await _getCollection().doc(user.uid).set(
          userJson,
        );
  }

  Future<UserDto?> fetchWhereUid(String uid) async {
    final doc = await _getCollection().where("uid", isEqualTo: uid).get();
    if (doc.docs.isEmpty) {
      return null;
    }
    final json = doc.docs.first.data();
    return UserDto.fromJson(json);
  }
}
