// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../json_converter/timestamp_converter.dart';

part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

@freezed
abstract class CommentDto with _$CommentDto {
  const factory CommentDto({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: 'quiz_id') required String quizId,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'uid') required String userId,
    @TimestampConverter()
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
  }) = _CommentDto;

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}
