// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_quiz_interaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserQuizInteraction implements DiagnosticableTreeMixin {

 bool get isLogin; int? get selectAnswer; bool get hasGood;
/// Create a copy of UserQuizInteraction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserQuizInteractionCopyWith<UserQuizInteraction> get copyWith => _$UserQuizInteractionCopyWithImpl<UserQuizInteraction>(this as UserQuizInteraction, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserQuizInteraction'))
    ..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('selectAnswer', selectAnswer))..add(DiagnosticsProperty('hasGood', hasGood));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserQuizInteraction&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.selectAnswer, selectAnswer) || other.selectAnswer == selectAnswer)&&(identical(other.hasGood, hasGood) || other.hasGood == hasGood));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,selectAnswer,hasGood);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserQuizInteraction(isLogin: $isLogin, selectAnswer: $selectAnswer, hasGood: $hasGood)';
}


}

/// @nodoc
abstract mixin class $UserQuizInteractionCopyWith<$Res>  {
  factory $UserQuizInteractionCopyWith(UserQuizInteraction value, $Res Function(UserQuizInteraction) _then) = _$UserQuizInteractionCopyWithImpl;
@useResult
$Res call({
 bool isLogin, int? selectAnswer, bool hasGood
});




}
/// @nodoc
class _$UserQuizInteractionCopyWithImpl<$Res>
    implements $UserQuizInteractionCopyWith<$Res> {
  _$UserQuizInteractionCopyWithImpl(this._self, this._then);

  final UserQuizInteraction _self;
  final $Res Function(UserQuizInteraction) _then;

/// Create a copy of UserQuizInteraction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogin = null,Object? selectAnswer = freezed,Object? hasGood = null,}) {
  return _then(_self.copyWith(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,selectAnswer: freezed == selectAnswer ? _self.selectAnswer : selectAnswer // ignore: cast_nullable_to_non_nullable
as int?,hasGood: null == hasGood ? _self.hasGood : hasGood // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserQuizInteraction].
extension UserQuizInteractionPatterns on UserQuizInteraction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserQuizInteraction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserQuizInteraction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserQuizInteraction value)  $default,){
final _that = this;
switch (_that) {
case _UserQuizInteraction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserQuizInteraction value)?  $default,){
final _that = this;
switch (_that) {
case _UserQuizInteraction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLogin,  int? selectAnswer,  bool hasGood)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserQuizInteraction() when $default != null:
return $default(_that.isLogin,_that.selectAnswer,_that.hasGood);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLogin,  int? selectAnswer,  bool hasGood)  $default,) {final _that = this;
switch (_that) {
case _UserQuizInteraction():
return $default(_that.isLogin,_that.selectAnswer,_that.hasGood);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLogin,  int? selectAnswer,  bool hasGood)?  $default,) {final _that = this;
switch (_that) {
case _UserQuizInteraction() when $default != null:
return $default(_that.isLogin,_that.selectAnswer,_that.hasGood);case _:
  return null;

}
}

}

/// @nodoc


class _UserQuizInteraction with DiagnosticableTreeMixin implements UserQuizInteraction {
  const _UserQuizInteraction({required this.isLogin, required this.selectAnswer, required this.hasGood});
  

@override final  bool isLogin;
@override final  int? selectAnswer;
@override final  bool hasGood;

/// Create a copy of UserQuizInteraction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserQuizInteractionCopyWith<_UserQuizInteraction> get copyWith => __$UserQuizInteractionCopyWithImpl<_UserQuizInteraction>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserQuizInteraction'))
    ..add(DiagnosticsProperty('isLogin', isLogin))..add(DiagnosticsProperty('selectAnswer', selectAnswer))..add(DiagnosticsProperty('hasGood', hasGood));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserQuizInteraction&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.selectAnswer, selectAnswer) || other.selectAnswer == selectAnswer)&&(identical(other.hasGood, hasGood) || other.hasGood == hasGood));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,selectAnswer,hasGood);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserQuizInteraction(isLogin: $isLogin, selectAnswer: $selectAnswer, hasGood: $hasGood)';
}


}

/// @nodoc
abstract mixin class _$UserQuizInteractionCopyWith<$Res> implements $UserQuizInteractionCopyWith<$Res> {
  factory _$UserQuizInteractionCopyWith(_UserQuizInteraction value, $Res Function(_UserQuizInteraction) _then) = __$UserQuizInteractionCopyWithImpl;
@override @useResult
$Res call({
 bool isLogin, int? selectAnswer, bool hasGood
});




}
/// @nodoc
class __$UserQuizInteractionCopyWithImpl<$Res>
    implements _$UserQuizInteractionCopyWith<$Res> {
  __$UserQuizInteractionCopyWithImpl(this._self, this._then);

  final _UserQuizInteraction _self;
  final $Res Function(_UserQuizInteraction) _then;

/// Create a copy of UserQuizInteraction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogin = null,Object? selectAnswer = freezed,Object? hasGood = null,}) {
  return _then(_UserQuizInteraction(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,selectAnswer: freezed == selectAnswer ? _self.selectAnswer : selectAnswer // ignore: cast_nullable_to_non_nullable
as int?,hasGood: null == hasGood ? _self.hasGood : hasGood // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
