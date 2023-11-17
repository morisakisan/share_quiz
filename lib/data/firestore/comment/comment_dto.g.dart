// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDtoImpl _$$CommentDtoImplFromJson(Map<String, dynamic> json) =>
    _$CommentDtoImpl(
      content: json['content'] as String,
      userId: json['uid'] as String,
      createdAt: _$JsonConverterFromJson<Object, DateTime?>(
          json['created_at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$CommentDtoImplToJson(_$CommentDtoImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'uid': instance.userId,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
