// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/post/application/use_cases/quiz_post_use_case.dart';

final quizPostUseCaseProvider =
    StateNotifierProvider.autoDispose<QuizPostUseCase, AsyncValue<void>?>(
        (ref) {
  throw UnimplementedError();
});
