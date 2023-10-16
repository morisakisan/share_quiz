// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

// Project imports:
import 'package:share_quiz/domain/models/user/user_data.dart';

// Project imports:

part 'setting.freezed.dart';

@freezed
abstract class Setting with _$Setting {
  const factory Setting({
    required PackageInfo packageInfo,
    required bool isLogin,
  }) = _Setting;
}
