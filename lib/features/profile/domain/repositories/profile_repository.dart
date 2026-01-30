// Project imports:
import 'package:share_quiz/core/domain/models/user_data.dart';

abstract class ProfileRepository {
  Future<UserData> fetch();
}
