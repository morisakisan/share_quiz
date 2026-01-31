// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/core/domain/repositories/user_repository.dart';

final currentUserRepositoryProvider = Provider.autoDispose<UserRepository>((ref) {
  throw UnimplementedError();
});
