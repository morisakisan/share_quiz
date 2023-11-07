import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/repository/setting_repository.dart';

final settingRepositoryProvider =
    Provider.autoDispose<SettingRepository>((ref) {
  throw UnimplementedError();
});
