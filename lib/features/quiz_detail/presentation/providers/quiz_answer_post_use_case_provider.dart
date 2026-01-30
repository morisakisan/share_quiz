// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/quiz_detail/application/use_cases/quiz_answer_post_use_case.dart';

final quizAnswerPostUseCaseProvider =
    StateNotifierProvider.autoDispose<QuizAnswerPostUseCase, AsyncValue<void>?>(
        (ref) {
  throw UnimplementedError();
});
