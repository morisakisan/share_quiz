// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnswerDto implements DiagnosticableTreeMixin {

@JsonKey(includeFromJson: false, includeToJson: false) String? get id;@JsonKey(name: 'answer') int get answer;@JsonKey(name: 'uid') String get userId;@JsonKey(name: 'is_correct') bool get isCorrect;@TimestampConverter()@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerDtoCopyWith<AnswerDto> get copyWith => _$AnswerDtoCopyWithImpl<AnswerDto>(this as AnswerDto, _$identity);

  /// Serializes this AnswerDto to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AnswerDto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('isCorrect', isCorrect))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,answer,userId,isCorrect,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AnswerDto(id: $id, answer: $answer, userId: $userId, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AnswerDtoCopyWith<$Res>  {
  factory $AnswerDtoCopyWith(AnswerDto value, $Res Function(AnswerDto) _then) = _$AnswerDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) String? id,@JsonKey(name: 'answer') int answer,@JsonKey(name: 'uid') String userId,@JsonKey(name: 'is_correct') bool isCorrect,@TimestampConverter()@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$AnswerDtoCopyWithImpl<$Res>
    implements $AnswerDtoCopyWith<$Res> {
  _$AnswerDtoCopyWithImpl(this._self, this._then);

  final AnswerDto _self;
  final $Res Function(AnswerDto) _then;

/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? answer = null,Object? userId = null,Object? isCorrect = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnswerDto].
extension AnswerDtoPatterns on AnswerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnswerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnswerDto value)  $default,){
final _that = this;
switch (_that) {
case _AnswerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnswerDto value)?  $default,){
final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  String? id, @JsonKey(name: 'answer')  int answer, @JsonKey(name: 'uid')  String userId, @JsonKey(name: 'is_correct')  bool isCorrect, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
return $default(_that.id,_that.answer,_that.userId,_that.isCorrect,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: false, includeToJson: false)  String? id, @JsonKey(name: 'answer')  int answer, @JsonKey(name: 'uid')  String userId, @JsonKey(name: 'is_correct')  bool isCorrect, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AnswerDto():
return $default(_that.id,_that.answer,_that.userId,_that.isCorrect,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeFromJson: false, includeToJson: false)  String? id, @JsonKey(name: 'answer')  int answer, @JsonKey(name: 'uid')  String userId, @JsonKey(name: 'is_correct')  bool isCorrect, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AnswerDto() when $default != null:
return $default(_that.id,_that.answer,_that.userId,_that.isCorrect,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnswerDto with DiagnosticableTreeMixin implements AnswerDto {
  const _AnswerDto({@JsonKey(includeFromJson: false, includeToJson: false) this.id, @JsonKey(name: 'answer') required this.answer, @JsonKey(name: 'uid') required this.userId, @JsonKey(name: 'is_correct') required this.isCorrect, @TimestampConverter()@JsonKey(name: 'created_at') required this.createdAt});
  factory _AnswerDto.fromJson(Map<String, dynamic> json) => _$AnswerDtoFromJson(json);

@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? id;
@override@JsonKey(name: 'answer') final  int answer;
@override@JsonKey(name: 'uid') final  String userId;
@override@JsonKey(name: 'is_correct') final  bool isCorrect;
@override@TimestampConverter()@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerDtoCopyWith<_AnswerDto> get copyWith => __$AnswerDtoCopyWithImpl<_AnswerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerDtoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AnswerDto'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('isCorrect', isCorrect))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,answer,userId,isCorrect,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AnswerDto(id: $id, answer: $answer, userId: $userId, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AnswerDtoCopyWith<$Res> implements $AnswerDtoCopyWith<$Res> {
  factory _$AnswerDtoCopyWith(_AnswerDto value, $Res Function(_AnswerDto) _then) = __$AnswerDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) String? id,@JsonKey(name: 'answer') int answer,@JsonKey(name: 'uid') String userId,@JsonKey(name: 'is_correct') bool isCorrect,@TimestampConverter()@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$AnswerDtoCopyWithImpl<$Res>
    implements _$AnswerDtoCopyWith<$Res> {
  __$AnswerDtoCopyWithImpl(this._self, this._then);

  final _AnswerDto _self;
  final $Res Function(_AnswerDto) _then;

/// Create a copy of AnswerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? answer = null,Object? userId = null,Object? isCorrect = null,Object? createdAt = freezed,}) {
  return _then(_AnswerDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
