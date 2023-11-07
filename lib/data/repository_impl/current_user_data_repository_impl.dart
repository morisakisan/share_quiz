// Project imports:
import 'package:share_quiz/domain/repository/current_user_data_repository.dart';
import '../../domain/models/user/user_data.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../mapper/user_data_mapper.dart';

class CurrentUserDataRepositoryImpl extends CurrentUserDataRepository {
  @override
  Stream<UserData?> fetch() {
    return FirebaseAuthStore().listenToUserChanges()
        .map((user) {
      if (user == null) {
        return null;
      }
      return UserDataMapper.transform(user);
    });
  }
}
