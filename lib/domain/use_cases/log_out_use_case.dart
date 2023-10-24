// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/user/user_data.dart';
import '../repository/log_out_repository.dart';

class LogOutUseCase extends StateNotifier<AsyncValue<void>> {
  final LogOutRepository _repository;

  LogOutUseCase(this._repository) : super(AsyncValue.data(null)) {}

  Future<void> logout() async {
    state = AsyncValue.loading();
    await _repository.logout();
    state = AsyncValue.data(null);
  }
}
