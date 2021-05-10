import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'quiz_post_data.freezed.dart';

@freezed
abstract class QuizPostData with _$QuizPostData {
  const factory QuizPostData({
    required String title,
    required String question,
    required List<String> choices,
    required int answer,
    @Default(null) File? imageFile,
  }) = _QuizPostData;
}
