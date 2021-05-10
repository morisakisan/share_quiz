// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz_post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizPostDataTearOff {
  const _$QuizPostDataTearOff();

  _QuizPostData call(
      {required String title,
      required String question,
      required List<String> choices,
      required int answer,
      File? imageFile = null}) {
    return _QuizPostData(
      title: title,
      question: question,
      choices: choices,
      answer: answer,
      imageFile: imageFile,
    );
  }
}

/// @nodoc
const $QuizPostData = _$QuizPostDataTearOff();

/// @nodoc
mixin _$QuizPostData {
  String get title => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get choices => throw _privateConstructorUsedError;
  int get answer => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizPostDataCopyWith<QuizPostData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPostDataCopyWith<$Res> {
  factory $QuizPostDataCopyWith(
          QuizPostData value, $Res Function(QuizPostData) then) =
      _$QuizPostDataCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String question,
      List<String> choices,
      int answer,
      File? imageFile});
}

/// @nodoc
class _$QuizPostDataCopyWithImpl<$Res> implements $QuizPostDataCopyWith<$Res> {
  _$QuizPostDataCopyWithImpl(this._value, this._then);

  final QuizPostData _value;
  // ignore: unused_field
  final $Res Function(QuizPostData) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? question = freezed,
    Object? choices = freezed,
    Object? answer = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
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
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$QuizPostDataCopyWith<$Res>
    implements $QuizPostDataCopyWith<$Res> {
  factory _$QuizPostDataCopyWith(
          _QuizPostData value, $Res Function(_QuizPostData) then) =
      __$QuizPostDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String question,
      List<String> choices,
      int answer,
      File? imageFile});
}

/// @nodoc
class __$QuizPostDataCopyWithImpl<$Res> extends _$QuizPostDataCopyWithImpl<$Res>
    implements _$QuizPostDataCopyWith<$Res> {
  __$QuizPostDataCopyWithImpl(
      _QuizPostData _value, $Res Function(_QuizPostData) _then)
      : super(_value, (v) => _then(v as _QuizPostData));

  @override
  _QuizPostData get _value => super._value as _QuizPostData;

  @override
  $Res call({
    Object? title = freezed,
    Object? question = freezed,
    Object? choices = freezed,
    Object? answer = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_QuizPostData(
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
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_QuizPostData with DiagnosticableTreeMixin implements _QuizPostData {
  const _$_QuizPostData(
      {required this.title,
      required this.question,
      required this.choices,
      required this.answer,
      this.imageFile = null});

  @override
  final String title;
  @override
  final String question;
  @override
  final List<String> choices;
  @override
  final int answer;
  @JsonKey(defaultValue: null)
  @override
  final File? imageFile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizPostData(title: $title, question: $question, choices: $choices, answer: $answer, imageFile: $imageFile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizPostData'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('choices', choices))
      ..add(DiagnosticsProperty('answer', answer))
      ..add(DiagnosticsProperty('imageFile', imageFile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuizPostData &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.choices, choices) ||
                const DeepCollectionEquality()
                    .equals(other.choices, choices)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(choices) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(imageFile);

  @JsonKey(ignore: true)
  @override
  _$QuizPostDataCopyWith<_QuizPostData> get copyWith =>
      __$QuizPostDataCopyWithImpl<_QuizPostData>(this, _$identity);
}

abstract class _QuizPostData implements QuizPostData {
  const factory _QuizPostData(
      {required String title,
      required String question,
      required List<String> choices,
      required int answer,
      File? imageFile}) = _$_QuizPostData;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get question => throw _privateConstructorUsedError;
  @override
  List<String> get choices => throw _privateConstructorUsedError;
  @override
  int get answer => throw _privateConstructorUsedError;
  @override
  File? get imageFile => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizPostDataCopyWith<_QuizPostData> get copyWith =>
      throw _privateConstructorUsedError;
}
