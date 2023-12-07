// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/use_cases/quiz_good_post_use_case.dart';

final quizGoodPostUseCaseProvider =
StateNotifierProvider.autoDispose<QuizGoodPostUseCase, AsyncValue<void>?>((
    ref) {
  throw UnimplementedError();
});
