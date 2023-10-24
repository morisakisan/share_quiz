
import '../models/user/user_data.dart';

abstract class CurrentLoginRepository {
  Stream<UserData?> fetch();
}
