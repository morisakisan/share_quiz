// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizForm {
  String? get title => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  XFile? get image => throw _privateConstructorUsedError;
  List<String>? get choices => throw _privateConstructorUsedError;
  int? get answer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizFormCopyWith<QuizForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizFormCopyWith<$Res> {
  factory $QuizFormCopyWith(QuizForm value, $Res Function(QuizForm) then) =
      _$QuizFormCopyWithImpl<$Res, QuizForm>;
  @useResult
  $Res call(
      {String? title,
      String? question,
      XFile? image,
      List<String>? choices,
      int? answer});
}

/// @nodoc
class _$QuizFormCopyWithImpl<$Res, $Val extends QuizForm>
    implements $QuizFormCopyWith<$Res> {
  _$QuizFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? question = freezed,
    Object? image = freezed,
    Object? choices = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizFormImplCopyWith<$Res>
    implements $QuizFormCopyWith<$Res> {
  factory _$$QuizFormImplCopyWith(
          _$QuizFormImpl value, $Res Function(_$QuizFormImpl) then) =
      __$$QuizFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? question,
      XFile? image,
      List<String>? choices,
      int? answer});
}

/// @nodoc
class __$$QuizFormImplCopyWithImpl<$Res>
    extends _$QuizFormCopyWithImpl<$Res, _$QuizFormImpl>
    implements _$$QuizFormImplCopyWith<$Res> {
  __$$QuizFormImplCopyWithImpl(
      _$QuizFormImpl _value, $Res Function(_$QuizFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? question = freezed,
    Object? image = freezed,
    Object? choices = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$QuizFormImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
      choices: freezed == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$QuizFormImpl with DiagnosticableTreeMixin implements _QuizForm {
  const _$QuizFormImpl(
      {this.title,
      this.question,
      this.image,
      final List<String>? choices,
      this.answer})
      : _choices = choices;

  @override
  final String? title;
  @override
  final String? question;
  @override
  final XFile? image;
  final List<String>? _choices;
  @override
  List<String>? get choices {
    final value = _choices;
    if (value == null) return null;
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? answer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizForm(title: $title, question: $question, image: $image, choices: $choices, answer: $answer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizForm'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('choices', choices))
      ..add(DiagnosticsProperty('answer', answer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizFormImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, question, image,
      const DeepCollectionEquality().hash(_choices), answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizFormImplCopyWith<_$QuizFormImpl> get copyWith =>
      __$$QuizFormImplCopyWithImpl<_$QuizFormImpl>(this, _$identity);
}

abstract class _QuizForm implements QuizForm {
  const factory _QuizForm(
      {final String? title,
      final String? question,
      final XFile? image,
      final List<String>? choices,
      final int? answer}) = _$QuizFormImpl;

  @override
  String? get title;
  @override
  String? get question;
  @override
  XFile? get image;
  @override
  List<String>? get choices;
  @override
  int? get answer;
  @override
  @JsonKey(ignore: true)
  _$$QuizFormImplCopyWith<_$QuizFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
