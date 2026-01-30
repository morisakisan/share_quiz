// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/home/domain/repositories/quiz_list_repository.dart';

final quizListRepositoryProvider = Provider.autoDispose<QuizListRepository>((ref) {
  throw UnimplementedError();
});
