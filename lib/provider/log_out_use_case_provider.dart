// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/use_cases/log_out_use_case.dart';

final logOutUseCaseProvider =
    StateNotifierProvider.autoDispose<LogOutUseCase, AsyncValue<void>>((ref) {
  throw UnimplementedError();
});
