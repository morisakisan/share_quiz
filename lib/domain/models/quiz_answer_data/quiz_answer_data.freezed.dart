// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_answer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizAnswerData {
  Quiz get quiz => throw _privateConstructorUsedError;
  int? get select_anser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizAnswerDataCopyWith<QuizAnswerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerDataCopyWith<$Res> {
  factory $QuizAnswerDataCopyWith(
          QuizAnswerData value, $Res Function(QuizAnswerData) then) =
      _$QuizAnswerDataCopyWithImpl<$Res, QuizAnswerData>;
  @useResult
  $Res call({Quiz quiz, int? select_anser});

  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class _$QuizAnswerDataCopyWithImpl<$Res, $Val extends QuizAnswerData>
    implements $QuizAnswerDataCopyWith<$Res> {
  _$QuizAnswerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = null,
    Object? select_anser = freezed,
  }) {
    return _then(_value.copyWith(
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      select_anser: freezed == select_anser
          ? _value.select_anser
          : select_anser // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuizCopyWith<$Res> get quiz {
    return $QuizCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizAnswerDataImplCopyWith<$Res>
    implements $QuizAnswerDataCopyWith<$Res> {
  factory _$$QuizAnswerDataImplCopyWith(_$QuizAnswerDataImpl value,
          $Res Function(_$QuizAnswerDataImpl) then) =
      __$$QuizAnswerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Quiz quiz, int? select_anser});

  @override
  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class __$$QuizAnswerDataImplCopyWithImpl<$Res>
    extends _$QuizAnswerDataCopyWithImpl<$Res, _$QuizAnswerDataImpl>
    implements _$$QuizAnswerDataImplCopyWith<$Res> {
  __$$QuizAnswerDataImplCopyWithImpl(
      _$QuizAnswerDataImpl _value, $Res Function(_$QuizAnswerDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quiz = null,
    Object? select_anser = freezed,
  }) {
    return _then(_$QuizAnswerDataImpl(
      quiz: null == quiz
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      select_anser: freezed == select_anser
          ? _value.select_anser
          : select_anser // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$QuizAnswerDataImpl
    with DiagnosticableTreeMixin
    implements _QuizAnswerData {
  const _$QuizAnswerDataImpl({required this.quiz, required this.select_anser});

  @override
  final Quiz quiz;
  @override
  final int? select_anser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizAnswerData(quiz: $quiz, select_anser: $select_anser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizAnswerData'))
      ..add(DiagnosticsProperty('quiz', quiz))
      ..add(DiagnosticsProperty('select_anser', select_anser));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizAnswerDataImpl &&
            (identical(other.quiz, quiz) || other.quiz == quiz) &&
            (identical(other.select_anser, select_anser) ||
                other.select_anser == select_anser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quiz, select_anser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizAnswerDataImplCopyWith<_$QuizAnswerDataImpl> get copyWith =>
      __$$QuizAnswerDataImplCopyWithImpl<_$QuizAnswerDataImpl>(
          this, _$identity);
}

abstract class _QuizAnswerData implements QuizAnswerData {
  const factory _QuizAnswerData(
      {required final Quiz quiz,
      required final int? select_anser}) = _$QuizAnswerDataImpl;

  @override
  Quiz get quiz;
  @override
  int? get select_anser;
  @override
  @JsonKey(ignore: true)
  _$$QuizAnswerDataImplCopyWith<_$QuizAnswerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
