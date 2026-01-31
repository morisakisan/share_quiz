// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/quiz_detail/application/use_cases/quiz_good_use_case.dart';

final quizGoodPostUseCaseProvider =
    StateNotifierProvider.autoDispose<QuizGoodUseCase, AsyncValue<void>?>(
        (ref) {
  throw UnimplementedError();
});
