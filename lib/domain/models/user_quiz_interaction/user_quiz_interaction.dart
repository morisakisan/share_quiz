// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_quiz_interaction.freezed.dart';

@freezed
abstract class UserQuizInteraction with _$UserQuizInteraction {
  const factory UserQuizInteraction({
    required bool isLogin,
    required int? selectAnswer,
    required bool hasGood
  }) = _UserQuizInteraction;
}
