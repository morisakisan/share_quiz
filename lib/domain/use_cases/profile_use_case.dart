// Project imports:
import '../models/user/user_data.dart';
import '../repository/profile_repository.dart';

class ProfileUseCase {
  ProfileRepository _repository;

  ProfileUseCase(this._repository);

  Future<UserData> fetch() async {
    return _repository.fetch();
  }
}
