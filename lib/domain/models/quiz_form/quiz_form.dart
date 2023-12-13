// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'quiz_form.freezed.dart';

@freezed
abstract class QuizForm with _$QuizForm {
  const factory QuizForm({
    String? title,
    String? question,
    XFile? image,
    List<String>? choices,
    int? answer,
  }) = _QuizForm;
}
