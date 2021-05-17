import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

part 'quiz_new_state.freezed.dart';

@freezed
abstract class QuizNewState with _$QuizNewState {
  factory QuizNewState(List<Quiz> quiz) = Success;
  factory QuizNewState.loading() = Loading;
  factory QuizNewState.error(Exception error) = Error;
}