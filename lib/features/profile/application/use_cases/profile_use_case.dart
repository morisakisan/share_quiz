// Project imports:
import 'package:share_quiz/core/domain/models/user_data.dart';
import 'package:share_quiz/features/profile/domain/repositories/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository _repository;

  ProfileUseCase(this._repository);

  Future<UserData> fetch() async {
    return _repository.fetch();
  }
}
