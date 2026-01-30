// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:share_quiz/features/post/presentation/screens/quiz_post_screen.dart';
import 'package:share_quiz/features/quiz_detail/presentation/screens/quiz_detail_screen.dart';
import 'package:share_quiz/features/profile/presentation/screens/profile_screen.dart';
import 'package:share_quiz/features/setting/presentation/screens/setting_screen.dart';

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
