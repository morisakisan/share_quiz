// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerDtoImpl _$$AnswerDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnswerDtoImpl(
      answer: json['answer'] as int,
      userId: json['uid'] as String,
      isCorrect: json['is_correct'] as bool,
      createdAt: _$JsonConverterFromJson<Object, DateTime?>(
          json['created_at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$AnswerDtoImplToJson(_$AnswerDtoImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'uid': instance.userId,
      'is_correct': instance.isCorrect,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
