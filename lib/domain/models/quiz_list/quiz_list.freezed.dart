// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizList {
  List<Quiz> get quizzes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizListCopyWith<QuizList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizListCopyWith<$Res> {
  factory $QuizListCopyWith(QuizList value, $Res Function(QuizList) then) =
      _$QuizListCopyWithImpl<$Res, QuizList>;
  @useResult
  $Res call({List<Quiz> quizzes});
}

/// @nodoc
class _$QuizListCopyWithImpl<$Res, $Val extends QuizList>
    implements $QuizListCopyWith<$Res> {
  _$QuizListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizzes = null,
  }) {
    return _then(_value.copyWith(
      quizzes: null == quizzes
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizListImplCopyWith<$Res>
    implements $QuizListCopyWith<$Res> {
  factory _$$QuizListImplCopyWith(
          _$QuizListImpl value, $Res Function(_$QuizListImpl) then) =
      __$$QuizListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Quiz> quizzes});
}

/// @nodoc
class __$$QuizListImplCopyWithImpl<$Res>
    extends _$QuizListCopyWithImpl<$Res, _$QuizListImpl>
    implements _$$QuizListImplCopyWith<$Res> {
  __$$QuizListImplCopyWithImpl(
      _$QuizListImpl _value, $Res Function(_$QuizListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizzes = null,
  }) {
    return _then(_$QuizListImpl(
      quizzes: null == quizzes
          ? _value._quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
    ));
  }
}

/// @nodoc

class _$QuizListImpl with DiagnosticableTreeMixin implements _QuizList {
  const _$QuizListImpl({required final List<Quiz> quizzes})
      : _quizzes = quizzes;

  final List<Quiz> _quizzes;
  @override
  List<Quiz> get quizzes {
    if (_quizzes is EqualUnmodifiableListView) return _quizzes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizzes);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$QuizListImpl &&
            const DeepCollectionEquality().equals(other._quizzes, _quizzes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_quizzes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizListImplCopyWith<_$QuizListImpl> get copyWith =>
      __$$QuizListImplCopyWithImpl<_$QuizListImpl>(this, _$identity);
}

abstract class _QuizList implements QuizList {
  const factory _QuizList({required final List<Quiz> quizzes}) = _$QuizListImpl;

  @override
  List<Quiz> get quizzes;
  @override
  @JsonKey(ignore: true)
  _$$QuizListImplCopyWith<_$QuizListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
