// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/repository/quiz_list_repository.dart';

final quizListRepositoryProvider = Provider.autoDispose<QuizListRepository>((ref) {
  throw UnimplementedError();
});
