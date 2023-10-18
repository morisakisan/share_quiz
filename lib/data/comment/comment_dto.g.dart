// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDtoImpl _$$CommentDtoImplFromJson(Map<String, dynamic> json) =>
    _$CommentDtoImpl(
      quizId: json['quiz_id'] as String,
      content: json['content'] as String,
      userId: json['uid'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$CommentDtoImplToJson(_$CommentDtoImpl instance) =>
    <String, dynamic>{
      'quiz_id': instance.quizId,
      'content': instance.content,
      'uid': instance.userId,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
