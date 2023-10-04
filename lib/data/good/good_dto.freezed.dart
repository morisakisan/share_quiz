// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'good_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoodDto _$GoodDtoFromJson(Map<String, dynamic> json) {
  return _GoodDto.fromJson(json);
}

/// @nodoc
mixin _$GoodDto {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quiz_id')
  String get quizId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoodDtoCopyWith<GoodDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoodDtoCopyWith<$Res> {
  factory $GoodDtoCopyWith(GoodDto value, $Res Function(GoodDto) then) =
      _$GoodDtoCopyWithImpl<$Res, GoodDto>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'quiz_id') String quizId,
      @JsonKey(name: 'user_id') String userId,
      @TimestampConverter() @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$GoodDtoCopyWithImpl<$Res, $Val extends GoodDto>
    implements $GoodDtoCopyWith<$Res> {
  _$GoodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quizId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoodDtoImplCopyWith<$Res> implements $GoodDtoCopyWith<$Res> {
  factory _$$GoodDtoImplCopyWith(
          _$GoodDtoImpl value, $Res Function(_$GoodDtoImpl) then) =
      __$$GoodDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: 'quiz_id') String quizId,
      @JsonKey(name: 'user_id') String userId,
      @TimestampConverter() @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$GoodDtoImplCopyWithImpl<$Res>
    extends _$GoodDtoCopyWithImpl<$Res, _$GoodDtoImpl>
    implements _$$GoodDtoImplCopyWith<$Res> {
  __$$GoodDtoImplCopyWithImpl(
      _$GoodDtoImpl _value, $Res Function(_$GoodDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quizId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$GoodDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: null == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoodDtoImpl with DiagnosticableTreeMixin implements _GoodDto {
  const _$GoodDtoImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      @JsonKey(name: 'quiz_id') required this.quizId,
      @JsonKey(name: 'user_id') required this.userId,
      @TimestampConverter()
      @JsonKey(name: 'created_at')
      required this.createdAt});

  factory _$GoodDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoodDtoImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'quiz_id')
  final String quizId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoodDto(id: $id, quizId: $quizId, userId: $userId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoodDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('quizId', quizId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoodDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quizId, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoodDtoImplCopyWith<_$GoodDtoImpl> get copyWith =>
      __$$GoodDtoImplCopyWithImpl<_$GoodDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoodDtoImplToJson(
      this,
    );
  }
}

abstract class _GoodDto implements GoodDto {
  const factory _GoodDto(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      @JsonKey(name: 'quiz_id') required final String quizId,
      @JsonKey(name: 'user_id') required final String userId,
      @TimestampConverter()
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$GoodDtoImpl;

  factory _GoodDto.fromJson(Map<String, dynamic> json) = _$GoodDtoImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'quiz_id')
  String get quizId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$GoodDtoImplCopyWith<_$GoodDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
