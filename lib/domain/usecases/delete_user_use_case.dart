// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/repository/delete_user_repository.dart';

class DeleteUserUseCase extends StateNotifier<AsyncValue<void>?> {
  final DeleteUserRepository _repository;

  DeleteUserUseCase(this._repository) : super(null);

  Future<void> delete() async {
    try {
      state = AsyncValue.loading();
      await _repository.delete();
      state = AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
