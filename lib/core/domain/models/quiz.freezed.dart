// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Quiz implements DiagnosticableTreeMixin {

 String get documentId; String get title; String get question; List<String> get choices; int get correctAnswer; DateTime? get createdAt; double? get correctAnswerRate; int? get answerCount; int? get goodCount; List<String> get imageUrls;
/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizCopyWith<Quiz> get copyWith => _$QuizCopyWithImpl<Quiz>(this as Quiz, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Quiz'))
    ..add(DiagnosticsProperty('documentId', documentId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('correctAnswer', correctAnswer))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('correctAnswerRate', correctAnswerRate))..add(DiagnosticsProperty('answerCount', answerCount))..add(DiagnosticsProperty('goodCount', goodCount))..add(DiagnosticsProperty('imageUrls', imageUrls));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quiz&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.correctAnswerRate, correctAnswerRate) || other.correctAnswerRate == correctAnswerRate)&&(identical(other.answerCount, answerCount) || other.answerCount == answerCount)&&(identical(other.goodCount, goodCount) || other.goodCount == goodCount)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls));
}


@override
int get hashCode => Object.hash(runtimeType,documentId,title,question,const DeepCollectionEquality().hash(choices),correctAnswer,createdAt,correctAnswerRate,answerCount,goodCount,const DeepCollectionEquality().hash(imageUrls));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Quiz(documentId: $documentId, title: $title, question: $question, choices: $choices, correctAnswer: $correctAnswer, createdAt: $createdAt, correctAnswerRate: $correctAnswerRate, answerCount: $answerCount, goodCount: $goodCount, imageUrls: $imageUrls)';
}


}

/// @nodoc
abstract mixin class $QuizCopyWith<$Res>  {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) _then) = _$QuizCopyWithImpl;
@useResult
$Res call({
 String documentId, String title, String question, List<String> choices, int correctAnswer, DateTime? createdAt, double? correctAnswerRate, int? answerCount, int? goodCount, List<String> imageUrls
});




}
/// @nodoc
class _$QuizCopyWithImpl<$Res>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._self, this._then);

  final Quiz _self;
  final $Res Function(Quiz) _then;

