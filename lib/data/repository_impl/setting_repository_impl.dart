// Package imports:
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:share_quiz/data/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/domain/repository/setting_repository.dart';
import '../../domain/models/setting/setting.dart';

class SettingRepositoryImpl extends SettingRepository {
  final _userDataStore = FirebaseAuthStore();

  @override
  Stream<Setting> fetch() {
    return CombineLatestStream.combine2(
        Stream.fromFuture(PackageInfo.fromPlatform()),
        _userDataStore.listenToUserChanges(),
            (info, user) => Setting(packageInfo: info, isLogin: user != null)
    );
  }
}
