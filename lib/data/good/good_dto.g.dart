// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoodDtoImpl _$$GoodDtoImplFromJson(Map<String, dynamic> json) =>
    _$GoodDtoImpl(
      quizId: json['quiz_id'] as String,
      userId: json['user_id'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$GoodDtoImplToJson(_$GoodDtoImpl instance) =>
    <String, dynamic>{
      'quiz_id': instance.quizId,
      'user_id': instance.userId,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
