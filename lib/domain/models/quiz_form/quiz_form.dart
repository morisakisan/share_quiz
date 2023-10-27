// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_form.freezed.dart';

@freezed
abstract class QuizForm with _$QuizForm {
  const factory QuizForm({
    String? title,
    String? question,
    File? image,
    List<String>? choices,
    int? answer,
  }) = _QuizForm;
}
