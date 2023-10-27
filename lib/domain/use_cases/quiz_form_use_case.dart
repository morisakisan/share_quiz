// Package imports:
import 'dart:io';

import 'package:state_notifier/state_notifier.dart';

// Project imports:
import '../models/quiz_form/quiz_form.dart';

class QuizFromUseCase extends StateNotifier<QuizForm> {

  QuizFromUseCase() : super(QuizForm());

  Future<void> addTitle(String? newTitle) async {
    state = state.copyWith(title: newTitle);
  }

  Future<void> addQuestion(String? newQuestion) async {
    state = state.copyWith(question: newQuestion);
  }

  Future<void> addImage(File? newImage) async {
    state = state.copyWith(image: newImage);
  }

  Future<void> addChoices(List<String> newChoices) async {
    state = state.copyWith(choices: newChoices);
  }

  Future<void> addAnswer(int newAnswer) async {
    state = state.copyWith(answer: newAnswer);
  }
}
