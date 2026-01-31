// Project imports:
import 'package:share_quiz/core/infrastructure/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/core/infrastructure/firestore/user/user_firebase_store.dart';
import 'package:share_quiz/core/infrastructure/mappers/user_data_mapper.dart';
import 'package:share_quiz/core/domain/models/user_data.dart';
import 'package:share_quiz/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final _firebaseAuthStore = FirebaseAuthStore();
  final _userFirebaseStore = UserFirebaseStore();

  @override
  Stream<UserData?> fetch() {
    return _firebaseAuthStore.listenToUserChanges().asyncMap((user) async {
      if (user == null) {
        return null;
      }
      var userDto = await _userFirebaseStore.fetchWhereUid(user.uid);
      return UserDataMapper.transform(userDto);
    });
  }
}
