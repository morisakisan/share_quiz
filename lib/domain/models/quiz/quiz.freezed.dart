// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizTearOff {
  const _$QuizTearOff();

  _Quiz call(
      {required String documentId,
      required String title,
      required String question,
      required List<String> choices,
      required int correctAnswer,
      required DateTime createdAt,
      required double? car,
      required int? answerCount,
      String? imageUrl = null}) {
    return _Quiz(
      documentId: documentId,
      title: title,
      question: question,
      choices: choices,
      correctAnswer: correctAnswer,
      createdAt: createdAt,
      car: car,
      answerCount: answerCount,
      imageUrl: imageUrl,
    );
  }
}

/// @nodoc
const $Quiz = _$QuizTearOff();

/// @nodoc
mixin _$Quiz {
  String get documentId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get choices => throw _privateConstructorUsedError;
  int get correctAnswer => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  double? get car => throw _privateConstructorUsedError;
  int? get answerCount => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res>;
  $Res call(
      {String documentId,
      String title,
      String question,
      List<String> choices,
      int correctAnswer,
      DateTime createdAt,
      double? car,
      int? answerCount,
      String? imageUrl});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res> implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  final Quiz _value;
  // ignore: unused_field
  final $Res Function(Quiz) _then;

  @override
  $Res call({
    Object? documentId = freezed,
    Object? title = freezed,
    Object? question = freezed,
    Object? choices = freezed,
    Object? correctAnswer = freezed,
    Object? createdAt = freezed,
    Object? car = freezed,
    Object? answerCount = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: correctAnswer == freezed
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      car: car == freezed
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as double?,
      answerCount: answerCount == freezed
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$QuizCopyWith(_Quiz value, $Res Function(_Quiz) then) =
      __$QuizCopyWithImpl<$Res>;
  @override
  $Res call(
      {String documentId,
      String title,
      String question,
      List<String> choices,
      int correctAnswer,
      DateTime createdAt,
      double? car,
      int? answerCount,
      String? imageUrl});
}

/// @nodoc
class __$QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res>
    implements _$QuizCopyWith<$Res> {
  __$QuizCopyWithImpl(_Quiz _value, $Res Function(_Quiz) _then)
      : super(_value, (v) => _then(v as _Quiz));

  @override
  _Quiz get _value => super._value as _Quiz;

  @override
  $Res call({
    Object? documentId = freezed,
    Object? title = freezed,
    Object? question = freezed,
    Object? choices = freezed,
    Object? correctAnswer = freezed,
    Object? createdAt = freezed,
    Object? car = freezed,
    Object? answerCount = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_Quiz(
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: choices == freezed
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: correctAnswer == freezed
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      car: car == freezed
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as double?,
      answerCount: answerCount == freezed
          ? _value.answerCount
          : answerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Quiz with DiagnosticableTreeMixin implements _Quiz {
  const _$_Quiz(
      {required this.documentId,
      required this.title,
      required this.question,
      required this.choices,
      required this.correctAnswer,
      required this.createdAt,
      required this.car,
      required this.answerCount,
      this.imageUrl = null});

  @override
  final String documentId;
  @override
  final String title;
  @override
  final String question;
  @override
  final List<String> choices;
  @override
  final int correctAnswer;
  @override
  final DateTime createdAt;
  @override
  final double? car;
  @override
  final int? answerCount;
  @JsonKey(defaultValue: null)
  @override
  final String? imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quiz(documentId: $documentId, title: $title, question: $question, choices: $choices, correctAnswer: $correctAnswer, createdAt: $createdAt, car: $car, answerCount: $answerCount, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Quiz'))
      ..add(DiagnosticsProperty('documentId', documentId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('choices', choices))
      ..add(DiagnosticsProperty('correctAnswer', correctAnswer))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('car', car))
      ..add(DiagnosticsProperty('answerCount', answerCount))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Quiz &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.choices, choices) ||
                const DeepCollectionEquality()
                    .equals(other.choices, choices)) &&
            (identical(other.correctAnswer, correctAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.correctAnswer, correctAnswer)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.car, car) ||
                const DeepCollectionEquality().equals(other.car, car)) &&
            (identical(other.answerCount, answerCount) ||
                const DeepCollectionEquality()
                    .equals(other.answerCount, answerCount)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(choices) ^
      const DeepCollectionEquality().hash(correctAnswer) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(car) ^
      const DeepCollectionEquality().hash(answerCount) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  _$QuizCopyWith<_Quiz> get copyWith =>
      __$QuizCopyWithImpl<_Quiz>(this, _$identity);
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {required String documentId,
      required String title,
      required String question,
      required List<String> choices,
      required int correctAnswer,
      required DateTime createdAt,
      required double? car,
      required int? answerCount,
      String? imageUrl}) = _$_Quiz;

  @override
  String get documentId => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get question => throw _privateConstructorUsedError;
  @override
  List<String> get choices => throw _privateConstructorUsedError;
  @override
  int get correctAnswer => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  double? get car => throw _privateConstructorUsedError;
  @override
  int? get answerCount => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizCopyWith<_Quiz> get copyWith => throw _privateConstructorUsedError;
}
