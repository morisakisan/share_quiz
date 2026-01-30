// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/setting/domain/repositories/setting_repository.dart';

final setting_repository_provider = Provider.autoDispose<SettingRepository>((ref) {
  throw UnimplementedError();
});
