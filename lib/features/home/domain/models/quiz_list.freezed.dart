// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizList implements DiagnosticableTreeMixin {

 List<Quiz> get quizzes;
/// Create a copy of QuizList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizListCopyWith<QuizList> get copyWith => _$QuizListCopyWithImpl<QuizList>(this as QuizList, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizList'))
    ..add(DiagnosticsProperty('quizzes', quizzes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizList&&const DeepCollectionEquality().equals(other.quizzes, quizzes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(quizzes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizList(quizzes: $quizzes)';
}


}

/// @nodoc
abstract mixin class $QuizListCopyWith<$Res>  {
  factory $QuizListCopyWith(QuizList value, $Res Function(QuizList) _then) = _$QuizListCopyWithImpl;
@useResult
$Res call({
 List<Quiz> quizzes
});




}
/// @nodoc
class _$QuizListCopyWithImpl<$Res>
    implements $QuizListCopyWith<$Res> {
  _$QuizListCopyWithImpl(this._self, this._then);

  final QuizList _self;
  final $Res Function(QuizList) _then;

/// Create a copy of QuizList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quizzes = null,}) {
  return _then(_self.copyWith(
quizzes: null == quizzes ? _self.quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizList].
extension QuizListPatterns on QuizList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizList value)  $default,){
final _that = this;
switch (_that) {
case _QuizList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizList value)?  $default,){
final _that = this;
switch (_that) {
case _QuizList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Quiz> quizzes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizList() when $default != null:
return $default(_that.quizzes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Quiz> quizzes)  $default,) {final _that = this;
switch (_that) {
case _QuizList():
return $default(_that.quizzes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Quiz> quizzes)?  $default,) {final _that = this;
switch (_that) {
case _QuizList() when $default != null:
return $default(_that.quizzes);case _:
  return null;

}
}

}

/// @nodoc


class _QuizList with DiagnosticableTreeMixin implements QuizList {
  const _QuizList({required final  List<Quiz> quizzes}): _quizzes = quizzes;
  

 final  List<Quiz> _quizzes;
@override List<Quiz> get quizzes {
  if (_quizzes is EqualUnmodifiableListView) return _quizzes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quizzes);
}


/// Create a copy of QuizList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizListCopyWith<_QuizList> get copyWith => __$QuizListCopyWithImpl<_QuizList>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizList'))
    ..add(DiagnosticsProperty('quizzes', quizzes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizList&&const DeepCollectionEquality().equals(other._quizzes, _quizzes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_quizzes));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizList(quizzes: $quizzes)';
}


}

/// @nodoc
abstract mixin class _$QuizListCopyWith<$Res> implements $QuizListCopyWith<$Res> {
  factory _$QuizListCopyWith(_QuizList value, $Res Function(_QuizList) _then) = __$QuizListCopyWithImpl;
@override @useResult
$Res call({
 List<Quiz> quizzes
});




}
/// @nodoc
class __$QuizListCopyWithImpl<$Res>
    implements _$QuizListCopyWith<$Res> {
  __$QuizListCopyWithImpl(this._self, this._then);

  final _QuizList _self;
  final $Res Function(_QuizList) _then;

/// Create a copy of QuizList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quizzes = null,}) {
  return _then(_QuizList(
quizzes: null == quizzes ? _self._quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,
  ));
}


}

// dart format on
