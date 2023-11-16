// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/firestore/user/user_firebase_store.dart';
import 'package:share_quiz/data/mapper/user_data_mapper.dart';
import 'package:share_quiz/domain/models/user/user_data.dart';
import 'package:share_quiz/domain/repository/current_user_data_repository.dart';

class CurrentUserDataRepositoryImpl extends CurrentUserDataRepository {
  var firebaseAuthStore = FirebaseAuthStore();
  var userFirebaseStore = UserFirebaseStore();

  @override
  Stream<UserData?> fetch() {
    return firebaseAuthStore.listenToUserChanges().asyncMap((user) async {
      if (user == null) {
        return null;
      }
      var userDto = await userFirebaseStore.fetchWhereUid(user.uid);
      return UserDataMapper.transform(userDto);
    });
  }
}
