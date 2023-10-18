// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../json_converter/timestamp_converter.dart';

part 'good_dto.freezed.dart';
part 'good_dto.g.dart';

@freezed
abstract class GoodDto with _$GoodDto {
  const factory GoodDto({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: 'quiz_id') required String quizId,
    @JsonKey(name: 'uid') required String userId,
    @TimestampConverter()
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
  }) = _GoodDto;

  factory GoodDto.fromJson(Map<String, dynamic> json) =>
      _$GoodDtoFromJson(json);
}
