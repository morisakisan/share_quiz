// Project imports:
import 'package:share_quiz/domain/models/setting/setting.dart';

abstract class SettingRepository {
  Stream<Setting> fetch();
}
