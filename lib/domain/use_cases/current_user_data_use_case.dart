// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../domain/models/user/user_data.dart';
import '../repository/current_user_data_repository.dart';

class CurrentUserDataUseCase extends StreamNotifier<UserData?> {
  final CurrentUserDataRepository _repository;

  CurrentUserDataUseCase(this._repository) : super();

  @override
  Stream<UserData?> build() {
    return _repository.fetch();
  }
}
