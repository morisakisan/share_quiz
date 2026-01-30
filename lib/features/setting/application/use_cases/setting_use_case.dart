// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/setting/domain/models/setting.dart';
import 'package:share_quiz/features/setting/domain/repositories/setting_repository.dart';

class SettingUseCase extends StreamNotifier<Setting> {
  final SettingRepository _repository;

  SettingUseCase(this._repository) : super();

  @override
  Stream<Setting> build() {
    return _repository.fetch();
  }
}
