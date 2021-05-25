// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:share_quiz/presentation/page/quiz_detail.dart';
import 'package:share_quiz/presentation/page/quiz_post.dart';
import 'package:share_quiz/presentation/page/setting.dart';

class Nav {
  Nav._();

  static const QUIZ_POST = "quiz_post";
  static const QUIZ_DETAIL = "quiz_detail";
  static const SETTING = "setting";

  static final routes = <String, WidgetBuilder>{
    QUIZ_POST: (BuildContext context) => QuizPost(),
    QUIZ_DETAIL: (BuildContext context) => QuizDetail(),
    SETTING: (BuildContext context) => Setting()
  };
}
