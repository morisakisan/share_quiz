// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_post_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$QuizPostDataCopyWithImpl<$Res, QuizPostData>;
  @useResult
  $Res call(
      {String title,
      String question,
      List<String> choices,
      int answer,
      File? imageFile});
}

/// @nodoc
class _$QuizPostDataCopyWithImpl<$Res, $Val extends QuizPostData>
    implements $QuizPostDataCopyWith<$Res> {
  _$QuizPostDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? question = null,
    Object? choices = null,
    Object? answer = null,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizPostDataImplCopyWith<$Res>
    implements $QuizPostDataCopyWith<$Res> {
  factory _$$QuizPostDataImplCopyWith(
          _$QuizPostDataImpl value, $Res Function(_$QuizPostDataImpl) then) =
      __$$QuizPostDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String question,
      List<String> choices,
      int answer,
      File? imageFile});
}

/// @nodoc
class __$$QuizPostDataImplCopyWithImpl<$Res>
    extends _$QuizPostDataCopyWithImpl<$Res, _$QuizPostDataImpl>
    implements _$$QuizPostDataImplCopyWith<$Res> {
  __$$QuizPostDataImplCopyWithImpl(
      _$QuizPostDataImpl _value, $Res Function(_$QuizPostDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? question = null,
    Object? choices = null,
    Object? answer = null,
    Object? imageFile = freezed,
  }) {
    return _then(_$QuizPostDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$QuizPostDataImpl with DiagnosticableTreeMixin implements _QuizPostData {
  const _$QuizPostDataImpl(
      {required this.title,
      required this.question,
      required final List<String> choices,
      required this.answer,
      this.imageFile = null})
      : _choices = choices;

  @override
  final String title;
  @override
  final String question;
  final List<String> _choices;
  @override
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final int answer;
  @override
  @JsonKey()
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
        (other.runtimeType == runtimeType &&
            other is _$QuizPostDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, question,
      const DeepCollectionEquality().hash(_choices), answer, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizPostDataImplCopyWith<_$QuizPostDataImpl> get copyWith =>
      __$$QuizPostDataImplCopyWithImpl<_$QuizPostDataImpl>(this, _$identity);
}

abstract class _QuizPostData implements QuizPostData {
  const factory _QuizPostData(
      {required final String title,
      required final String question,
      required final List<String> choices,
      required final int answer,
      final File? imageFile}) = _$QuizPostDataImpl;

  @override
  String get title;
  @override
  String get question;
  @override
  List<String> get choices;
  @override
  int get answer;
  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$QuizPostDataImplCopyWith<_$QuizPostDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
