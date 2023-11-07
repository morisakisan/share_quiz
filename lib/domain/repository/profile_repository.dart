// Project imports:
import '../../domain/models/user/user_data.dart';

abstract class ProfileRepository {
  UserData fetch();
}
