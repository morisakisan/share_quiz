// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/profile/domain/repositories/user_quizzes_repository.dart';

final userQuizzesRepositoryProvider = Provider.autoDispose<UserQuizzesRepository>((ref) {
  throw UnimplementedError();
});
