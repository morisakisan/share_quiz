// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/google_sign_in/google_signin_store.dart';
import 'package:share_quiz/data/mapper/user_data_mapper.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/domain/repository/user_data_repository.dart';
import '../../domain/models/user/user_data.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _googleSignInStore = GoogleSignInStore();
  final _userDataStore = UserFirebaseStore();

  @override
  Future<UserData?> getCurrentUserData() async {
    final user = _firebaseAuthStore.getCurrentUser();
    if(user == null) {
      return null;
    }
    final dto = await _userDataStore.fetchWhereUid(user.uid);
    if(dto == null) {
      return null;
    }

    return UserDataMapper.transform(dto);
  }

  @override
  Future<UserData?> signInWithGoogle() async {
    final googleSignIn = await _googleSignInStore.signIn();
    await _firebaseAuthStore.signIn(googleSignIn!);
    final firebaseAuth = _firebaseAuthStore.getCurrentUser();

    if (await _userDataStore.isAlreadyUser(firebaseAuth!) == false) {
      await _userDataStore.setUserData(firebaseAuth);
    }
    var dto = await _userDataStore.fetchWhereUid(firebaseAuth.uid);
    if(dto == null) {
      return null;
    }

    return UserDataMapper.transform(dto);
  }

  @override
  Future<void> signOutWithGoogle() async {
    await _googleSignInStore.signOut();
    await _firebaseAuthStore.signOut();
  }
}
