import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'quiz.freezed.dart';

@freezed
abstract class Quiz with _$Quiz {
  const factory Quiz({
    required String quizId,
    required String title,
    required String question,
    required List<String> choices,
    required int answer,
    required Timestamp createdAt,
    @Default(null) String? imageUrl,
  }) = _Quiz;
}