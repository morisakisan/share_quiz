// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizPostData implements DiagnosticableTreeMixin {

 String get title; String get question; List<String> get choices; int get answer; File? get imageFile;
/// Create a copy of QuizPostData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizPostDataCopyWith<QuizPostData> get copyWith => _$QuizPostDataCopyWithImpl<QuizPostData>(this as QuizPostData, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizPostData'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('imageFile', imageFile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizPostData&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,title,question,const DeepCollectionEquality().hash(choices),answer,imageFile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizPostData(title: $title, question: $question, choices: $choices, answer: $answer, imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class $QuizPostDataCopyWith<$Res>  {
  factory $QuizPostDataCopyWith(QuizPostData value, $Res Function(QuizPostData) _then) = _$QuizPostDataCopyWithImpl;
@useResult
$Res call({
 String title, String question, List<String> choices, int answer, File? imageFile
});




}
/// @nodoc
class _$QuizPostDataCopyWithImpl<$Res>
    implements $QuizPostDataCopyWith<$Res> {
  _$QuizPostDataCopyWithImpl(this._self, this._then);

  final QuizPostData _self;
  final $Res Function(QuizPostData) _then;

/// Create a copy of QuizPostData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? question = null,Object? choices = null,Object? answer = null,Object? imageFile = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizPostData].
extension QuizPostDataPatterns on QuizPostData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizPostData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizPostData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizPostData value)  $default,){
final _that = this;
switch (_that) {
case _QuizPostData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizPostData value)?  $default,){
final _that = this;
switch (_that) {
case _QuizPostData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String question,  List<String> choices,  int answer,  File? imageFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizPostData() when $default != null:
return $default(_that.title,_that.question,_that.choices,_that.answer,_that.imageFile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String question,  List<String> choices,  int answer,  File? imageFile)  $default,) {final _that = this;
switch (_that) {
case _QuizPostData():
return $default(_that.title,_that.question,_that.choices,_that.answer,_that.imageFile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String question,  List<String> choices,  int answer,  File? imageFile)?  $default,) {final _that = this;
switch (_that) {
case _QuizPostData() when $default != null:
return $default(_that.title,_that.question,_that.choices,_that.answer,_that.imageFile);case _:
  return null;

}
}

}

/// @nodoc


class _QuizPostData with DiagnosticableTreeMixin implements QuizPostData {
  const _QuizPostData({required this.title, required this.question, required final  List<String> choices, required this.answer, this.imageFile = null}): _choices = choices;
  

@override final  String title;
@override final  String question;
 final  List<String> _choices;
@override List<String> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override final  int answer;
@override@JsonKey() final  File? imageFile;

/// Create a copy of QuizPostData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizPostDataCopyWith<_QuizPostData> get copyWith => __$QuizPostDataCopyWithImpl<_QuizPostData>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizPostData'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('answer', answer))..add(DiagnosticsProperty('imageFile', imageFile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizPostData&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,title,question,const DeepCollectionEquality().hash(_choices),answer,imageFile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizPostData(title: $title, question: $question, choices: $choices, answer: $answer, imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class _$QuizPostDataCopyWith<$Res> implements $QuizPostDataCopyWith<$Res> {
  factory _$QuizPostDataCopyWith(_QuizPostData value, $Res Function(_QuizPostData) _then) = __$QuizPostDataCopyWithImpl;
@override @useResult
$Res call({
 String title, String question, List<String> choices, int answer, File? imageFile
});




}
/// @nodoc
class __$QuizPostDataCopyWithImpl<$Res>
    implements _$QuizPostDataCopyWith<$Res> {
  __$QuizPostDataCopyWithImpl(this._self, this._then);

  final _QuizPostData _self;
  final $Res Function(_QuizPostData) _then;

/// Create a copy of QuizPostData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? question = null,Object? choices = null,Object? answer = null,Object? imageFile = freezed,}) {
  return _then(_QuizPostData(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as int,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
