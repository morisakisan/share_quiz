// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

@freezed
abstract class Quiz with _$Quiz {
  const factory Quiz({
    required String documentId,
    required String title,
    required String question,
    required List<String> choices,
    required int correctAnswer,
    required DateTime createdAt,
    @Default(null) String? imageUrl,
  }) = _Quiz;
}
