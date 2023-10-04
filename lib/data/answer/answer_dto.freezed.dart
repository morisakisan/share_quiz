// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) {
  return _AnswerDto.fromJson(json);
}

/// @nodoc
mixin _$AnswerDto {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer')
  int get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerDtoCopyWith<AnswerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerDtoCopyWith<$Res> {
  factory $AnswerDtoCopyWith(AnswerDto value, $Res Function(AnswerDto) then) =
      _$AnswerDtoCopyWithImpl<$Res, AnswerDto>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      @JsonKey(name: 'answer') int answer,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class _$AnswerDtoCopyWithImpl<$Res, $Val extends AnswerDto>
    implements $AnswerDtoCopyWith<$Res> {
  _$AnswerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answer = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerDtoImplCopyWith<$Res>
    implements $AnswerDtoCopyWith<$Res> {
  factory _$$AnswerDtoImplCopyWith(
          _$AnswerDtoImpl value, $Res Function(_$AnswerDtoImpl) then) =
      __$$AnswerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? id,
      @JsonKey(name: 'answer') int answer,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class __$$AnswerDtoImplCopyWithImpl<$Res>
    extends _$AnswerDtoCopyWithImpl<$Res, _$AnswerDtoImpl>
    implements _$$AnswerDtoImplCopyWith<$Res> {
  __$$AnswerDtoImplCopyWithImpl(
      _$AnswerDtoImpl _value, $Res Function(_$AnswerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? answer = null,
    Object? userId = null,
  }) {
    return _then(_$AnswerDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerDtoImpl with DiagnosticableTreeMixin implements _AnswerDto {
  const _$AnswerDtoImpl(
      {@JsonKey(ignore: true) this.id,
      @JsonKey(name: 'answer') required this.answer,
      @JsonKey(name: 'user_id') required this.userId});

  factory _$AnswerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerDtoImplFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  @JsonKey(name: 'answer')
  final int answer;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerDto(id: $id, answer: $answer, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('answer', answer))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, answer, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerDtoImplCopyWith<_$AnswerDtoImpl> get copyWith =>
      __$$AnswerDtoImplCopyWithImpl<_$AnswerDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerDtoImplToJson(
      this,
    );
  }
}

abstract class _AnswerDto implements AnswerDto {
  const factory _AnswerDto(
          {@JsonKey(ignore: true) final String? id,
          @JsonKey(name: 'answer') required final int answer,
          @JsonKey(name: 'user_id') required final String userId}) =
      _$AnswerDtoImpl;

  factory _AnswerDto.fromJson(Map<String, dynamic> json) =
      _$AnswerDtoImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  @JsonKey(name: 'answer')
  int get answer;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$AnswerDtoImplCopyWith<_$AnswerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
