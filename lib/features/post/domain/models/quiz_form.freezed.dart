// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizForm implements DiagnosticableTreeMixin {

 String? get title; String? get question; File? get image; List<String>? get choices; int? get answer;
/// Create a copy of QuizForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizFormCopyWith<QuizForm> get copyWith => _$QuizFormCopyWithImpl<QuizForm>(this as QuizForm, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizForm'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('answer', answer));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizForm&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,title,question,image,const DeepCollectionEquality().hash(choices),answer);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizForm(title: $title, question: $question, image: $image, choices: $choices, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $QuizFormCopyWith<$Res>  {
  factory $QuizFormCopyWith(QuizForm value, $Res Function(QuizForm) _then) = _$QuizFormCopyWithImpl;
@useResult
$Res call({
 String? title, String? question, File? image, List<String>? choices, int? answer
});




}
/// @nodoc
class _$QuizFormCopyWithImpl<$Res>
    implements $QuizFormCopyWith<$Res> {
  _$QuizFormCopyWithImpl(this._self, this._then);

  final QuizForm _self;
  final $Res Function(QuizForm) _then;

/// Create a copy of QuizForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? question = freezed,Object? image = freezed,Object? choices = freezed,Object? answer = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,choices: freezed == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizForm].
extension QuizFormPatterns on QuizForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizForm value)  $default,){
final _that = this;
switch (_that) {
case _QuizForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizForm value)?  $default,){
final _that = this;
switch (_that) {
case _QuizForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? question,  File? image,  List<String>? choices,  int? answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizForm() when $default != null:
return $default(_that.title,_that.question,_that.image,_that.choices,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? question,  File? image,  List<String>? choices,  int? answer)  $default,) {final _that = this;
switch (_that) {
case _QuizForm():
return $default(_that.title,_that.question,_that.image,_that.choices,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? question,  File? image,  List<String>? choices,  int? answer)?  $default,) {final _that = this;
switch (_that) {
case _QuizForm() when $default != null:
return $default(_that.title,_that.question,_that.image,_that.choices,_that.answer);case _:
  return null;

}
}

}

/// @nodoc


class _QuizForm with DiagnosticableTreeMixin implements QuizForm {
  const _QuizForm({this.title, this.question, this.image, final  List<String>? choices, this.answer}): _choices = choices;
  

@override final  String? title;
@override final  String? question;
@override final  File? image;
 final  List<String>? _choices;
@override List<String>? get choices {
  final value = _choices;
  if (value == null) return null;
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? answer;

/// Create a copy of QuizForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizFormCopyWith<_QuizForm> get copyWith => __$QuizFormCopyWithImpl<_QuizForm>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizForm'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('image', image))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('answer', answer));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizForm&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,title,question,image,const DeepCollectionEquality().hash(_choices),answer);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizForm(title: $title, question: $question, image: $image, choices: $choices, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$QuizFormCopyWith<$Res> implements $QuizFormCopyWith<$Res> {
  factory _$QuizFormCopyWith(_QuizForm value, $Res Function(_QuizForm) _then) = __$QuizFormCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? question, File? image, List<String>? choices, int? answer
});




}
/// @nodoc
class __$QuizFormCopyWithImpl<$Res>
    implements _$QuizFormCopyWith<$Res> {
  __$QuizFormCopyWithImpl(this._self, this._then);

  final _QuizForm _self;
  final $Res Function(_QuizForm) _then;

/// Create a copy of QuizForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? question = freezed,Object? image = freezed,Object? choices = freezed,Object? answer = freezed,}) {
  return _then(_QuizForm(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,choices: freezed == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
