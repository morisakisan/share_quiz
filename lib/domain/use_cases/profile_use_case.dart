import '../models/user/user_data.dart';
import '../repository/profile_repository.dart';

class ProfileUseCase {
  ProfileRepository repository;

  ProfileUseCase(this.repository);

  Future<UserData> fetch() async {
    return repository.fetch();
  }
}
