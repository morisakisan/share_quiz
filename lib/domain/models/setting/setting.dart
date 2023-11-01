// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'setting.freezed.dart';

@freezed
abstract class Setting with _$Setting {
  const factory Setting({
    required PackageInfo packageInfo,
    required bool isLogin,
  }) = _Setting;
}
