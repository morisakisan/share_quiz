// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/models/setting/setting.dart';
import 'package:share_quiz/domain/models/user/user_data.dart';
import 'package:share_quiz/domain/repository/setting_repository.dart';

import '../repository/current_login_repository.dart';

class CurrentLoginUseCase extends StreamNotifier<UserData?> {
  final CurrentLoginRepository _repository;

  CurrentLoginUseCase(this._repository) : super();

  @override
  Stream<UserData?> build() {
    return _repository.fetch();
  }
}
