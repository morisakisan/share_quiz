// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_quiz_interaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserQuizInteraction {
  bool get isLogin => throw _privateConstructorUsedError;
  int? get selectAnswer => throw _privateConstructorUsedError;
  bool get hasGood => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserQuizInteractionCopyWith<UserQuizInteraction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserQuizInteractionCopyWith<$Res> {
  factory $UserQuizInteractionCopyWith(
          UserQuizInteraction value, $Res Function(UserQuizInteraction) then) =
      _$UserQuizInteractionCopyWithImpl<$Res, UserQuizInteraction>;
  @useResult
  $Res call({bool isLogin, int? selectAnswer, bool hasGood});
}

/// @nodoc
class _$UserQuizInteractionCopyWithImpl<$Res, $Val extends UserQuizInteraction>
    implements $UserQuizInteractionCopyWith<$Res> {
  _$UserQuizInteractionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
    Object? selectAnswer = freezed,
    Object? hasGood = null,
  }) {
    return _then(_value.copyWith(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      selectAnswer: freezed == selectAnswer
          ? _value.selectAnswer
          : selectAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      hasGood: null == hasGood
          ? _value.hasGood
          : hasGood // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserQuizInteractionImplCopyWith<$Res>
    implements $UserQuizInteractionCopyWith<$Res> {
  factory _$$UserQuizInteractionImplCopyWith(_$UserQuizInteractionImpl value,
          $Res Function(_$UserQuizInteractionImpl) then) =
      __$$UserQuizInteractionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLogin, int? selectAnswer, bool hasGood});
}

/// @nodoc
class __$$UserQuizInteractionImplCopyWithImpl<$Res>
    extends _$UserQuizInteractionCopyWithImpl<$Res, _$UserQuizInteractionImpl>
    implements _$$UserQuizInteractionImplCopyWith<$Res> {
  __$$UserQuizInteractionImplCopyWithImpl(_$UserQuizInteractionImpl _value,
      $Res Function(_$UserQuizInteractionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogin = null,
    Object? selectAnswer = freezed,
    Object? hasGood = null,
  }) {
    return _then(_$UserQuizInteractionImpl(
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      selectAnswer: freezed == selectAnswer
          ? _value.selectAnswer
          : selectAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      hasGood: null == hasGood
          ? _value.hasGood
          : hasGood // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserQuizInteractionImpl
    with DiagnosticableTreeMixin
    implements _UserQuizInteraction {
  const _$UserQuizInteractionImpl(
      {required this.isLogin,
      required this.selectAnswer,
      required this.hasGood});

  @override
  final bool isLogin;
  @override
  final int? selectAnswer;
  @override
  final bool hasGood;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserQuizInteraction(isLogin: $isLogin, selectAnswer: $selectAnswer, hasGood: $hasGood)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserQuizInteraction'))
      ..add(DiagnosticsProperty('isLogin', isLogin))
      ..add(DiagnosticsProperty('selectAnswer', selectAnswer))
      ..add(DiagnosticsProperty('hasGood', hasGood));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserQuizInteractionImpl &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.selectAnswer, selectAnswer) ||
                other.selectAnswer == selectAnswer) &&
            (identical(other.hasGood, hasGood) || other.hasGood == hasGood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLogin, selectAnswer, hasGood);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserQuizInteractionImplCopyWith<_$UserQuizInteractionImpl> get copyWith =>
      __$$UserQuizInteractionImplCopyWithImpl<_$UserQuizInteractionImpl>(
          this, _$identity);
}

abstract class _UserQuizInteraction implements UserQuizInteraction {
  const factory _UserQuizInteraction(
      {required final bool isLogin,
      required final int? selectAnswer,
      required final bool hasGood}) = _$UserQuizInteractionImpl;

  @override
  bool get isLogin;
  @override
  int? get selectAnswer;
  @override
  bool get hasGood;
  @override
  @JsonKey(ignore: true)
  _$$UserQuizInteractionImplCopyWith<_$UserQuizInteractionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
