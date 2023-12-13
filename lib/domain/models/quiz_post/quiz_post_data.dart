// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'quiz_post_data.freezed.dart';

@freezed
abstract class QuizPostData with _$QuizPostData {
  const factory QuizPostData({
    required String title,
    required String question,
    required List<String> choices,
    required int answer,
    @Default(null) XFile? imageFile,
  }) = _QuizPostData;
}
