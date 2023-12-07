// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required String uid,
    required String? name,
    required String? photoUrl
  }) = _UserData;
}
