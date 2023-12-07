// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoodDtoImpl _$$GoodDtoImplFromJson(Map<String, dynamic> json) =>
    _$GoodDtoImpl(
      userId: json['uid'] as String,
      createdAt: _$JsonConverterFromJson<Object, DateTime?>(
          json['created_at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$GoodDtoImplToJson(_$GoodDtoImpl instance) =>
    <String, dynamic>{
      'uid': instance.userId,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
