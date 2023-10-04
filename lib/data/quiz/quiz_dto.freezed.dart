// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizDto _$QuizDtoFromJson(Map<String, dynamic> json) {
  return _QuizDto.fromJson(json);
}

/// @nodoc
mixin _$QuizDto {
  @JsonKey(ignore: true)
  String? get docId => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  int get correctAnswer => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'choices')
  List<String> get choices => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer_rate')
  double? get car => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_count')
  int get answerCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizDtoCopyWith<QuizDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDtoCopyWith<$Res> {
  factory $QuizDtoCopyWith(QuizDto value, $Res Function(QuizDto) then) =
      _$QuizDtoCopyWithImpl<$Res, QuizDto>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? docId,
      @JsonKey(name: 'correct_answer') int correctAnswer,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'choices') List<String> choices,
      @TimestampConverter() @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'correct_answer_rate') double? car,
      @JsonKey(name: 'answer_count') int answerCount});
}

/// @nodoc
class _$QuizDtoCopyWithImpl<$Res, $Val extends QuizDto>
    implements $QuizDtoCopyWith<$Res> {
  _$QuizDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? correctAnswer = null,
    Object? title = null,
    Object? question = null,
    Object? imageUrl = freezed,
    Object? choices = null,
    Object? createdAt = null,
    Object? userId = null,
    Object? car = freezed,
    Object? answerCount = null,
  }) {
    return _then(_value.copyWith(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as double?,
      answerCount: null == answerCount
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizDtoImplCopyWith<$Res> implements $QuizDtoCopyWith<$Res> {
  factory _$$QuizDtoImplCopyWith(
          _$QuizDtoImpl value, $Res Function(_$QuizDtoImpl) then) =
      __$$QuizDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String? docId,
      @JsonKey(name: 'correct_answer') int correctAnswer,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'choices') List<String> choices,
      @TimestampConverter() @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'correct_answer_rate') double? car,
      @JsonKey(name: 'answer_count') int answerCount});
}

/// @nodoc
class __$$QuizDtoImplCopyWithImpl<$Res>
    extends _$QuizDtoCopyWithImpl<$Res, _$QuizDtoImpl>
    implements _$$QuizDtoImplCopyWith<$Res> {
  __$$QuizDtoImplCopyWithImpl(
      _$QuizDtoImpl _value, $Res Function(_$QuizDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? correctAnswer = null,
    Object? title = null,
    Object? question = null,
    Object? imageUrl = freezed,
    Object? choices = null,
    Object? createdAt = null,
    Object? userId = null,
    Object? car = freezed,
    Object? answerCount = null,
  }) {
    return _then(_$QuizDtoImpl(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as double?,
      answerCount: null == answerCount
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizDtoImpl with DiagnosticableTreeMixin implements _QuizDto {
  const _$QuizDtoImpl(
      {@JsonKey(ignore: true) this.docId,
      @JsonKey(name: 'correct_answer') required this.correctAnswer,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'question') required this.question,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'choices') required final List<String> choices,
      @TimestampConverter()
      @JsonKey(name: 'created_at')
      required this.createdAt,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'correct_answer_rate') required this.car,
      @JsonKey(name: 'answer_count') required this.answerCount})
      : _choices = choices;

  factory _$QuizDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizDtoImplFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? docId;
  @override
  @JsonKey(name: 'correct_answer')
  final int correctAnswer;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'question')
  final String question;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final List<String> _choices;
  @override
  @JsonKey(name: 'choices')
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'correct_answer_rate')
  final double? car;
  @override
  @JsonKey(name: 'answer_count')
  final int answerCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizDto(docId: $docId, correctAnswer: $correctAnswer, title: $title, question: $question, imageUrl: $imageUrl, choices: $choices, createdAt: $createdAt, userId: $userId, car: $car, answerCount: $answerCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizDto'))
      ..add(DiagnosticsProperty('docId', docId))
      ..add(DiagnosticsProperty('correctAnswer', correctAnswer))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('choices', choices))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('car', car))
      ..add(DiagnosticsProperty('answerCount', answerCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizDtoImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.answerCount, answerCount) ||
                other.answerCount == answerCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      docId,
      correctAnswer,
      title,
      question,
      imageUrl,
      const DeepCollectionEquality().hash(_choices),
      createdAt,
      userId,
      car,
      answerCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizDtoImplCopyWith<_$QuizDtoImpl> get copyWith =>
      __$$QuizDtoImplCopyWithImpl<_$QuizDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizDtoImplToJson(
      this,
    );
  }
}

abstract class _QuizDto implements QuizDto {
  const factory _QuizDto(
          {@JsonKey(ignore: true) final String? docId,
          @JsonKey(name: 'correct_answer') required final int correctAnswer,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'question') required final String question,
          @JsonKey(name: 'image_url') required final String? imageUrl,
          @JsonKey(name: 'choices') required final List<String> choices,
          @TimestampConverter()
          @JsonKey(name: 'created_at')
          required final DateTime createdAt,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'correct_answer_rate') required final double? car,
          @JsonKey(name: 'answer_count') required final int answerCount}) =
      _$QuizDtoImpl;

  factory _QuizDto.fromJson(Map<String, dynamic> json) = _$QuizDtoImpl.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get docId;
  @override
  @JsonKey(name: 'correct_answer')
  int get correctAnswer;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'question')
  String get question;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'choices')
  List<String> get choices;
  @override
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'correct_answer_rate')
  double? get car;
  @override
  @JsonKey(name: 'answer_count')
  int get answerCount;
  @override
  @JsonKey(ignore: true)
  _$$QuizDtoImplCopyWith<_$QuizDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
