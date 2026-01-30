// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'good_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoodDto implements DiagnosticableTreeMixin {

@JsonKey(includeFromJson: false, includeToJson: false) String? get id;@JsonKey(name: 'uid') String get userId;@TimestampConverter()@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of GoodDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoodDtoCopyWith<GoodDto> get copyWith => _$GoodDtoCopyWithImpl<GoodDto>(this as GoodDto, _$identity);

  /// Serializes this GoodDto to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GoodDto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoodDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GoodDto(id: $id, userId: $userId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $GoodDtoCopyWith<$Res>  {
  factory $GoodDtoCopyWith(GoodDto value, $Res Function(GoodDto) _then) = _$GoodDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) String? id,@JsonKey(name: 'uid') String userId,@TimestampConverter()@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$GoodDtoCopyWithImpl<$Res>
    implements $GoodDtoCopyWith<$Res> {
  _$GoodDtoCopyWithImpl(this._self, this._then);

  final GoodDto _self;
  final $Res Function(GoodDto) _then;

/// Create a copy of GoodDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoodDto].
extension GoodDtoPatterns on GoodDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoodDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoodDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoodDto value)  $default,){
final _that = this;
switch (_that) {
case _GoodDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoodDto value)?  $default,){
final _that = this;
switch (_that) {
case _GoodDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  String? id, @JsonKey(name: 'uid')  String userId, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoodDto() when $default != null:
return $default(_that.id,_that.userId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  String? id, @JsonKey(name: 'uid')  String userId, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _GoodDto():
return $default(_that.id,_that.userId,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeFromJson: false, includeToJson: false)  String? id, @JsonKey(name: 'uid')  String userId, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _GoodDto() when $default != null:
return $default(_that.id,_that.userId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoodDto with DiagnosticableTreeMixin implements GoodDto {
  const _GoodDto({@JsonKey(includeFromJson: false, includeToJson: false) this.id, @JsonKey(name: 'uid') required this.userId, @TimestampConverter()@JsonKey(name: 'created_at') this.createdAt});
  factory _GoodDto.fromJson(Map<String, dynamic> json) => _$GoodDtoFromJson(json);

@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? id;
@override@JsonKey(name: 'uid') final  String userId;
@override@TimestampConverter()@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of GoodDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoodDtoCopyWith<_GoodDto> get copyWith => __$GoodDtoCopyWithImpl<_GoodDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoodDtoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GoodDto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoodDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GoodDto(id: $id, userId: $userId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$GoodDtoCopyWith<$Res> implements $GoodDtoCopyWith<$Res> {
  factory _$GoodDtoCopyWith(_GoodDto value, $Res Function(_GoodDto) _then) = __$GoodDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) String? id,@JsonKey(name: 'uid') String userId,@TimestampConverter()@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$GoodDtoCopyWithImpl<$Res>
    implements _$GoodDtoCopyWith<$Res> {
  __$GoodDtoCopyWithImpl(this._self, this._then);

  final _GoodDto _self;
  final $Res Function(_GoodDto) _then;

/// Create a copy of GoodDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? createdAt = freezed,}) {
  return _then(_GoodDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
