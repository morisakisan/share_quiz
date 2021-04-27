import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_quiz/domain/user/user.dart';
import 'package:flutter/foundation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState(User user) = Success;
  factory UserState.loading() = Loading;
  factory UserState.error(Exception error) = Error;
}