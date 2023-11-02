// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../json_converter/timestamp_converter.dart';

part 'answer_dto.freezed.dart';
part 'answer_dto.g.dart';

@freezed
abstract class AnswerDto with _$AnswerDto {
  const factory AnswerDto({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: 'answer') required int answer,
    @JsonKey(name: 'uid') required String userId,
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @TimestampConverter()
    @JsonKey(name: 'created_at')
    required DateTime? createdAt,
  }) = _AnswerDto;

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);
}
