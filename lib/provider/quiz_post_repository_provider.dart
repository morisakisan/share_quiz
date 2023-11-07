import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/repository/quiz_post_repository.dart';

final quizPostRepositoryProvider =
    Provider.autoDispose<QuizPostRepository>((ref) {
  throw UnimplementedError();
});
