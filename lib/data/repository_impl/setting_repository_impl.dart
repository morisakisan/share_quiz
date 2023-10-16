// Package imports:
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:share_quiz/data/user/user_firebase_store.dart';
import 'package:share_quiz/domain/repository/setting_repository.dart';
import '../../domain/models/setting/setting.dart';

class SettingRepositoryImpl extends SettingRepository {
  final _userDataStore = UserFirebaseStore();

  @override
  Stream<Setting> fetch() {
    return _userDataStore.listenToUserChanges().asyncExpand<Setting>((
        user) async* {
      var info = await PackageInfo.fromPlatform();
      Setting(packageInfo: info, isLogin: user != null);
    });
  }
}