/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentId = null,Object? title = null,Object? question = null,Object? choices = null,Object? correctAnswer = null,Object? createdAt = freezed,Object? correctAnswerRate = freezed,Object? answerCount = freezed,Object? goodCount = freezed,Object? imageUrls = null,}) {
  return _then(_self.copyWith(
documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,correctAnswerRate: freezed == correctAnswerRate ? _self.correctAnswerRate : correctAnswerRate // ignore: cast_nullable_to_non_nullable
as double?,answerCount: freezed == answerCount ? _self.answerCount : answerCount // ignore: cast_nullable_to_non_nullable
as int?,goodCount: freezed == goodCount ? _self.goodCount : goodCount // ignore: cast_nullable_to_non_nullable
as int?,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Quiz].
extension QuizPatterns on Quiz {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quiz value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quiz() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quiz value)  $default,){
final _that = this;
switch (_that) {
case _Quiz():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quiz value)?  $default,){
final _that = this;
switch (_that) {
case _Quiz() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String documentId,  String title,  String question,  List<String> choices,  int correctAnswer,  DateTime? createdAt,  double? correctAnswerRate,  int? answerCount,  int? goodCount,  List<String> imageUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quiz() when $default != null:
return $default(_that.documentId,_that.title,_that.question,_that.choices,_that.correctAnswer,_that.createdAt,_that.correctAnswerRate,_that.answerCount,_that.goodCount,_that.imageUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String documentId,  String title,  String question,  List<String> choices,  int correctAnswer,  DateTime? createdAt,  double? correctAnswerRate,  int? answerCount,  int? goodCount,  List<String> imageUrls)  $default,) {final _that = this;
switch (_that) {
case _Quiz():
return $default(_that.documentId,_that.title,_that.question,_that.choices,_that.correctAnswer,_that.createdAt,_that.correctAnswerRate,_that.answerCount,_that.goodCount,_that.imageUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String documentId,  String title,  String question,  List<String> choices,  int correctAnswer,  DateTime? createdAt,  double? correctAnswerRate,  int? answerCount,  int? goodCount,  List<String> imageUrls)?  $default,) {final _that = this;
switch (_that) {
case _Quiz() when $default != null:
return $default(_that.documentId,_that.title,_that.question,_that.choices,_that.correctAnswer,_that.createdAt,_that.correctAnswerRate,_that.answerCount,_that.goodCount,_that.imageUrls);case _:
  return null;

}
}

}

/// @nodoc


class _Quiz with DiagnosticableTreeMixin implements Quiz {
  const _Quiz({required this.documentId, required this.title, required this.question, required final  List<String> choices, required this.correctAnswer, required this.createdAt, required this.correctAnswerRate, required this.answerCount, required this.goodCount, required final  List<String> imageUrls}): _choices = choices,_imageUrls = imageUrls;
  

@override final  String documentId;
@override final  String title;
@override final  String question;
 final  List<String> _choices;
@override List<String> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override final  int correctAnswer;
@override final  DateTime? createdAt;
@override final  double? correctAnswerRate;
@override final  int? answerCount;
@override final  int? goodCount;
 final  List<String> _imageUrls;
@override List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}


/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizCopyWith<_Quiz> get copyWith => __$QuizCopyWithImpl<_Quiz>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Quiz'))
    ..add(DiagnosticsProperty('documentId', documentId))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('correctAnswer', correctAnswer))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('correctAnswerRate', correctAnswerRate))..add(DiagnosticsProperty('answerCount', answerCount))..add(DiagnosticsProperty('goodCount', goodCount))..add(DiagnosticsProperty('imageUrls', imageUrls));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quiz&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.correctAnswerRate, correctAnswerRate) || other.correctAnswerRate == correctAnswerRate)&&(identical(other.answerCount, answerCount) || other.answerCount == answerCount)&&(identical(other.goodCount, goodCount) || other.goodCount == goodCount)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls));
}


@override
int get hashCode => Object.hash(runtimeType,documentId,title,question,const DeepCollectionEquality().hash(_choices),correctAnswer,createdAt,correctAnswerRate,answerCount,goodCount,const DeepCollectionEquality().hash(_imageUrls));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Quiz(documentId: $documentId, title: $title, question: $question, choices: $choices, correctAnswer: $correctAnswer, createdAt: $createdAt, correctAnswerRate: $correctAnswerRate, answerCount: $answerCount, goodCount: $goodCount, imageUrls: $imageUrls)';
}


}

/// @nodoc
abstract mixin class _$QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$QuizCopyWith(_Quiz value, $Res Function(_Quiz) _then) = __$QuizCopyWithImpl;
@override @useResult
$Res call({
 String documentId, String title, String question, List<String> choices, int correctAnswer, DateTime? createdAt, double? correctAnswerRate, int? answerCount, int? goodCount, List<String> imageUrls
});




}
/// @nodoc
class __$QuizCopyWithImpl<$Res>
    implements _$QuizCopyWith<$Res> {
  __$QuizCopyWithImpl(this._self, this._then);

  final _Quiz _self;
  final $Res Function(_Quiz) _then;

/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentId = null,Object? title = null,Object? question = null,Object? choices = null,Object? correctAnswer = null,Object? createdAt = freezed,Object? correctAnswerRate = freezed,Object? answerCount = freezed,Object? goodCount = freezed,Object? imageUrls = null,}) {
  return _then(_Quiz(
documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,correctAnswerRate: freezed == correctAnswerRate ? _self.correctAnswerRate : correctAnswerRate // ignore: cast_nullable_to_non_nullable
as double?,answerCount: freezed == answerCount ? _self.answerCount : answerCount // ignore: cast_nullable_to_non_nullable
as int?,goodCount: freezed == goodCount ? _self.goodCount : goodCount // ignore: cast_nullable_to_non_nullable
as int?,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
