// Package imports:
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:share_quiz/core/infrastructure/firebase_auth/firebase_auth_store.dart';
import 'package:share_quiz/features/setting/domain/models/setting.dart';
import 'package:share_quiz/features/setting/domain/repositories/setting_repository.dart';

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
