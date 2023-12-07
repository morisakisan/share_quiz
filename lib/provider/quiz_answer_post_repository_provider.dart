// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/repository/quiz_answer_post_repository.dart';

final quizAnswerPostRepositoryProvider =
    Provider.autoDispose<QuizAnswerPostRepository>((ref) {
  throw UnimplementedError();
});
