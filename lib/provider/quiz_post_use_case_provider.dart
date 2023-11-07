// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/use_cases/quiz_post_use_case.dart';

final quizPostUseCaseProvider =
    StateNotifierProvider.autoDispose<QuizPostUseCase, AsyncValue<Object?>?>(
        (ref) {
  throw UnimplementedError();
});
