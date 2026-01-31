// Project imports:
import 'package:share_quiz/core/infrastructure/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/core/infrastructure/firestore/user/user_firebase_store.dart';
import 'package:share_quiz/core/infrastructure/mappers/user_data_mapper.dart';
import 'package:share_quiz/core/domain/models/user_data.dart';
import 'package:share_quiz/features/profile/domain/repositories/profile_repository.dart';

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
