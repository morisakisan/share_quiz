// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  throw UnimplementedError();
});
