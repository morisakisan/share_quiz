// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizDto implements DiagnosticableTreeMixin {

@JsonKey(includeFromJson: true, includeToJson: true) String? get docId;@JsonKey(name: 'correct_answer') int get correctAnswer;@JsonKey(name: 'title') String get title;@JsonKey(name: 'question') String get question;@JsonKey(name: 'image_url') List<String> get imageUrl;@JsonKey(name: 'choices') List<String> get choices;@TimestampConverter()@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'uid') String get uid;@JsonKey(name: 'correct_answer_rate') double? get correctAnswerRate;@JsonKey(name: 'answer_count') int? get answerCount;@JsonKey(name: 'good_count') int? get goodCount;
/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizDtoCopyWith<QuizDto> get copyWith => _$QuizDtoCopyWithImpl<QuizDto>(this as QuizDto, _$identity);

  /// Serializes this QuizDto to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizDto'))
    ..add(DiagnosticsProperty('docId', docId))..add(DiagnosticsProperty('correctAnswer', correctAnswer))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('uid', uid))..add(DiagnosticsProperty('correctAnswerRate', correctAnswerRate))..add(DiagnosticsProperty('answerCount', answerCount))..add(DiagnosticsProperty('goodCount', goodCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizDto&&(identical(other.docId, docId) || other.docId == docId)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.imageUrl, imageUrl)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.correctAnswerRate, correctAnswerRate) || other.correctAnswerRate == correctAnswerRate)&&(identical(other.answerCount, answerCount) || other.answerCount == answerCount)&&(identical(other.goodCount, goodCount) || other.goodCount == goodCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,docId,correctAnswer,title,question,const DeepCollectionEquality().hash(imageUrl),const DeepCollectionEquality().hash(choices),createdAt,uid,correctAnswerRate,answerCount,goodCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizDto(docId: $docId, correctAnswer: $correctAnswer, title: $title, question: $question, imageUrl: $imageUrl, choices: $choices, createdAt: $createdAt, uid: $uid, correctAnswerRate: $correctAnswerRate, answerCount: $answerCount, goodCount: $goodCount)';
}


}

/// @nodoc
abstract mixin class $QuizDtoCopyWith<$Res>  {
  factory $QuizDtoCopyWith(QuizDto value, $Res Function(QuizDto) _then) = _$QuizDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeFromJson: true, includeToJson: true) String? docId,@JsonKey(name: 'correct_answer') int correctAnswer,@JsonKey(name: 'title') String title,@JsonKey(name: 'question') String question,@JsonKey(name: 'image_url') List<String> imageUrl,@JsonKey(name: 'choices') List<String> choices,@TimestampConverter()@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'correct_answer_rate') double? correctAnswerRate,@JsonKey(name: 'answer_count') int? answerCount,@JsonKey(name: 'good_count') int? goodCount
});




}
/// @nodoc
class _$QuizDtoCopyWithImpl<$Res>
    implements $QuizDtoCopyWith<$Res> {
  _$QuizDtoCopyWithImpl(this._self, this._then);

  final QuizDto _self;
  final $Res Function(QuizDto) _then;

/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? docId = freezed,Object? correctAnswer = null,Object? title = null,Object? question = null,Object? imageUrl = null,Object? choices = null,Object? createdAt = freezed,Object? uid = null,Object? correctAnswerRate = freezed,Object? answerCount = freezed,Object? goodCount = freezed,}) {
  return _then(_self.copyWith(
docId: freezed == docId ? _self.docId : docId // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as List<String>,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,correctAnswerRate: freezed == correctAnswerRate ? _self.correctAnswerRate : correctAnswerRate // ignore: cast_nullable_to_non_nullable
as double?,answerCount: freezed == answerCount ? _self.answerCount : answerCount // ignore: cast_nullable_to_non_nullable
as int?,goodCount: freezed == goodCount ? _self.goodCount : goodCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizDto].
extension QuizDtoPatterns on QuizDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizDto value)  $default,){
final _that = this;
switch (_that) {
case _QuizDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: true, includeToJson: true)  String? docId, @JsonKey(name: 'correct_answer')  int correctAnswer, @JsonKey(name: 'title')  String title, @JsonKey(name: 'question')  String question, @JsonKey(name: 'image_url')  List<String> imageUrl, @JsonKey(name: 'choices')  List<String> choices, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'correct_answer_rate')  double? correctAnswerRate, @JsonKey(name: 'answer_count')  int? answerCount, @JsonKey(name: 'good_count')  int? goodCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
return $default(_that.docId,_that.correctAnswer,_that.title,_that.question,_that.imageUrl,_that.choices,_that.createdAt,_that.uid,_that.correctAnswerRate,_that.answerCount,_that.goodCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeFromJson: true, includeToJson: true)  String? docId, @JsonKey(name: 'correct_answer')  int correctAnswer, @JsonKey(name: 'title')  String title, @JsonKey(name: 'question')  String question, @JsonKey(name: 'image_url')  List<String> imageUrl, @JsonKey(name: 'choices')  List<String> choices, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'correct_answer_rate')  double? correctAnswerRate, @JsonKey(name: 'answer_count')  int? answerCount, @JsonKey(name: 'good_count')  int? goodCount)  $default,) {final _that = this;
switch (_that) {
case _QuizDto():
return $default(_that.docId,_that.correctAnswer,_that.title,_that.question,_that.imageUrl,_that.choices,_that.createdAt,_that.uid,_that.correctAnswerRate,_that.answerCount,_that.goodCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeFromJson: true, includeToJson: true)  String? docId, @JsonKey(name: 'correct_answer')  int correctAnswer, @JsonKey(name: 'title')  String title, @JsonKey(name: 'question')  String question, @JsonKey(name: 'image_url')  List<String> imageUrl, @JsonKey(name: 'choices')  List<String> choices, @TimestampConverter()@JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'uid')  String uid, @JsonKey(name: 'correct_answer_rate')  double? correctAnswerRate, @JsonKey(name: 'answer_count')  int? answerCount, @JsonKey(name: 'good_count')  int? goodCount)?  $default,) {final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
return $default(_that.docId,_that.correctAnswer,_that.title,_that.question,_that.imageUrl,_that.choices,_that.createdAt,_that.uid,_that.correctAnswerRate,_that.answerCount,_that.goodCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizDto with DiagnosticableTreeMixin implements QuizDto {
  const _QuizDto({@JsonKey(includeFromJson: true, includeToJson: true) this.docId, @JsonKey(name: 'correct_answer') required this.correctAnswer, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'question') required this.question, @JsonKey(name: 'image_url') required final  List<String> imageUrl, @JsonKey(name: 'choices') required final  List<String> choices, @TimestampConverter()@JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'uid') required this.uid, @JsonKey(name: 'correct_answer_rate') required this.correctAnswerRate, @JsonKey(name: 'answer_count') required this.answerCount, @JsonKey(name: 'good_count') required this.goodCount}): _imageUrl = imageUrl,_choices = choices;
  factory _QuizDto.fromJson(Map<String, dynamic> json) => _$QuizDtoFromJson(json);

@override@JsonKey(includeFromJson: true, includeToJson: true) final  String? docId;
@override@JsonKey(name: 'correct_answer') final  int correctAnswer;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'question') final  String question;
 final  List<String> _imageUrl;
