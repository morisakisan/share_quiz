// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/quiz_detail/domain/models/quiz_detail.dart';

final quizDetailProvider =
    StreamProvider.autoDispose.family<QuizDetail, String>((ref, quizId) {
  throw UnimplementedError();
});
