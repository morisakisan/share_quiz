// Project imports:
import 'package:share_quiz/core/domain/models/user_data.dart';

abstract class UserRepository {
  Stream<UserData?> fetch();
}
