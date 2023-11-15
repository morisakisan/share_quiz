// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/use_cases/delete_quiz_use_case.dart';
import '../domain/use_cases/delete_user_use_case.dart';

final deleteQuizUseCaseProvider =
    StateNotifierProvider.autoDispose<DeleteQuizUseCase, AsyncValue<void>?>(
        (ref) {
  throw UnimplementedError();
});
