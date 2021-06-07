// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizListTearOff {
  const _$QuizListTearOff();

  _QuizList call({required Stream<List<Quiz>> quizzes}) {
    return _QuizList(
      quizzes: quizzes,
    );
  }
}

/// @nodoc
const $QuizList = _$QuizListTearOff();

/// @nodoc
mixin _$QuizList {
  Stream<List<Quiz>> get quizzes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizListCopyWith<QuizList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizListCopyWith<$Res> {
  factory $QuizListCopyWith(QuizList value, $Res Function(QuizList) then) =
      _$QuizListCopyWithImpl<$Res>;
  $Res call({Stream<List<Quiz>> quizzes});
}

/// @nodoc
class _$QuizListCopyWithImpl<$Res> implements $QuizListCopyWith<$Res> {
  _$QuizListCopyWithImpl(this._value, this._then);

  final QuizList _value;
  // ignore: unused_field
  final $Res Function(QuizList) _then;

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
abstract class _$QuizListCopyWith<$Res> implements $QuizListCopyWith<$Res> {
  factory _$QuizListCopyWith(_QuizList value, $Res Function(_QuizList) then) =
      __$QuizListCopyWithImpl<$Res>;
  @override
  $Res call({Stream<List<Quiz>> quizzes});
}

/// @nodoc
class __$QuizListCopyWithImpl<$Res> extends _$QuizListCopyWithImpl<$Res>
    implements _$QuizListCopyWith<$Res> {
  __$QuizListCopyWithImpl(_QuizList _value, $Res Function(_QuizList) _then)
      : super(_value, (v) => _then(v as _QuizList));

  @override
  _QuizList get _value => super._value as _QuizList;

  @override
  $Res call({
    Object? quizzes = freezed,
  }) {
    return _then(_QuizList(
      quizzes: quizzes == freezed
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as Stream<List<Quiz>>,
    ));
  }
}

/// @nodoc

class _$_QuizList with DiagnosticableTreeMixin implements _QuizList {
  const _$_QuizList({required this.quizzes});

  @override
  final Stream<List<Quiz>> quizzes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizList(quizzes: $quizzes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizList'))
      ..add(DiagnosticsProperty('quizzes', quizzes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuizList &&
            (identical(other.quizzes, quizzes) ||
                const DeepCollectionEquality().equals(other.quizzes, quizzes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(quizzes);

  @JsonKey(ignore: true)
  @override
  _$QuizListCopyWith<_QuizList> get copyWith =>
      __$QuizListCopyWithImpl<_QuizList>(this, _$identity);
}

abstract class _QuizList implements QuizList {
  const factory _QuizList({required Stream<List<Quiz>> quizzes}) = _$_QuizList;

  @override
  Stream<List<Quiz>> get quizzes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizListCopyWith<_QuizList> get copyWith =>
      throw _privateConstructorUsedError;
}
