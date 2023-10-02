import 'package:share_quiz/data/mapper/user_data_mapper.dart';
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/domain/repository/user_data_repository.dart';

import '../../domain/models/user/user_data.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final _dataStore = UserFirebaseStore();

  @override
  Future<UserData?> getCurrentUserData() {
    return _dataStore.gerCurrentUser().then((user) {
      if (user == null) {
        return null;
      }
      return _dataStore.fetchWhereUid(user.uid).then((dto) {
        return UserDataMapper.transform(dto);
      });
    });
  }

  @override
  Future<UserData?> signInWithGoogle() {
    return _dataStore.signInWithGoogle().then((user) {
      if (user == null) {
        return null;
      }
      return _dataStore.isAlreadyUser(user).then((value) {
        if (!value) {
          _dataStore.setUserData(user);
        }
        return _dataStore.fetchWhereUid(user.uid).then((dto) {
          return UserDataMapper.transform(dto);
        });
      });
    });
  }

  @override
  Future<void> signOutWithGoogle() async {
    await _dataStore.signOutGoogle();
  }
}
