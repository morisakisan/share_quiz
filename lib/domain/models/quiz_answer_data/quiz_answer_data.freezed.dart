// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz_answer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizAnswerDataTearOff {
  const _$QuizAnswerDataTearOff();

  _QuizAnswerData call({required Quiz quiz, required int? select_anser}) {
    return _QuizAnswerData(
      quiz: quiz,
      select_anser: select_anser,
    );
  }
}

/// @nodoc
const $QuizAnswerData = _$QuizAnswerDataTearOff();

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
      _$QuizAnswerDataCopyWithImpl<$Res>;
  $Res call({Quiz quiz, int? select_anser});

  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class _$QuizAnswerDataCopyWithImpl<$Res>
    implements $QuizAnswerDataCopyWith<$Res> {
  _$QuizAnswerDataCopyWithImpl(this._value, this._then);

  final QuizAnswerData _value;
  // ignore: unused_field
  final $Res Function(QuizAnswerData) _then;

  @override
  $Res call({
    Object? quiz = freezed,
    Object? select_anser = freezed,
  }) {
    return _then(_value.copyWith(
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      select_anser: select_anser == freezed
          ? _value.select_anser
          : select_anser // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $QuizCopyWith<$Res> get quiz {
    return $QuizCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc
abstract class _$QuizAnswerDataCopyWith<$Res>
    implements $QuizAnswerDataCopyWith<$Res> {
  factory _$QuizAnswerDataCopyWith(
          _QuizAnswerData value, $Res Function(_QuizAnswerData) then) =
      __$QuizAnswerDataCopyWithImpl<$Res>;
  @override
  $Res call({Quiz quiz, int? select_anser});

  @override
  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class __$QuizAnswerDataCopyWithImpl<$Res>
    extends _$QuizAnswerDataCopyWithImpl<$Res>
    implements _$QuizAnswerDataCopyWith<$Res> {
  __$QuizAnswerDataCopyWithImpl(
      _QuizAnswerData _value, $Res Function(_QuizAnswerData) _then)
      : super(_value, (v) => _then(v as _QuizAnswerData));

  @override
  _QuizAnswerData get _value => super._value as _QuizAnswerData;

  @override
  $Res call({
    Object? quiz = freezed,
    Object? select_anser = freezed,
  }) {
    return _then(_QuizAnswerData(
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      select_anser: select_anser == freezed
          ? _value.select_anser
          : select_anser // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_QuizAnswerData
    with DiagnosticableTreeMixin
    implements _QuizAnswerData {
  const _$_QuizAnswerData({required this.quiz, required this.select_anser});

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
        (other is _QuizAnswerData &&
            (identical(other.quiz, quiz) ||
                const DeepCollectionEquality().equals(other.quiz, quiz)) &&
            (identical(other.select_anser, select_anser) ||
                const DeepCollectionEquality()
                    .equals(other.select_anser, select_anser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(quiz) ^
      const DeepCollectionEquality().hash(select_anser);

  @JsonKey(ignore: true)
  @override
  _$QuizAnswerDataCopyWith<_QuizAnswerData> get copyWith =>
      __$QuizAnswerDataCopyWithImpl<_QuizAnswerData>(this, _$identity);
}

abstract class _QuizAnswerData implements QuizAnswerData {
  const factory _QuizAnswerData(
      {required Quiz quiz, required int? select_anser}) = _$_QuizAnswerData;

  @override
  Quiz get quiz => throw _privateConstructorUsedError;
  @override
  int? get select_anser => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizAnswerDataCopyWith<_QuizAnswerData> get copyWith =>
      throw _privateConstructorUsedError;
}
