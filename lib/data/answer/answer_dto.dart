// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_dto.freezed.dart';
part 'answer_dto.g.dart';

@freezed
abstract class AnswerDto with _$AnswerDto {
  const factory AnswerDto({
    @JsonKey(ignore: true) String? id,
    @JsonKey(name: 'answer') required int answer,
    @JsonKey(name: 'user_id') required String userId,
  }) = _AnswerDto;

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);
}
