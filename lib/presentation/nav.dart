// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../presentation/screen/profile_screen.dart';
import '../presentation/screen/quiz_detail_screen.dart';
import '../presentation/screen/quiz_post_screen.dart';
import '../presentation/screen/setting_screen.dart';

// Project imports:

class Nav {
  Nav._();

  static const quizPost = "quiz_post";
  static const quizDetail = "quiz_detail";
  static const setting = "setting";
  static const profile= "profile";

  static final routes = <String, WidgetBuilder>{
    quizPost: (BuildContext context) => const QuizPostScreen(),
    quizDetail: (BuildContext context) => const QuizDetailScreen(),
    setting: (BuildContext context) => const SettingScreen(),
    profile: (BuildContext context) => const ProfileScreen()
  };
}
