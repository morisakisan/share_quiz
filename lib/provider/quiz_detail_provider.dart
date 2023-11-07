import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/models/quiz_detail/quiz_detail.dart';

final quizDetailProvider =
    StreamProvider.autoDispose.family<QuizDetail, String>((ref, quizId) {
  throw UnimplementedError();
});
