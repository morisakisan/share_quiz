// Project imports:
import 'package:share_quiz/domain/models/user/user_data.dart';
import 'package:share_quiz/domain/repository/profile_repository.dart';
import '../firebase_auth/firebase_auth_store.dart';
import '../mapper/user_data_mapper.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  UserData fetch() {
    var user = FirebaseAuthStore().getCurrentUser();
    return UserDataMapper.transform(user!);
  }
}
