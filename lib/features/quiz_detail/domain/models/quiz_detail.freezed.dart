// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizDetail implements DiagnosticableTreeMixin {

 Quiz get quiz; UserQuizInteraction get userQuizInteraction;
/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizDetailCopyWith<QuizDetail> get copyWith => _$QuizDetailCopyWithImpl<QuizDetail>(this as QuizDetail, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizDetail'))
    ..add(DiagnosticsProperty('quiz', quiz))..add(DiagnosticsProperty('userQuizInteraction', userQuizInteraction));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizDetail&&(identical(other.quiz, quiz) || other.quiz == quiz)&&(identical(other.userQuizInteraction, userQuizInteraction) || other.userQuizInteraction == userQuizInteraction));
}


@override
int get hashCode => Object.hash(runtimeType,quiz,userQuizInteraction);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizDetail(quiz: $quiz, userQuizInteraction: $userQuizInteraction)';
}


}

/// @nodoc
abstract mixin class $QuizDetailCopyWith<$Res>  {
  factory $QuizDetailCopyWith(QuizDetail value, $Res Function(QuizDetail) _then) = _$QuizDetailCopyWithImpl;
@useResult
$Res call({
 Quiz quiz, UserQuizInteraction userQuizInteraction
});


$QuizCopyWith<$Res> get quiz;$UserQuizInteractionCopyWith<$Res> get userQuizInteraction;

}
/// @nodoc
class _$QuizDetailCopyWithImpl<$Res>
    implements $QuizDetailCopyWith<$Res> {
  _$QuizDetailCopyWithImpl(this._self, this._then);

  final QuizDetail _self;
  final $Res Function(QuizDetail) _then;

/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quiz = null,Object? userQuizInteraction = null,}) {
  return _then(_self.copyWith(
quiz: null == quiz ? _self.quiz : quiz // ignore: cast_nullable_to_non_nullable
as Quiz,userQuizInteraction: null == userQuizInteraction ? _self.userQuizInteraction : userQuizInteraction // ignore: cast_nullable_to_non_nullable
as UserQuizInteraction,
  ));
}
/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizCopyWith<$Res> get quiz {
  
  return $QuizCopyWith<$Res>(_self.quiz, (value) {
    return _then(_self.copyWith(quiz: value));
  });
}/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserQuizInteractionCopyWith<$Res> get userQuizInteraction {
  
  return $UserQuizInteractionCopyWith<$Res>(_self.userQuizInteraction, (value) {
    return _then(_self.copyWith(userQuizInteraction: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuizDetail].
extension QuizDetailPatterns on QuizDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizDetail value)  $default,){
final _that = this;
switch (_that) {
case _QuizDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizDetail value)?  $default,){
final _that = this;
switch (_that) {
case _QuizDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Quiz quiz,  UserQuizInteraction userQuizInteraction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizDetail() when $default != null:
return $default(_that.quiz,_that.userQuizInteraction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Quiz quiz,  UserQuizInteraction userQuizInteraction)  $default,) {final _that = this;
switch (_that) {
case _QuizDetail():
return $default(_that.quiz,_that.userQuizInteraction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Quiz quiz,  UserQuizInteraction userQuizInteraction)?  $default,) {final _that = this;
switch (_that) {
case _QuizDetail() when $default != null:
return $default(_that.quiz,_that.userQuizInteraction);case _:
  return null;

}
}

}

/// @nodoc


class _QuizDetail with DiagnosticableTreeMixin implements QuizDetail {
  const _QuizDetail({required this.quiz, required this.userQuizInteraction});
  

@override final  Quiz quiz;
@override final  UserQuizInteraction userQuizInteraction;

/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizDetailCopyWith<_QuizDetail> get copyWith => __$QuizDetailCopyWithImpl<_QuizDetail>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizDetail'))
    ..add(DiagnosticsProperty('quiz', quiz))..add(DiagnosticsProperty('userQuizInteraction', userQuizInteraction));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizDetail&&(identical(other.quiz, quiz) || other.quiz == quiz)&&(identical(other.userQuizInteraction, userQuizInteraction) || other.userQuizInteraction == userQuizInteraction));
}


@override
int get hashCode => Object.hash(runtimeType,quiz,userQuizInteraction);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizDetail(quiz: $quiz, userQuizInteraction: $userQuizInteraction)';
}


}

/// @nodoc
abstract mixin class _$QuizDetailCopyWith<$Res> implements $QuizDetailCopyWith<$Res> {
  factory _$QuizDetailCopyWith(_QuizDetail value, $Res Function(_QuizDetail) _then) = __$QuizDetailCopyWithImpl;
@override @useResult
$Res call({
 Quiz quiz, UserQuizInteraction userQuizInteraction
});


@override $QuizCopyWith<$Res> get quiz;@override $UserQuizInteractionCopyWith<$Res> get userQuizInteraction;

}
/// @nodoc
class __$QuizDetailCopyWithImpl<$Res>
    implements _$QuizDetailCopyWith<$Res> {
  __$QuizDetailCopyWithImpl(this._self, this._then);

  final _QuizDetail _self;
  final $Res Function(_QuizDetail) _then;

/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quiz = null,Object? userQuizInteraction = null,}) {
  return _then(_QuizDetail(
quiz: null == quiz ? _self.quiz : quiz // ignore: cast_nullable_to_non_nullable
as Quiz,userQuizInteraction: null == userQuizInteraction ? _self.userQuizInteraction : userQuizInteraction // ignore: cast_nullable_to_non_nullable
as UserQuizInteraction,
  ));
}

/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizCopyWith<$Res> get quiz {
  
  return $QuizCopyWith<$Res>(_self.quiz, (value) {
    return _then(_self.copyWith(quiz: value));
  });
}/// Create a copy of QuizDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserQuizInteractionCopyWith<$Res> get userQuizInteraction {
  
  return $UserQuizInteractionCopyWith<$Res>(_self.userQuizInteraction, (value) {
    return _then(_self.copyWith(userQuizInteraction: value));
  });
}
}

// dart format on
