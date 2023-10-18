// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoodDtoImpl _$$GoodDtoImplFromJson(Map<String, dynamic> json) =>
    _$GoodDtoImpl(
      quizId: json['quiz_id'] as String,
      userId: json['uid'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$GoodDtoImplToJson(_$GoodDtoImpl instance) =>
    <String, dynamic>{
      'quiz_id': instance.quizId,
      'uid': instance.userId,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
