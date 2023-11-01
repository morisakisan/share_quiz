// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoodDtoImpl _$$GoodDtoImplFromJson(Map<String, dynamic> json) =>
    _$GoodDtoImpl(
      userId: json['uid'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$GoodDtoImplToJson(_$GoodDtoImpl instance) =>
    <String, dynamic>{
      'uid': instance.userId,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
