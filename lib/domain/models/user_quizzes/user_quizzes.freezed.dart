// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_quizzes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserQuizzes {
  List<Quiz> get quizzes => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserQuizzesCopyWith<UserQuizzes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserQuizzesCopyWith<$Res> {
  factory $UserQuizzesCopyWith(
          UserQuizzes value, $Res Function(UserQuizzes) then) =
      _$UserQuizzesCopyWithImpl<$Res, UserQuizzes>;
  @useResult
  $Res call({List<Quiz> quizzes, Pagination pagination});

  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$UserQuizzesCopyWithImpl<$Res, $Val extends UserQuizzes>
    implements $UserQuizzesCopyWith<$Res> {
  _$UserQuizzesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizzes = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      quizzes: null == quizzes
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserQuizzesImplCopyWith<$Res>
    implements $UserQuizzesCopyWith<$Res> {
  factory _$$UserQuizzesImplCopyWith(
          _$UserQuizzesImpl value, $Res Function(_$UserQuizzesImpl) then) =
      __$$UserQuizzesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Quiz> quizzes, Pagination pagination});

  @override
  $PaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$UserQuizzesImplCopyWithImpl<$Res>
    extends _$UserQuizzesCopyWithImpl<$Res, _$UserQuizzesImpl>
    implements _$$UserQuizzesImplCopyWith<$Res> {
  __$$UserQuizzesImplCopyWithImpl(
      _$UserQuizzesImpl _value, $Res Function(_$UserQuizzesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizzes = null,
    Object? pagination = null,
  }) {
    return _then(_$UserQuizzesImpl(
      quizzes: null == quizzes
          ? _value._quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
    ));
  }
}

/// @nodoc

class _$UserQuizzesImpl with DiagnosticableTreeMixin implements _UserQuizzes {
  const _$UserQuizzesImpl(
      {required final List<Quiz> quizzes, required this.pagination})
      : _quizzes = quizzes;

  final List<Quiz> _quizzes;
  @override
  List<Quiz> get quizzes {
    if (_quizzes is EqualUnmodifiableListView) return _quizzes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizzes);
  }

  @override
  final Pagination pagination;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserQuizzes(quizzes: $quizzes, pagination: $pagination)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserQuizzes'))
      ..add(DiagnosticsProperty('quizzes', quizzes))
      ..add(DiagnosticsProperty('pagination', pagination));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserQuizzesImpl &&
            const DeepCollectionEquality().equals(other._quizzes, _quizzes) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_quizzes), pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserQuizzesImplCopyWith<_$UserQuizzesImpl> get copyWith =>
      __$$UserQuizzesImplCopyWithImpl<_$UserQuizzesImpl>(this, _$identity);
}

abstract class _UserQuizzes implements UserQuizzes {
  const factory _UserQuizzes(
      {required final List<Quiz> quizzes,
      required final Pagination pagination}) = _$UserQuizzesImpl;

  @override
  List<Quiz> get quizzes;
  @override
  Pagination get pagination;
  @override
  @JsonKey(ignore: true)
  _$$UserQuizzesImplCopyWith<_$UserQuizzesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
