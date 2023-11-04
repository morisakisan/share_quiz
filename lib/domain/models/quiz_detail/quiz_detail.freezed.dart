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
  UserQuizInteraction get userQuizInteraction =>
      throw _privateConstructorUsedError;

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
  $Res call({Quiz quiz, UserQuizInteraction userQuizInteraction});

  $QuizCopyWith<$Res> get quiz;
  $UserQuizInteractionCopyWith<$Res> get userQuizInteraction;
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
    Object? userQuizInteraction = null,
  }) {
    return _then(_value.copyWith(
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      userQuizInteraction: null == userQuizInteraction
          ? _value.userQuizInteraction
          : userQuizInteraction // ignore: cast_nullable_to_non_nullable
              as UserQuizInteraction,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res> get quiz {
    return $QuizCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserQuizInteractionCopyWith<$Res> get userQuizInteraction {
    return $UserQuizInteractionCopyWith<$Res>(_value.userQuizInteraction,
        (value) {
      return _then(_value.copyWith(userQuizInteraction: value) as $Val);
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
  $Res call({Quiz quiz, UserQuizInteraction userQuizInteraction});

  @override
  $QuizCopyWith<$Res> get quiz;
  @override
  $UserQuizInteractionCopyWith<$Res> get userQuizInteraction;
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
    Object? userQuizInteraction = null,
  }) {
    return _then(_$QuizDetailImpl(
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      userQuizInteraction: null == userQuizInteraction
          ? _value.userQuizInteraction
          : userQuizInteraction // ignore: cast_nullable_to_non_nullable
              as UserQuizInteraction,
    ));
  }
}

/// @nodoc

class _$QuizDetailImpl with DiagnosticableTreeMixin implements _QuizDetail {
  const _$QuizDetailImpl(
      {required this.quiz, required this.userQuizInteraction});

  @override
  final Quiz quiz;
  @override
  final UserQuizInteraction userQuizInteraction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizDetail(quiz: $quiz, userQuizInteraction: $userQuizInteraction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizDetail'))
      ..add(DiagnosticsProperty('quiz', quiz))
      ..add(DiagnosticsProperty('userQuizInteraction', userQuizInteraction));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizDetailImpl &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            (identical(other.userQuizInteraction, userQuizInteraction) ||
                other.userQuizInteraction == userQuizInteraction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quiz, userQuizInteraction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizDetailImplCopyWith<_$QuizDetailImpl> get copyWith =>
      __$$QuizDetailImplCopyWithImpl<_$QuizDetailImpl>(this, _$identity);
}

abstract class _QuizDetail implements QuizDetail {
  const factory _QuizDetail(
          {required final Quiz quiz,
          required final UserQuizInteraction userQuizInteraction}) =
      _$QuizDetailImpl;

  @override
  Quiz get quiz;
  @override
  UserQuizInteraction get userQuizInteraction;
  @override
  @JsonKey(ignore: true)
  _$$QuizDetailImplCopyWith<_$QuizDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
