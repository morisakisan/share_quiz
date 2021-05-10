import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'quiz_post_state.freezed.dart';

@freezed
abstract class QuizPostState with _$QuizPostState {
  factory QuizPostState() = Success;
  factory QuizPostState.loading() = Loading;
  factory QuizPostState.error(Exception error) = Error;
}