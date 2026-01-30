// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/post/domain/repositories/quiz_post_repository.dart';

final quizPostRepositoryProvider = Provider.autoDispose<QuizPostRepository>((ref) {
  throw UnimplementedError();
});
