// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../domain/models/quiz_form/quiz_form.dart';
import '../domain/use_cases/quiz_form_use_case.dart';

final quizFormUseCaseProvider =
    StateNotifierProvider.autoDispose<QuizFormUseCase, QuizForm>((ref) {
  throw UnimplementedError();
});
