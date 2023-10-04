// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/data/repository_impl/quiz_post_repository_impl.dart';
import '../models/quiz_post/quiz_post_data.dart';

class QuizPostUseCase extends StateNotifier<AsyncValue<void>?> {
  final _repository = QuizPostRepositoryImpl();

  QuizPostUseCase() : super(null);

  post(QuizPostData post) async {
    try {
      await _repository.store(post);
      state = AsyncValue.data(null);
    } catch (error, stacktrace) {
      state = AsyncValue.error(error, stacktrace);
    }
  }
}
