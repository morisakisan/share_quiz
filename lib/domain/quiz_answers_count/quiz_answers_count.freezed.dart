// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz_answers_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizAnswersCountTearOff {
  const _$QuizAnswersCountTearOff();

  _QuizAnswersCount call({required Stream<List<Quiz>> quizzes}) {
    return _QuizAnswersCount(
      quizzes: quizzes,
    );
  }
}

/// @nodoc
const $QuizAnswersCount = _$QuizAnswersCountTearOff();

/// @nodoc
mixin _$QuizAnswersCount {
  Stream<List<Quiz>> get quizzes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizAnswersCountCopyWith<QuizAnswersCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswersCountCopyWith<$Res> {
  factory $QuizAnswersCountCopyWith(
          QuizAnswersCount value, $Res Function(QuizAnswersCount) then) =
      _$QuizAnswersCountCopyWithImpl<$Res>;
  $Res call({Stream<List<Quiz>> quizzes});
}

/// @nodoc
class _$QuizAnswersCountCopyWithImpl<$Res>
    implements $QuizAnswersCountCopyWith<$Res> {
  _$QuizAnswersCountCopyWithImpl(this._value, this._then);

  final QuizAnswersCount _value;
  // ignore: unused_field
  final $Res Function(QuizAnswersCount) _then;

  @override
  $Res call({
    Object? quizzes = freezed,
  }) {
    return _then(_value.copyWith(
      quizzes: quizzes == freezed
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as Stream<List<Quiz>>,
    ));
  }
}

/// @nodoc
abstract class _$QuizAnswersCountCopyWith<$Res>
    implements $QuizAnswersCountCopyWith<$Res> {
  factory _$QuizAnswersCountCopyWith(
          _QuizAnswersCount value, $Res Function(_QuizAnswersCount) then) =
      __$QuizAnswersCountCopyWithImpl<$Res>;
  @override
  $Res call({Stream<List<Quiz>> quizzes});
}

/// @nodoc
class __$QuizAnswersCountCopyWithImpl<$Res>
    extends _$QuizAnswersCountCopyWithImpl<$Res>
    implements _$QuizAnswersCountCopyWith<$Res> {
  __$QuizAnswersCountCopyWithImpl(
      _QuizAnswersCount _value, $Res Function(_QuizAnswersCount) _then)
      : super(_value, (v) => _then(v as _QuizAnswersCount));

  @override
  _QuizAnswersCount get _value => super._value as _QuizAnswersCount;

  @override
  $Res call({
    Object? quizzes = freezed,
  }) {
    return _then(_QuizAnswersCount(
      quizzes: quizzes == freezed
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as Stream<List<Quiz>>,
    ));
  }
}

/// @nodoc

class _$_QuizAnswersCount
    with DiagnosticableTreeMixin
    implements _QuizAnswersCount {
  const _$_QuizAnswersCount({required this.quizzes});

  @override
  final Stream<List<Quiz>> quizzes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizAnswersCount(quizzes: $quizzes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizAnswersCount'))
      ..add(DiagnosticsProperty('quizzes', quizzes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuizAnswersCount &&
            (identical(other.quizzes, quizzes) ||
                const DeepCollectionEquality().equals(other.quizzes, quizzes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(quizzes);

  @JsonKey(ignore: true)
  @override
  _$QuizAnswersCountCopyWith<_QuizAnswersCount> get copyWith =>
      __$QuizAnswersCountCopyWithImpl<_QuizAnswersCount>(this, _$identity);
}

abstract class _QuizAnswersCount implements QuizAnswersCount {
  const factory _QuizAnswersCount({required Stream<List<Quiz>> quizzes}) =
      _$_QuizAnswersCount;

  @override
  Stream<List<Quiz>> get quizzes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizAnswersCountCopyWith<_QuizAnswersCount> get copyWith =>
      throw _privateConstructorUsedError;
}
