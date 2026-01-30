// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/features/post/domain/models/quiz_form.dart';
import 'package:share_quiz/features/post/application/use_cases/quiz_form_use_case.dart';

final quizFormUseCaseProvider =
    StateNotifierProvider.autoDispose<QuizFormUseCase, QuizForm>((ref) {
  throw UnimplementedError();
});
