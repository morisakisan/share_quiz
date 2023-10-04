// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
