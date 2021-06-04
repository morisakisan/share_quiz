// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizDto _$QuizDtoFromJson(Map<String, dynamic> json) {
  return _QuizDto.fromJson(json);
}

/// @nodoc
class _$QuizDtoTearOff {
  const _$QuizDtoTearOff();

  _QuizDto call(
      {@JsonKey(ignore: true)
          String? docId,
      @JsonKey(name: 'correct_answer')
          required int correctAnswer,
      @JsonKey(name: 'title')
          required String title,
      @JsonKey(name: 'question')
          required String question,
      @JsonKey(name: 'image_url')
          required String imageUrl,
      @JsonKey(name: 'choices')
          required List<String> choices,
      @TimestampConverter()
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @JsonKey(name: 'user_id')
          required String userId,
      @JsonKey(name: 'correct_answer_rate')
          required double? car,
      @JsonKey(name: 'answer_count')
          required int? answerCount}) {
    return _QuizDto(
      docId: docId,
      correctAnswer: correctAnswer,
      title: title,
      question: question,
      imageUrl: imageUrl,
      choices: choices,
      createdAt: createdAt,
      userId: userId,
      car: car,
      answerCount: answerCount,
    );
  }

  QuizDto fromJson(Map<String, Object> json) {
    return QuizDto.fromJson(json);
  }
}

/// @nodoc
const $QuizDto = _$QuizDtoTearOff();

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
  String get imageUrl => throw _privateConstructorUsedError;
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
  int? get answerCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizDtoCopyWith<QuizDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDtoCopyWith<$Res> {
  factory $QuizDtoCopyWith(QuizDto value, $Res Function(QuizDto) then) =
      _$QuizDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? docId,
      @JsonKey(name: 'correct_answer') int correctAnswer,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'choices') List<String> choices,
      @TimestampConverter() @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'correct_answer_rate') double? car,
      @JsonKey(name: 'answer_count') int? answerCount});
}

/// @nodoc
class _$QuizDtoCopyWithImpl<$Res> implements $QuizDtoCopyWith<$Res> {
  _$QuizDtoCopyWithImpl(this._value, this._then);

  final QuizDto _value;
  // ignore: unused_field
  final $Res Function(QuizDto) _then;

  @override
  $Res call({
    Object? docId = freezed,
    Object? correctAnswer = freezed,
    Object? title = freezed,
    Object? question = freezed,
    Object? imageUrl = freezed,
    Object? choices = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? car = freezed,
    Object? answerCount = freezed,
  }) {
    return _then(_value.copyWith(
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: correctAnswer == freezed
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      car: car == freezed
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as double?,
      answerCount: answerCount == freezed
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$QuizDtoCopyWith<$Res> implements $QuizDtoCopyWith<$Res> {
  factory _$QuizDtoCopyWith(_QuizDto value, $Res Function(_QuizDto) then) =
      __$QuizDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? docId,
      @JsonKey(name: 'correct_answer') int correctAnswer,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'choices') List<String> choices,
      @TimestampConverter() @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'correct_answer_rate') double? car,
      @JsonKey(name: 'answer_count') int? answerCount});
}

/// @nodoc
class __$QuizDtoCopyWithImpl<$Res> extends _$QuizDtoCopyWithImpl<$Res>
    implements _$QuizDtoCopyWith<$Res> {
  __$QuizDtoCopyWithImpl(_QuizDto _value, $Res Function(_QuizDto) _then)
      : super(_value, (v) => _then(v as _QuizDto));

  @override
  _QuizDto get _value => super._value as _QuizDto;

  @override
  $Res call({
    Object? docId = freezed,
    Object? correctAnswer = freezed,
    Object? title = freezed,
    Object? question = freezed,
    Object? imageUrl = freezed,
    Object? choices = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? car = freezed,
    Object? answerCount = freezed,
  }) {
    return _then(_QuizDto(
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswer: correctAnswer == freezed
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      car: car == freezed
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as double?,
      answerCount: answerCount == freezed
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizDto with DiagnosticableTreeMixin implements _QuizDto {
  const _$_QuizDto(
      {@JsonKey(ignore: true)
          this.docId,
      @JsonKey(name: 'correct_answer')
          required this.correctAnswer,
      @JsonKey(name: 'title')
          required this.title,
      @JsonKey(name: 'question')
          required this.question,
      @JsonKey(name: 'image_url')
          required this.imageUrl,
      @JsonKey(name: 'choices')
          required this.choices,
      @TimestampConverter()
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @JsonKey(name: 'user_id')
          required this.userId,
      @JsonKey(name: 'correct_answer_rate')
          required this.car,
      @JsonKey(name: 'answer_count')
          required this.answerCount});

  factory _$_QuizDto.fromJson(Map<String, dynamic> json) =>
      _$_$_QuizDtoFromJson(json);

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
  final String imageUrl;
  @override
  @JsonKey(name: 'choices')
  final List<String> choices;
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
  final int? answerCount;

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
        (other is _QuizDto &&
            (identical(other.docId, docId) ||
                const DeepCollectionEquality().equals(other.docId, docId)) &&
            (identical(other.correctAnswer, correctAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.correctAnswer, correctAnswer)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.choices, choices) ||
                const DeepCollectionEquality()
                    .equals(other.choices, choices)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.car, car) ||
                const DeepCollectionEquality().equals(other.car, car)) &&
            (identical(other.answerCount, answerCount) ||
                const DeepCollectionEquality()
                    .equals(other.answerCount, answerCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(docId) ^
      const DeepCollectionEquality().hash(correctAnswer) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(choices) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(car) ^
      const DeepCollectionEquality().hash(answerCount);

  @JsonKey(ignore: true)
  @override
  _$QuizDtoCopyWith<_QuizDto> get copyWith =>
      __$QuizDtoCopyWithImpl<_QuizDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuizDtoToJson(this);
  }
}

abstract class _QuizDto implements QuizDto {
  const factory _QuizDto(
      {@JsonKey(ignore: true)
          String? docId,
      @JsonKey(name: 'correct_answer')
          required int correctAnswer,
      @JsonKey(name: 'title')
          required String title,
      @JsonKey(name: 'question')
          required String question,
      @JsonKey(name: 'image_url')
          required String imageUrl,
      @JsonKey(name: 'choices')
          required List<String> choices,
      @TimestampConverter()
      @JsonKey(name: 'created_at')
          required DateTime createdAt,
      @JsonKey(name: 'user_id')
          required String userId,
      @JsonKey(name: 'correct_answer_rate')
          required double? car,
      @JsonKey(name: 'answer_count')
          required int? answerCount}) = _$_QuizDto;

  factory _QuizDto.fromJson(Map<String, dynamic> json) = _$_QuizDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get docId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'correct_answer')
  int get correctAnswer => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'choices')
  List<String> get choices => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'correct_answer_rate')
  double? get car => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'answer_count')
  int? get answerCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizDtoCopyWith<_QuizDto> get copyWith =>
      throw _privateConstructorUsedError;
}
