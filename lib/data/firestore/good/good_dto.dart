// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:share_quiz/data/json_converter/timestamp_converter.dart';

part 'good_dto.freezed.dart';
part 'good_dto.g.dart';

@freezed
abstract class GoodDto with _$GoodDto {
  const factory GoodDto({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: 'uid') required String userId,
    @TimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
  }) = _GoodDto;

  factory GoodDto.fromJson(Map<String, dynamic> json) =>
      _$GoodDtoFromJson(json);
}
