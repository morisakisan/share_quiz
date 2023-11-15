// Project imports:
import 'package:share_quiz/domain/repository/delete_quiz_repository.dart';

import '../models/user/user_data.dart';
import '../repository/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository _repository;

  ProfileUseCase(this._repository);

  Future<UserData> fetch() async {
    return _repository.fetch();
  }
}
