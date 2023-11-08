// Project imports:
import '../models/user/user_data.dart';

abstract class CurrentUserDataRepository {
  Stream<UserData?> fetch();
}
