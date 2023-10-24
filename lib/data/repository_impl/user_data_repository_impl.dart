// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/google_sign_in/google_signin_store.dart';
import 'package:share_quiz/data/mapper/user_data_mapper.dart';
import 'package:share_quiz/domain/repository/user_data_repository.dart';
import '../../domain/models/user/user_data.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _googleSignInStore = GoogleSignInStore();

  @override
  Future<UserData?> signInWithGoogle() async {
    final googleSignIn = await _googleSignInStore.signIn();
    await _firebaseAuthStore.signIn(googleSignIn!);
    final firebaseAuth = _firebaseAuthStore.getCurrentUser();
    return UserDataMapper.transform(firebaseAuth!);
  }

  @override
  Future<void> signOutWithGoogle() async {
    await _googleSignInStore.signOut();
    await _firebaseAuthStore.signOut();
  }
}
