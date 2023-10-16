import 'package:share_quiz/domain/models/setting/setting.dart';
import 'package:share_quiz/domain/repository/setting_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingUseCase extends StreamNotifier<Setting> {
  final SettingRepository _repository;

  SettingUseCase(this._repository) : super();

  @override
  Stream<Setting> build() {
    return _repository.fetch();
  }
}
