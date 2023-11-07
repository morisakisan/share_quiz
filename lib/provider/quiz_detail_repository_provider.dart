// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/repository/quiz_detail_repository.dart';

final quizDetailRepositoryProvider =
    Provider.autoDispose<QuizDetailRepository>((ref) {
  throw UnimplementedError();
});
