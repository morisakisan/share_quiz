// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../domain/models/setting/setting.dart';
import '../../domain/repository/setting_repository.dart';

class SettingUseCase extends StreamNotifier<Setting> {
  final SettingRepository _repository;

  SettingUseCase(this._repository) : super();

  @override
  Stream<Setting> build() {
    return _repository.fetch();
  }
}
