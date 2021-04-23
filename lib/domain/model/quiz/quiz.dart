import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'quiz.freezed.dart';

@freezed
abstract class Quiz with _$Quiz {
  const factory Quiz({
    required int id,
    required String title,
    required String question,
    required List<String> choices,
    required int answer,
    required bool isLoading,
  }) = _Quiz;
}