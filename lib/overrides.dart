// Project imports:
import 'package:share_quiz/core/presentation/providers/core_overrides.dart';
import 'package:share_quiz/features/home/presentation/providers/home_overrides.dart';
import 'package:share_quiz/features/post/presentation/providers/post_overrides.dart';
import 'package:share_quiz/features/quiz_detail/presentation/providers/quiz_detail_overrides.dart';
import 'package:share_quiz/features/profile/presentation/providers/profile_overrides.dart';
import 'package:share_quiz/features/setting/presentation/providers/setting_overrides.dart';

final allOverrides = [
  ...coreOverrides,
  ...homeOverrides,
  ...postOverrides,
  ...quizDetailOverrides,
  ...profileOverrides,
  ...settingOverrides,
];
