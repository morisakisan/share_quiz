// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';

@freezed
abstract class Answer with _$Answer {
  const factory Answer({
    required String id,
    required int select,
    required int userId,
  }) = _Answer;
}
