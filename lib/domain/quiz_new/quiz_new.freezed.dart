// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz_new.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizNewTearOff {
  const _$QuizNewTearOff();

  _QuizNew call({required Stream<List<Quiz>> quizzes}) {
    return _QuizNew(
      quizzes: quizzes,
    );
  }
}

/// @nodoc
const $QuizNew = _$QuizNewTearOff();

/// @nodoc
mixin _$QuizNew {
  Stream<List<Quiz>> get quizzes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizNewCopyWith<QuizNew> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizNewCopyWith<$Res> {
  factory $QuizNewCopyWith(QuizNew value, $Res Function(QuizNew) then) =
      _$QuizNewCopyWithImpl<$Res>;
  $Res call({Stream<List<Quiz>> quizzes});
}

/// @nodoc
class _$QuizNewCopyWithImpl<$Res> implements $QuizNewCopyWith<$Res> {
  _$QuizNewCopyWithImpl(this._value, this._then);

  final QuizNew _value;
  // ignore: unused_field
  final $Res Function(QuizNew) _then;

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
abstract class _$QuizNewCopyWith<$Res> implements $QuizNewCopyWith<$Res> {
  factory _$QuizNewCopyWith(_QuizNew value, $Res Function(_QuizNew) then) =
      __$QuizNewCopyWithImpl<$Res>;
  @override
  $Res call({Stream<List<Quiz>> quizzes});
}

/// @nodoc
class __$QuizNewCopyWithImpl<$Res> extends _$QuizNewCopyWithImpl<$Res>
    implements _$QuizNewCopyWith<$Res> {
  __$QuizNewCopyWithImpl(_QuizNew _value, $Res Function(_QuizNew) _then)
      : super(_value, (v) => _then(v as _QuizNew));

  @override
  _QuizNew get _value => super._value as _QuizNew;

  @override
  $Res call({
    Object? quizzes = freezed,
  }) {
    return _then(_QuizNew(
      quizzes: quizzes == freezed
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as Stream<List<Quiz>>,
    ));
  }
}

/// @nodoc

class _$_QuizNew with DiagnosticableTreeMixin implements _QuizNew {
  const _$_QuizNew({required this.quizzes});

  @override
  final Stream<List<Quiz>> quizzes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizNew(quizzes: $quizzes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizNew'))
      ..add(DiagnosticsProperty('quizzes', quizzes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuizNew &&
            (identical(other.quizzes, quizzes) ||
                const DeepCollectionEquality().equals(other.quizzes, quizzes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(quizzes);

  @JsonKey(ignore: true)
  @override
  _$QuizNewCopyWith<_QuizNew> get copyWith =>
      __$QuizNewCopyWithImpl<_QuizNew>(this, _$identity);
}

abstract class _QuizNew implements QuizNew {
  const factory _QuizNew({required Stream<List<Quiz>> quizzes}) = _$_QuizNew;

  @override
  Stream<List<Quiz>> get quizzes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizNewCopyWith<_QuizNew> get copyWith =>
      throw _privateConstructorUsedError;
}
