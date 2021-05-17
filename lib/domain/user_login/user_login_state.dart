import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:share_quiz/domain/user/user_data.dart';
import 'package:flutter/foundation.dart';

part 'user_login_state.freezed.dart';

@freezed
abstract class UserLoginState with _$UserLoginState {
  factory UserLoginState(UserData? user) = Success;
  factory UserLoginState.loading() = Loading;
  factory UserLoginState.error(Exception error) = Error;
}