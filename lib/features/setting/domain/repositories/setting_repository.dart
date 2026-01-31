// Project imports:
import 'package:share_quiz/features/setting/domain/models/setting.dart';

abstract class SettingRepository {
  Stream<Setting> fetch();
}
