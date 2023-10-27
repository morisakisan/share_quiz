// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:share_quiz/presentation/screen/profile_screen.dart';
import 'package:share_quiz/presentation/screen/quiz_detail_screen.dart';
import 'package:share_quiz/presentation/screen/quiz_post_screen.dart';
import 'package:share_quiz/presentation/screen/setting_screen.dart';

// Project imports:

class Nav {
  Nav._();

  static const QUIZ_POST = "quiz_post";
  static const QUIZ_DETAIL = "quiz_detail";
  static const SETTING = "setting";
  static const PROFILE= "profile";

  static final routes = <String, WidgetBuilder>{
    QUIZ_POST: (BuildContext context) => QuizPostScreen(),
    QUIZ_DETAIL: (BuildContext context) => QuizDetailScreen(),
    SETTING: (BuildContext context) => SettingScreen(),
    PROFILE: (BuildContext context) => ProfileScreen()
  };
}