@override@JsonKey(name: 'image_url') List<String> get imageUrl {
  if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrl);
}

 final  List<String> _choices;
@override@JsonKey(name: 'choices') List<String> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override@TimestampConverter()@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'uid') final  String uid;
@override@JsonKey(name: 'correct_answer_rate') final  double? correctAnswerRate;
@override@JsonKey(name: 'answer_count') final  int? answerCount;
@override@JsonKey(name: 'good_count') final  int? goodCount;

/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizDtoCopyWith<_QuizDto> get copyWith => __$QuizDtoCopyWithImpl<_QuizDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizDtoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'QuizDto'))
    ..add(DiagnosticsProperty('docId', docId))..add(DiagnosticsProperty('correctAnswer', correctAnswer))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('question', question))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('choices', choices))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('uid', uid))..add(DiagnosticsProperty('correctAnswerRate', correctAnswerRate))..add(DiagnosticsProperty('answerCount', answerCount))..add(DiagnosticsProperty('goodCount', goodCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizDto&&(identical(other.docId, docId) || other.docId == docId)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.title, title) || other.title == title)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._imageUrl, _imageUrl)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.correctAnswerRate, correctAnswerRate) || other.correctAnswerRate == correctAnswerRate)&&(identical(other.answerCount, answerCount) || other.answerCount == answerCount)&&(identical(other.goodCount, goodCount) || other.goodCount == goodCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,docId,correctAnswer,title,question,const DeepCollectionEquality().hash(_imageUrl),const DeepCollectionEquality().hash(_choices),createdAt,uid,correctAnswerRate,answerCount,goodCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'QuizDto(docId: $docId, correctAnswer: $correctAnswer, title: $title, question: $question, imageUrl: $imageUrl, choices: $choices, createdAt: $createdAt, uid: $uid, correctAnswerRate: $correctAnswerRate, answerCount: $answerCount, goodCount: $goodCount)';
}


}

/// @nodoc
abstract mixin class _$QuizDtoCopyWith<$Res> implements $QuizDtoCopyWith<$Res> {
  factory _$QuizDtoCopyWith(_QuizDto value, $Res Function(_QuizDto) _then) = __$QuizDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeFromJson: true, includeToJson: true) String? docId,@JsonKey(name: 'correct_answer') int correctAnswer,@JsonKey(name: 'title') String title,@JsonKey(name: 'question') String question,@JsonKey(name: 'image_url') List<String> imageUrl,@JsonKey(name: 'choices') List<String> choices,@TimestampConverter()@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'correct_answer_rate') double? correctAnswerRate,@JsonKey(name: 'answer_count') int? answerCount,@JsonKey(name: 'good_count') int? goodCount
});




}
/// @nodoc
class __$QuizDtoCopyWithImpl<$Res>
    implements _$QuizDtoCopyWith<$Res> {
  __$QuizDtoCopyWithImpl(this._self, this._then);

  final _QuizDto _self;
  final $Res Function(_QuizDto) _then;

/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? docId = freezed,Object? correctAnswer = null,Object? title = null,Object? question = null,Object? imageUrl = null,Object? choices = null,Object? createdAt = freezed,Object? uid = null,Object? correctAnswerRate = freezed,Object? answerCount = freezed,Object? goodCount = freezed,}) {
  return _then(_QuizDto(
docId: freezed == docId ? _self.docId : docId // ignore: cast_nullable_to_non_nullable
as String?,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self._imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as List<String>,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,correctAnswerRate: freezed == correctAnswerRate ? _self.correctAnswerRate : correctAnswerRate // ignore: cast_nullable_to_non_nullable
as double?,answerCount: freezed == answerCount ? _self.answerCount : answerCount // ignore: cast_nullable_to_non_nullable
as int?,goodCount: freezed == goodCount ? _self.goodCount : goodCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
