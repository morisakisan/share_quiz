import 'package:share_quiz/data/mapper/user_state_mapper.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/domain/user/user_data.dart';
import 'package:share_quiz/domain/user/user_data_repository.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final _dataStore = UserFirebaseStore();

  @override
  Future<UserData?> getCurrentUserData() async {
    final user = await _dataStore.gerCurrentUser();
    if(user != null) {
      final dto = await _dataStore.fetchWhereUid(user.uid);
      print(dto);
      return UserStateMapper.transform(dto);
    } else {
      return null;
    }
  }

  @override
  Future<UserData?> signInWithGoogle() async {
    final user = await _dataStore.signInWithGoogle();
    if (user != null) {
      if (!await _dataStore.isAlreadyUser(user)) {
        await _dataStore.setUserData(user);
      }
      final dto = await _dataStore.fetchWhereUid(user.uid);
      return UserStateMapper.transform(dto);
    }
    return null;
  }

  @override
  Future<void> signOutWithGoogle() async {
    await _dataStore.signOutGoogle();
  }
}
