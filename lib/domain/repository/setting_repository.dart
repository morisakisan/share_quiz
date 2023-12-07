// Project imports:
import '../../domain/models/setting/setting.dart';

abstract class SettingRepository {
  Stream<Setting> fetch();
}
