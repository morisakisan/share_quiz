// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$_$_UserDtoFromJson(Map<String, dynamic> json) {
  return _$_UserDto(
    uid: json['uid'] as String,
    name: json['name'] as String,
    photoUrl: json['photo_url'] as String,
  );
}

Map<String, dynamic> _$_$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'photo_url': instance.photoUrl,
    };
