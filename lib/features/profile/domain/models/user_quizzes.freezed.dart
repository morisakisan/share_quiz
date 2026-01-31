// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_quizzes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserQuizzes implements DiagnosticableTreeMixin {

 List<Quiz> get quizzes; Pagination get pagination;
/// Create a copy of UserQuizzes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserQuizzesCopyWith<UserQuizzes> get copyWith => _$UserQuizzesCopyWithImpl<UserQuizzes>(this as UserQuizzes, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserQuizzes'))
    ..add(DiagnosticsProperty('quizzes', quizzes))..add(DiagnosticsProperty('pagination', pagination));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserQuizzes&&const DeepCollectionEquality().equals(other.quizzes, quizzes)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(quizzes),pagination);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserQuizzes(quizzes: $quizzes, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $UserQuizzesCopyWith<$Res>  {
  factory $UserQuizzesCopyWith(UserQuizzes value, $Res Function(UserQuizzes) _then) = _$UserQuizzesCopyWithImpl;
@useResult
$Res call({
 List<Quiz> quizzes, Pagination pagination
});


$PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$UserQuizzesCopyWithImpl<$Res>
    implements $UserQuizzesCopyWith<$Res> {
  _$UserQuizzesCopyWithImpl(this._self, this._then);

  final UserQuizzes _self;
  final $Res Function(UserQuizzes) _then;

/// Create a copy of UserQuizzes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quizzes = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
quizzes: null == quizzes ? _self.quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}
/// Create a copy of UserQuizzes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserQuizzes].
extension UserQuizzesPatterns on UserQuizzes {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserQuizzes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserQuizzes() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserQuizzes value)  $default,){
final _that = this;
switch (_that) {
case _UserQuizzes():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserQuizzes value)?  $default,){
final _that = this;
switch (_that) {
case _UserQuizzes() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Quiz> quizzes,  Pagination pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserQuizzes() when $default != null:
return $default(_that.quizzes,_that.pagination);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Quiz> quizzes,  Pagination pagination)  $default,) {final _that = this;
switch (_that) {
case _UserQuizzes():
return $default(_that.quizzes,_that.pagination);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Quiz> quizzes,  Pagination pagination)?  $default,) {final _that = this;
switch (_that) {
case _UserQuizzes() when $default != null:
return $default(_that.quizzes,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _UserQuizzes with DiagnosticableTreeMixin implements UserQuizzes {
  const _UserQuizzes({required final  List<Quiz> quizzes, required this.pagination}): _quizzes = quizzes;
  

 final  List<Quiz> _quizzes;
@override List<Quiz> get quizzes {
  if (_quizzes is EqualUnmodifiableListView) return _quizzes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quizzes);
}

@override final  Pagination pagination;

/// Create a copy of UserQuizzes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserQuizzesCopyWith<_UserQuizzes> get copyWith => __$UserQuizzesCopyWithImpl<_UserQuizzes>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserQuizzes'))
    ..add(DiagnosticsProperty('quizzes', quizzes))..add(DiagnosticsProperty('pagination', pagination));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserQuizzes&&const DeepCollectionEquality().equals(other._quizzes, _quizzes)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_quizzes),pagination);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserQuizzes(quizzes: $quizzes, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$UserQuizzesCopyWith<$Res> implements $UserQuizzesCopyWith<$Res> {
  factory _$UserQuizzesCopyWith(_UserQuizzes value, $Res Function(_UserQuizzes) _then) = __$UserQuizzesCopyWithImpl;
@override @useResult
$Res call({
 List<Quiz> quizzes, Pagination pagination
});


@override $PaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$UserQuizzesCopyWithImpl<$Res>
    implements _$UserQuizzesCopyWith<$Res> {
  __$UserQuizzesCopyWithImpl(this._self, this._then);

  final _UserQuizzes _self;
  final $Res Function(_UserQuizzes) _then;

/// Create a copy of UserQuizzes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quizzes = null,Object? pagination = null,}) {
  return _then(_UserQuizzes(
quizzes: null == quizzes ? _self._quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination,
  ));
}

/// Create a copy of UserQuizzes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res> get pagination {
  
  return $PaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
