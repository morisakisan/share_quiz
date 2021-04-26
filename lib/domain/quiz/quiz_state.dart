import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:share_quiz/domain/quiz/quiz.dart';

part 'quiz_state.freezed.dart';

@freezed
abstract class QuizState with _$QuizState {
  factory QuizState(List<Quiz> quiz) = Success;
  factory QuizState.loading() = Loading;
  factory QuizState.error(Exception error) = Error;
}