// Dart imports:
import 'dart:io';

// Package imports:
import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../models/quiz_form/quiz_form.dart';

class QuizFormUseCase extends StateNotifier<QuizForm> {
  QuizFormUseCase() : super(const QuizForm());

  addTitle(String? newTitle) {
    state = state.copyWith(title: newTitle);
  }

  addQuestion(String? newQuestion) {
    state = state.copyWith(question: newQuestion);
  }

  addImage(File? newImage) {
    state = state.copyWith(image: newImage);
  }

  addChoices(List<String> newChoices) {
    state = state.copyWith(choices: newChoices);
  }

  addAnswer(int newAnswer) {
    state = state.copyWith(answer: newAnswer);
  }
}
