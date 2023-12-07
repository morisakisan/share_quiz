// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/data/firestore/user/user_firebase_store.dart';
import 'package:share_quiz/data/mapper/user_data_mapper.dart';
import 'package:share_quiz/domain/models/user/user_data.dart';
import 'package:share_quiz/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  var firebaseAuthStore = FirebaseAuthStore();
  var userFirebaseStore = UserFirebaseStore();

  @override
  Future<UserData> fetch() async {
    var user = firebaseAuthStore.getCurrentUser();
    var userDto = await userFirebaseStore.fetchWhereUid(user!.uid);
    return UserDataMapper.transform(userDto);
  }
}
