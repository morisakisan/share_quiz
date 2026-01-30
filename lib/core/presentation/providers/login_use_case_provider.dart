// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/application/use_cases/login_use_case.dart';

final loginUseCaseProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, AsyncValue<void>>((ref) {
  throw UnimplementedError();
});
