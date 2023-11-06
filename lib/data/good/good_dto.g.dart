// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoodDtoImpl _$$GoodDtoImplFromJson(Map<String, dynamic> json) =>
    _$GoodDtoImpl(
      userId: json['uid'] as String,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['created_at'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$GoodDtoImplToJson(_$GoodDtoImpl instance) =>
    <String, dynamic>{
      'uid': instance.userId,
      'created_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
