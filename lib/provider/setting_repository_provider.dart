// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/repository/setting_repository.dart';

final settingRepositoryProvider =
    Provider.autoDispose<SettingRepository>((ref) {
  throw UnimplementedError();
});
