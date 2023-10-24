// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../models/quiz_post/quiz_post_data.dart';
import '../repository/quiz_post_repository.dart';

class QuizPostUseCase extends StateNotifier<AsyncValue<void>?> {
  final QuizPostRepository _repository;

  QuizPostUseCase(this._repository) : super(null);

  Future<void> post(QuizPostData post) async {
    try {
      await _repository.store(post);
      state = AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
