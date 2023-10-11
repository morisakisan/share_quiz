// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizDetail {
  Quiz get quiz => throw _privateConstructorUsedError;
  int? get select_anser => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizDetailCopyWith<QuizDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDetailCopyWith<$Res> {
  factory $QuizDetailCopyWith(
          QuizDetail value, $Res Function(QuizDetail) then) =
      _$QuizDetailCopyWithImpl<$Res, QuizDetail>;
  @useResult
  $Res call({Quiz quiz, int? select_anser, bool isLogin});

  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class _$QuizDetailCopyWithImpl<$Res, $Val extends QuizDetail>
    implements $QuizDetailCopyWith<$Res> {
  _$QuizDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = null,
    Object? select_anser = freezed,
    Object? isLogin = null,
  }) {
    return _then(_value.copyWith(
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      select_anser: freezed == select_anser
          ? _value.select_anser
          : select_anser // ignore: cast_nullable_to_non_nullable
              as int?,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res> get quiz {
    return $QuizCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizDetailImplCopyWith<$Res>
    implements $QuizDetailCopyWith<$Res> {
  factory _$$QuizDetailImplCopyWith(
          _$QuizDetailImpl value, $Res Function(_$QuizDetailImpl) then) =
      __$$QuizDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Quiz quiz, int? select_anser, bool isLogin});

  @override
  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class __$$QuizDetailImplCopyWithImpl<$Res>
    extends _$QuizDetailCopyWithImpl<$Res, _$QuizDetailImpl>
    implements _$$QuizDetailImplCopyWith<$Res> {
  __$$QuizDetailImplCopyWithImpl(
      _$QuizDetailImpl _value, $Res Function(_$QuizDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = null,
    Object? select_anser = freezed,
    Object? isLogin = null,
  }) {
    return _then(_$QuizDetailImpl(
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      select_anser: freezed == select_anser
          ? _value.select_anser
          : select_anser // ignore: cast_nullable_to_non_nullable
              as int?,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QuizDetailImpl with DiagnosticableTreeMixin implements _QuizDetail {
  const _$QuizDetailImpl(
      {required this.quiz, required this.select_anser, required this.isLogin});

  @override
  final Quiz quiz;
  @override
  final int? select_anser;
  @override
  final bool isLogin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizDetail(quiz: $quiz, select_anser: $select_anser, isLogin: $isLogin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizDetail'))
      ..add(DiagnosticsProperty('quiz', quiz))
      ..add(DiagnosticsProperty('select_anser', select_anser))
      ..add(DiagnosticsProperty('isLogin', isLogin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizDetailImpl &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            (identical(other.select_anser, select_anser) ||
                other.select_anser == select_anser) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quiz, select_anser, isLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizDetailImplCopyWith<_$QuizDetailImpl> get copyWith =>
      __$$QuizDetailImplCopyWithImpl<_$QuizDetailImpl>(this, _$identity);
}

abstract class _QuizDetail implements QuizDetail {
  const factory _QuizDetail(
      {required final Quiz quiz,
      required final int? select_anser,
      required final bool isLogin}) = _$QuizDetailImpl;

  @override
  Quiz get quiz;
  @override
  int? get select_anser;
  @override
  bool get isLogin;
  @override
  @JsonKey(ignore: true)
  _$$QuizDetailImplCopyWith<_$QuizDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
