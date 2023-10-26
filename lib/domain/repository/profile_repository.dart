import 'package:share_quiz/domain/models/user/user_data.dart';

abstract class ProfileRepository {
  UserData fetch();
}
