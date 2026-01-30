// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoodDto _$GoodDtoFromJson(Map<String, dynamic> json) => _GoodDto(
  userId: json['uid'] as String,
  createdAt: _$JsonConverterFromJson<Object, DateTime?>(
    json['created_at'],
    const TimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$GoodDtoToJson(_GoodDto instance) => <String, dynamic>{
  'uid': instance.userId,
  'created_at': const TimestampConverter().toJson(instance.createdAt),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);
