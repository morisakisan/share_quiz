// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/domain/models/user_data.dart';
import 'package:share_quiz/core/domain/repositories/user_repository.dart';

class HomeUserUseCase extends StreamNotifier<UserData?> {
  final UserRepository _repository;

  HomeUserUseCase(this._repository) : super();

  @override
  Stream<UserData?> build() {
    return _repository.fetch();
  }
}
