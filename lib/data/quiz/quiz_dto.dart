// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_quiz/data/json_converter/timestamp_converter.dart';

part 'quiz_dto.freezed.dart';

part 'quiz_dto.g.dart';

@freezed
abstract class QuizDto with _$QuizDto {
  const factory QuizDto({
    @JsonKey(ignore: true) String? docId,
    @JsonKey(name: 'correct_answer') required int correctAnswer,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'image_url') required String? imageUrl,
    @JsonKey(name: 'choices') required List<String> choices,
    @TimestampConverter()
    @JsonKey(name: 'created_at')
        required DateTime createdAt,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'correct_answer_rate') required double? car,
    @JsonKey(name: 'answer_count') required int answerCount,
  }) = _QuizDto;

  factory QuizDto.fromJson(Map<String, dynamic> json) =>
      _$QuizDtoFromJson(json);
}
